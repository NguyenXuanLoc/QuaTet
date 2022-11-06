import 'dart:async';

import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/config/constant.dart';
import 'package:base_bloc/data/eventbus/hold_set_event.dart';
import 'package:base_bloc/data/eventbus/new_page_event.dart';
import 'package:base_bloc/data/eventbus/switch_tab_event.dart';
import 'package:base_bloc/modules/root/root_account_page.dart';
import 'package:base_bloc/modules/root/root_home_page.dart';
import 'package:base_bloc/modules/root/root_order_page.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:base_bloc/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/app_text.dart';
import '../../components/gradient_icon.dart';
import '../../gen/assets.gen.dart';
import '../../localizations/app_localazations.dart';
import '../root/root_notification_page.dart';
import 'home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabs = [
    const RootHomePage(),
    const RooteOrderPage(),
    const RootNotificationPage(),
    const RootAccountPage(),
  ];

  var _currentIndex = 0;
  final _pageController = PageController();
  final _bloc = HomeCubit();
  bool isShowBottomBar = false;

  StreamSubscription<NewPageEvent>? _newPageStream;

  @override
  void initState() {
    _newPageStream = Utils.eventBus.on<NewPageEvent>().listen((event) async {
      var result = await RouterUtils.pushTo(context, event.newPage,
          isReplace: event.isReplace);
      if (result != null && event.type != null) {
        switch (event.type) {
          case NewPageType.HOLD_SET:
            Utils.fireEvent(HoldSetEvent(result));
            return;
          case NewPageType.FILL_PLACE:
            Utils.fireEvent(result);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _bloc.close();
    _newPageStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        fullStatusBar: true,
        resizeToAvoidBottomInset: false,
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: tabs),
        bottomNavigationBar: bottomNavigationWidget(context));
  }

  void _jumpToPage(int index) {
    isShowBottomBar = false;
    if (index == _currentIndex) Utils.fireEvent(SwitchTabEvent(index));
    _currentIndex = index;
    setState(() {});
    _pageController.jumpToPage(index);
    _bloc.jumpToPage(_currentIndex);
  }

  Widget bottomNavigationWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 1),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomAppBar(
          elevation: 0,
          color: colorWhite,
          child: SizedBox(
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                itemBottomBar(Assets.svg.home, LocaleKeys.home,
                    BottomNavigationConstant.TAB_HOME, context),
                itemBottomBar(Assets.svg.bags, LocaleKeys.order,
                    BottomNavigationConstant.TAB_ORDER, context),
                itemBottomBar(Assets.svg.notification, LocaleKeys.notification,
                    BottomNavigationConstant.TAB_NOTIFICATON, context),
                itemBottomBar(Assets.svg.person, LocaleKeys.account,
                    BottomNavigationConstant.TAB_ACCOUNT, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemBottomBar(
      String assetSvg, String title, int index, BuildContext context) {
    return Expanded(
        child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 19.w,
                  height: 19.w,
                  child: SvgPicture.asset(assetSvg,
                      fit: BoxFit.contain,
                      color:
                          _currentIndex == index ? colorRed100 : colorGrey50),
                ),
                const SizedBox(
                  height: 3,
                ),
                AppText(title,
                    style: typoW400.copyWith(
                        color:
                            _currentIndex == index ? colorRed100 : colorGrey50,
                        fontSize: 10.sp))
              ],
            ),
            onTap: () => _jumpToPage(index)));
  }
}
