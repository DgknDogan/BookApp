import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OpeningRoute.page, initial: true, path: "/opening"),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: RegisterRoute.page, path: "/register"),
        AutoRoute(page: HomeRoute.page, path: "/home"),
        AutoRoute(page: CategoryRoute.page, path: "/category"),
        AutoRoute(page: BookDetails.page, path: "/detail"),
      ];
}
