part of 'pages.dart';

abstract class Routes {
  static const splash = _Paths.splash;
  static const signin = _Paths.signin;
  static const signup = _Paths.signup;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const splash = '/splash';
  static const signin = '/signin';
  static const signup = '/signup';
  static const home = '/home';
}