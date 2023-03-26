import 'package:controlpet/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:controlpet/modules/dashboard/pages/dashboard.dart';
import 'package:controlpet/modules/login/bloc/login_bloc.dart';
import 'package:controlpet/modules/login/pages/login_page.dart';
import 'package:controlpet/modules/register/bloc/register_bloc.dart';
import 'package:controlpet/modules/register/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  final LoginBloc _loginBloc = LoginBloc();
  final RegisterBloc _registerBloc = RegisterBloc();
  final DashboardBloc _dashboardBloc = DashboardBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>.value(
            value: _loginBloc,
            child: const LoginPage(title: "Login"),
          ),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterBloc>.value(
            value: _registerBloc,
            child: const RegisterPage(title: "Register"),
          ),
        );

      case '/dashboard':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<DashboardBloc>.value(
              value: _dashboardBloc,
              child: Dashboard(title: "Dashboard", username: args),
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR IN NAVIGATION'),
        ),
      );
    });
  }
}
