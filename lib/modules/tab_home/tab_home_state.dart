import 'package:base_bloc/modules/tab_home/tab_home_cubit.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/ProductModel.dart';

class TabHomeState extends Equatable {
  final StatusType status;
  final List<List<ProductModel>> lCategory;

  const TabHomeState(
      {this.status = StatusType.INIT, this.lCategory = const []});

  TabHomeState copyOf(
          {StatusType? status, List<List<ProductModel>>? lCategory}) =>
      TabHomeState(
          status: status ?? this.status,
          lCategory: lCategory ?? this.lCategory);

  @override
  List<Object?> get props => [status, lCategory];

  @override
  String toString() {
    return "TAB HOME STATE: lFeed readEnd currentPage";
  }
}
