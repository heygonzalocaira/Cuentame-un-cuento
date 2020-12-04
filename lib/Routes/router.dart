import 'package:arma_tu_cuento/MenuScreen/MenuScreen.dart';

import 'package:get/route_manager.dart';
import 'package:arma_tu_cuento/Routes/routingConstants.dart';

class Router {
  static List<GetPage> getPages = [
    GetPage(
      name: RouteNames.MenuScreenNavigatorRoute,
      page: () => MenuScreen(),
    ),
    GetPage(
      name: RouteNames.StoryScreenNavigatorRoute,
      page: () => MenuScreen(), // Cambiar por clase StoryScreen
    ),
  ];
}
