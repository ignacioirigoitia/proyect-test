import 'package:fluro/fluro.dart';
import 'package:flutter_compress_test/router/admin_handler.dart';

class Flurorouter{
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';
  static String videoRoute = '/videos';

  static void configureRoutes(){
    router.define(rootRoute, handler: AdminHandler.root, transitionType: TransitionType.none);
    router.define(videoRoute, handler: AdminHandler.videos, transitionType: TransitionType.none);
  }
}