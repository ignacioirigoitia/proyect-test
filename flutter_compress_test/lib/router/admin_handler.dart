import 'package:fluro/fluro.dart';
import 'package:flutter_compress_test/home.dart';

class AdminHandler{
  static Handler root = new Handler(
    handlerFunc: (context, params){
      return HomeReactions();
    }
  );

  static Handler videos = new Handler(
    handlerFunc: (context, params){
      return HomeReactions();
    }
  );
}