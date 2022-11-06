import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
 class TabNotificationState extends Equatable {
  final int? timeStamp;

  const TabNotificationState({this.timeStamp});
  @override
  List<Object?> get props => [timeStamp];
}
