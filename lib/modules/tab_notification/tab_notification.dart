import 'package:base_bloc/components/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/app_scalford.dart';

class TabNotification extends StatefulWidget {
  const TabNotification({Key? key}) : super(key: key);

  @override
  State<TabNotification> createState() => _TabNotificationState();
}

class _TabNotificationState extends State<TabNotification> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        body: Center(
      child: AppText('TAB NOTIFICATION'),
    ));
  }
}
