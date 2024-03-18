import 'dart:convert';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_USER = "PREFS_KEY_USER";
const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_USER_ROLE = "PREFS_KEY_USER_ROLE";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";

class LocalStorageService {

  final SharedPreferences _sharedPreferences;

  LocalStorageService(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setLanguageChanged() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      // save prefs with english lang
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // save prefs with arabic lang
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
    _sharedPreferences.reload();
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      // return arabic local
      return ARABIC_LOCAL;
    } else {
      // return english local
      return ENGLISH_LOCAL;
    }
  }


  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, "Bearer $token");
    _sharedPreferences.reload();
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }

  UserData? get userData {
    final rawJson = _sharedPreferences.getString(PREFS_KEY_USER);
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return UserData.fromJson(map);
  }

  Future<void> setUser(UserData? value) async {
    if (value != null) {
      _sharedPreferences.setString(PREFS_KEY_USER, json.encode(value.toJson()));
    } else {
      _sharedPreferences.remove(PREFS_KEY_USER);
    }
    _sharedPreferences.reload();
  }


  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
    _sharedPreferences.reload();
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> setUserRole(int role) async {
    _sharedPreferences.setInt(PREFS_KEY_USER_ROLE, role);
    _sharedPreferences.reload();
  }

  Future<int> getUserRole() async {
    return _sharedPreferences.getInt(PREFS_KEY_USER_ROLE) ?? 5;
  }

  Future<void> logout() async {
    _sharedPreferences.clear();
    _sharedPreferences.reload();
  }

  
}
