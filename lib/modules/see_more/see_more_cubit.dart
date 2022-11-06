import 'dart:async';

import 'package:base_bloc/data/model/ProductModel.dart';
import 'package:base_bloc/modules/see_more/see_more_state.dart';
import 'package:base_bloc/modules/tab_home/tab_home_cubit.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMoreCubit extends Cubit<SeeMoreState> {
  int catId;

  SeeMoreCubit(this.catId) : super(SeeMoreState()) {
    getProduct();
  }

  void getProduct({bool isPaging = false}) {
    state.catId = catId;
    if (!isPaging) {
      Timer(
          const Duration(seconds: 1),
          () => emit(state.copyOf(
              currentPage: state.currentPage + 1,
              statusType: StatusType.SUCCESS,
              isLoading: false,
              lProduct: fakeData())));
    } else {
      Timer(
          const Duration(seconds: 2),
          () => emit(state.copyOf(
              currentPage: state.currentPage + 1,
              statusType: StatusType.SUCCESS,
              isLoading: false,
              lProduct: state.lProduct..addAll(fakeData()))));
    }
  }

  void onRefresh() {
    emit(SeeMoreState());
    getProduct();
  }

  void paging() {
    if (state.isLoading && state.lProduct.isNotEmpty || state.isReadEnd) return;
    if (state.currentPage == 3) {
      emit(state.copyOf(isLoading: false, isReadEnd: true));
    }
    emit(state.copyOf(isLoading: true));
    getProduct(isPaging: true);
  }

  void addToCart(ProductModel model) {}

  List<ProductModel> fakeData() => [
        ProductModel(),
        ProductModel(),
        ProductModel(),
        ProductModel(),
        ProductModel(),
        ProductModel(),
        ProductModel(),
        ProductModel()
      ];
}
