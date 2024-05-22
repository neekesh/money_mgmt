import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_export.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  Future<void> setAccessToken(String value) {
    return _sharedPreferences!.setString("accessToken", value);
  }

  Future<void> setNotificationID(int id) {
    return _sharedPreferences!.setInt("notification_id", id);
  }

  Future<void> setEmail(String email) {
    return _sharedPreferences!.setString("email", email);
  }

  Future<void> setAddress(String address) {
    return _sharedPreferences!.setString("address", address);
  }

  Future<void> setPhoneNumber(String phone) {
    return _sharedPreferences!.setString("phone", phone);
  }

  String? getAccessToken() => _sharedPreferences!.getString("accessToken");

  String? getAddress() => _sharedPreferences!.getString("address");
  String? getPhone() => _sharedPreferences!.getString("phone");
  String? getEmail() => _sharedPreferences!.getString("email");

  int? getNotificationID() => _sharedPreferences!.getInt("notification_id");

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}
