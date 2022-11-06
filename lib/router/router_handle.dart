
import 'package:base_bloc/modules/tab_account/tab_account.dart';
import 'package:base_bloc/modules/tab_notification/tab_notification.dart';
import 'package:fluro/fluro.dart';

import '../modules/home/home_page.dart';
import '../modules/splash/splash_page.dart';
import '../modules/tab_home/tab_home.dart';
import '../modules/tab_order/tab_order.dart';

var routeSplash = Handler(handlerFunc: (c, p) => const SplashPage());
var routeHome = Handler(handlerFunc: (c, p) => const HomePage());
var routeTabHome = Handler(handlerFunc: (c, p) => const TabHome());
var routeTabOrder = Handler(handlerFunc: (c, p) => const TabOrder());
var routeTabNotification = Handler(handlerFunc: (c, p) => const TabNotification());
var routeTabAccount = Handler(handlerFunc: (c, p) => const TabAccount());
