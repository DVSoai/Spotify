import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageKey {
  const LocalStorageKey._();
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const currentUser = 'currentUser';
  static const isDarkMode = 'isDarkMode';
  static const languageCode = 'languageCode';
  static const changeLanguage = 'changeLanguage';
}

abstract class LocalStorage {
  Future<void> init();

  bool get darkMode;

  set darkMode(bool isDarkMode);

  Locale get locale;

  set locale(Locale locale);

  String? get accessToken;

  set accessToken(String? accessToken);

  String? get refreshToken;

  set refreshToken(String? refreshToken);

}

class LocalStorageImpl implements LocalStorage {
  late GetStorage _storage;

  LocalStorageImpl() {
    _storage = GetStorage('Spotify');
  }

  @override
  init() async {
    await _storage.initStorage;
  }

  @override
  bool get darkMode {
    return _storage.read(LocalStorageKey.isDarkMode) ?? false;
  }

  @override
  set darkMode(bool isDarkMode) {
    _storage.write(LocalStorageKey.isDarkMode, isDarkMode);
  }

  @override
  Locale get locale {
    String languageCode = _storage.read(LocalStorageKey.languageCode) ?? 'vi';
    return Locale(languageCode);
  }

  @override
  set locale(Locale locale) {
    _storage.write(LocalStorageKey.languageCode, locale.languageCode);
  }

  @override
  String? get accessToken {
    return _storage.read(LocalStorageKey.accessToken) ?? '';
  }

  @override
  set accessToken(String? accessToken) {
    _storage.write(LocalStorageKey.accessToken, accessToken);
  }

  @override
  String? get refreshToken {
    return _storage.read(LocalStorageKey.refreshToken) ?? '';
  }

  @override
  set refreshToken(String? refreshToken) {
    _storage.write(LocalStorageKey.refreshToken, refreshToken);
  }
}
