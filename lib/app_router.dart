import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/screens/login_screen.dart';
import 'package:flutter_maps/presentation/screens/otp_screen.dart';
import 'constants/strings.dart';
class AppRouter{

  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case otpScreen:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
    }
  }
}