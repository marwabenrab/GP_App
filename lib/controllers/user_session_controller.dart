import 'package:fikra_app/config/enums.dart';
import 'package:fikra_app/config/rx_types.dart';
import 'package:fikra_app/config/static_values.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // استيراد حزمة SharedPreferences

class UserSessionController extends GetxController
    with StateMixin<AuthenticationState> {
  static UserSessionController get to => Get.find();

  /// instance

  RxBool isLocked = true.obs;

  int idFarmer = 0;

  /// [checkAuthStatus] -- Check current user status
  checkAuthStatus() async {
    // استرجاع SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // استخدام SharedPreferences للتحقق من حالة تسجيل الدخول
    bool isUserLoggedIn = prefs.getBool(StaticValues.isUserLoggedIn) ?? false;

    // التحقق مما إذا كان المستخدم مسجّل الدخول أم لا
    if (isUserLoggedIn) {
      authState.value = AuthenticationState.loggedIn;
      isLocked.value = false;
      update();
      change(AuthenticationState.loggedIn, status: RxStatus.success());
    }
  }

  logout() async {
    // استرجاع SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // التحقق مما إذا كان المستخدم مسجّل الدخول أم لا
    bool isUserLoggedIn = prefs.getBool(StaticValues.isUserLoggedIn) ?? false;

    if (isUserLoggedIn) {
      authState.value = AuthenticationState.loggedOut;
      isLocked.value = true;
      await prefs.remove(StaticValues.isUserLoggedIn);

      change(AuthenticationState.loggedOut, status: RxStatus.success());
      update();
      Fluttertoast.showToast(
        msg: 'Vous êtes déconnecté',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 25.0,
      );
    }
  }

  @override
  void onReady() async {
    await checkAuthStatus();
    super.onReady();
  }
}
