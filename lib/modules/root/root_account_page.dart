import 'package:base_bloc/router/application.dart';
import 'package:base_bloc/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class RootAccountPage extends StatefulWidget {
  const RootAccountPage({Key? key}) : super(key: key);

  @override
  State<RootAccountPage> createState() => _RootAccountPageState();
}

class _RootAccountPageState extends State<RootAccountPage> {
  final _navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'RootReservation');

  @override
  void initState() {
    configRouter();
    super.initState();
  }

  void configRouter() {
    var router = FluroRouter();
    AccountRouters.configureRouter(router);
    Application.accountRouter = router;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
          key: _navigatorKey,
          onGenerateRoute: Application.accountRouter.generator,
        ),
        onWillPop: () async => _navigatorKey.currentState!.canPop());
  }
}
