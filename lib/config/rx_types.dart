/*
  RxTypes used across the app 
*/

import 'enums.dart';
import 'package:get/get.dart';

final Rx<AuthenticationState> authState = Rx(AuthenticationState.loggedOut);
