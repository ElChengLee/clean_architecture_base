import 'package:auto_route/annotations.dart';

import '../../features/home/home_screen.dart';
import '../../features/login/login_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LoginScreen, initial: true, path: "LoginScreen"),
  AutoRoute(page: HomeScreen, path: "HomeScreen"),
])
class $FeatureRouter {}
