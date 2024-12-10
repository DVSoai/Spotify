import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/sources/local/local_storage.dart';
import 'locale_manager_event.dart';
import 'locale_manager_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LocalStorage localStorage;

  LanguageBloc(this.localStorage) : super(LanguageState(localStorage.locale)) {
    on<ChangeLanguageEvent>((event, emit) async {
      localStorage.locale = event.locale;
      emit(LanguageState(event.locale));
    });
  }
}