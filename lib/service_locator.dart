
import 'package:get_it/get_it.dart';
import 'package:spotify/domain/usecases/auth/get_user.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/get_favorite_songs.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';

import 'data/repository/auth/auth_repository_impl.dart';
import 'data/repository/song/song_repository_impl.dart';
import 'data/sources/auth/auth_firebase_service.dart';
import 'data/sources/song/song_firebase_service.dart';
import 'domain/repository/auth/auth.dart';
import 'domain/repository/song/song.dart';
import 'domain/usecases/auth/signin.dart';
import 'domain/usecases/song/add_or_remove_favorite_song.dart';
import 'domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<AuthFirebaseService>(() => AuthFirebaseServiceImpl());
  sl.registerLazySingleton<SongRepository>(() => SongRepositoryImpl());
  sl.registerLazySingleton<SongFirebaseService>(() =>SongFirebaseServiceImpl());
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );
  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );
  sl.registerSingleton<GetPlayListUseCase>(
    GetPlayListUseCase(),
  );
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
      AddOrRemoveFavoriteSongUseCase()
  );

  sl.registerSingleton<IsFavoriteSongUseCase>(
      IsFavoriteSongUseCase()
  );
  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase()
  );
  sl.registerSingleton<GetFavoriteSongsUseCase>(
      GetFavoriteSongsUseCase()
  );

}