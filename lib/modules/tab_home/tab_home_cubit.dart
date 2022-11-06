import 'dart:async';

import 'package:base_bloc/data/model/ProductModel.dart';
import 'package:base_bloc/modules/tab_home/tab_home_state.dart';
import 'package:base_bloc/utils/log_utils.dart';
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

  List<List<ProductModel>> fakeData() => [
        [ProductModel(), ProductModel(), ProductModel()],
        [ProductModel(), ProductModel()],
        [ProductModel(), ProductModel(), ProductModel()]
      ];
}
