import 'package:air_bnb/business_logic/bottom_navigation_screen/bottom_navigation_screen_bloc.dart';
import 'package:air_bnb/business_logic/bottom_sheet/bottom_sheet_bloc.dart';
import 'package:air_bnb/business_logic/bottom_sheet/login_screen_ui.dart';
import 'package:air_bnb/business_logic/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String bottomSheet = 'loginScreenBottomSheet';
}

class RouteGenerator {
  final BottomNavigationScreenBloc _bottomNavigationScreenBloc =
      BottomNavigationScreenBloc();
  final BottomSheetBloc _bottomSheetBloc = BottomSheetBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _bottomNavigationScreenBloc,
                  child: const NavigationScreen(),
                ));
      case AppRoutes.bottomSheet:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _bottomSheetBloc,
                  child: const LoginScreenUi(),
                ));

      default:
        return _errorRoute('Unknown Route ${settings.name}');
    }
  }

  static Route<dynamic> _errorRoute(String errorMessage) {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text(errorMessage),
        ),
      );
    });
  }
}
