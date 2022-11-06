import 'package:base_bloc/components/app_scalford.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/app_text.dart';

class TabOrder extends StatefulWidget {
  const TabOrder({Key? key}) : super(key: key);

  @override
  State<TabOrder> createState() => _TabOrderState();
}

class _TabOrderState extends State<TabOrder> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        body: Center(
      child: AppText('TAB ORDER'),
    ));
  }
}
