import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // Splash
        AutoRoute(page: SplashRoute.page, path: '/'),

        // Home
        AutoRoute(page: HomeRoute.page, path: '/app'),
      ];
}
