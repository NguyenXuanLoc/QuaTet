import 'package:base_bloc/modules/tab_home/tab_home_cubit.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/ProductModel.dart';

class SeeMoreState extends Equatable {
  final StatusType statusType;
  final bool isLoading;
  final bool isReadEnd;
  final List<ProductModel> lProduct;
  final int currentPage;
  int catId;

  SeeMoreState(
      {this.lProduct = const [],
      this.isLoading = true,
      this.statusType = StatusType.INIT,
      this.catId = 0,
      this.isReadEnd = false,
      this.currentPage = 0});

  SeeMoreState copyOf(
          {bool? isLoading,
          StatusType? statusType,
          bool? isReadEnd,
          List<ProductModel>? lProduct,
          int? currentPage,
          int? catId}) =>
      SeeMoreState(
          statusType: statusType ?? this.statusType,
          lProduct: lProduct ?? this.lProduct,
          catId: catId ?? this.catId,
          isLoading: isLoading ?? this.isLoading,
          isReadEnd: isReadEnd ?? this.isReadEnd,
          currentPage: currentPage ?? this.currentPage);

  @override
  List<Object?> get props =>
      [catId, lProduct, isLoading, isReadEnd, currentPage,statusType];
}
