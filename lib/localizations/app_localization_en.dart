import 'package:base_bloc/localizations/app_localazations.dart';

class AppLocalizationEn extends AppLocalizations {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get account => 'Tài khoản';

  @override
  String get home => 'Trang chủ';

  @override
  String get notification => 'Thông báo';

  @override
  String get order => 'Đơn hàng';

  @override
  String get network_error => 'Lỗi mạng, vui lòng thử lại sau.';

  @override
  // TODO: implement search_product
  String get search_product => 'Tìm kiếm sản phẩm';

  @override
  // TODO: implement see_more
  String get see_more => 'Xem thêm';
}
