import 'package:base_bloc/router/application.dart';
import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class RootNotificationPage extends StatefulWidget {
  const RootNotificationPage({Key? key}) : super(key: key);

  @override
  State<RootNotificationPage> createState() => _RootNotificationPageState();
}

class _RootNotificationPageState extends State<RootNotificationPage> {
  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'RootProfile');

  @override
  void initState() {
    configRouter();
    super.initState();
  }

  void configRouter() {
    var router = FluroRouter();
    NotificationRouters.configureRouter(router);
    Application.notificationRouter = router;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
            key: navigatorKey,
            onGenerateRoute: Application.notificationRouter.generator),
        onWillPop: () async => navigatorKey.currentState!.canPop());
  }
}
