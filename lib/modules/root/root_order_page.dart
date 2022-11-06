import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../router/application.dart';
import '../../router/router.dart';

class RooteOrderPage extends StatefulWidget {
  const RooteOrderPage({Key? key}) : super(key: key);

  @override
  State<RooteOrderPage> createState() => _RooteOrderPageState();
}

class _RooteOrderPageState extends State<RooteOrderPage> {
  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'RootClimb');

  @override
  void initState() {
    configRouter();
    super.initState();
  }

  void configRouter() {
    final router = FluroRouter();
    OrderRouters.configureRouter(router);
    Application.orderRouter = router;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
          key: navigatorKey,
          onGenerateRoute: Application.orderRouter.generator,
        ),
        onWillPop: () async {
          return !navigatorKey.currentState!.canPop();
        });
  }
}
