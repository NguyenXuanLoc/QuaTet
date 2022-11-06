import 'package:flutter/material.dart';

import '../../components/app_scalford.dart';
import '../../components/app_text.dart';

class TabAccount extends StatefulWidget {
  const TabAccount({Key? key}) : super(key: key);

  @override
  State<TabAccount> createState() => _TabAccountState();
}

class _TabAccountState extends State<TabAccount>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        body: Center(
      child: AppText('TAB ORDER'),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
