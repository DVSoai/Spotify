import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/configs/constants/app_url.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/data/models/auth/user.dart';
import 'package:spotify/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserReq signinUserReq);

  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either>getUser();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq)async {

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);

      return Right('Signin was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either>signup(CreateUserReq createUserReq) async {
    try {
     var data =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

     FirebaseFirestore.instance.collection('Users').doc(data.user?.uid).set(
       {
          'email': data.user?.email,
          'name': createUserReq.fullName,
       }
     );
      return Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
    String message = '';
    if (e.code == 'weak-password') {
      message = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      message = 'The account already exists for that email.';
    }
    return Left(message);
    }
  }

  @override
  Future<Either> getUser()async {
   try{
     FirebaseAuth firebaseAuth = FirebaseAuth.instance;
     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
     var user = await firebaseFirestore.collection('Users').doc(firebaseAuth.currentUser?.uid).get();

     UserModel userModel  = UserModel.fromJson(user.data()!);
     userModel.imageURL = firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
     UserEntity userEntity = userModel.toEntity();
     return Right(userEntity);
   }catch(e){
     return Left('An error occurred');
   }
  }
}
