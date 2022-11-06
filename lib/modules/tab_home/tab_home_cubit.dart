import 'dart:async';

import 'package:base_bloc/data/model/ProductModel.dart';
import 'package:base_bloc/modules/tab_home/tab_home_state.dart';
import 'package:base_bloc/router/router.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum StatusType { INIT, SUCCESS, REFRESH, ERROR }

class TabHomeCubit extends Cubit<TabHomeState> {
  TabHomeCubit() : super(TabHomeState()) {
    getCategory();
  }

  void getCategory() {
    Timer(
        const Duration(seconds: 1),
        () => emit(
            state.copyOf(status: StatusType.SUCCESS, lCategory: fakeData())));
  }

  void onRefresh() {
    emit(const TabHomeState(status: StatusType.REFRESH));
    getCategory();
  }

  void seeMoreOnClick(BuildContext context, {int id = 0}) =>
      RouterUtils.pushHome(
          context: context, route: HomeRouters.seeMore, argument: id);

  List<List<ProductModel>> fakeData() => [
        [ProductModel(), ProductModel(), ProductModel()],
        [ProductModel(), ProductModel()],
        [ProductModel(), ProductModel(), ProductModel()]
      ];
}
