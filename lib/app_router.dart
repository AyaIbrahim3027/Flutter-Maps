import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/data/api_service/places.dart';
import 'package:flutter_maps/presentation/screens/login_screen.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';
import 'package:flutter_maps/presentation/screens/otp_screen.dart';
import 'business_logic/cubit/maps/maps_cubit.dart';
import 'constants/strings.dart';
import 'data/repos/maps_repo.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: const LoginScreen(),
                ));

      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: OTPScreen(phoneNumber: phoneNumber),
                ));

      case mapScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => MapsCubit(MapsRepo(Places())),
                  child: const MapScreen(),
                ));
    }
    return null;
  }
}
