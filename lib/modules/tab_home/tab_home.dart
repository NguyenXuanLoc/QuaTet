import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/components/app_circle_loading.dart';
import 'package:base_bloc/components/app_network_image.dart';
import 'package:base_bloc/components/app_not_data_widget.dart';
import 'package:base_bloc/components/app_text_field.dart';
import 'package:base_bloc/components/appbar_widget.dart';
import 'package:base_bloc/components/custom_button.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/localizations/app_localazations.dart';
import 'package:base_bloc/modules/tab_home/tab_home_cubit.dart';
import 'package:base_bloc/modules/tab_home/tab_home_state.dart';
import 'package:base_bloc/theme/app_styles.dart';
import 'package:base_bloc/theme/colors.dart';
import 'package:base_bloc/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/app_scalford.dart';
import '../../components/app_text.dart';
import '../../data/model/ProductModel.dart';
import '../../gen/assets.gen.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with AutomaticKeepAliveClientMixin {
  late TabHomeCubit _bloc;

  @override
  void initState() {
    _bloc = TabHomeCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        padding: EdgeInsets.only(left: contentPadding),
        appbar: appbar(context),
        body: RefreshIndicator(
          onRefresh: () async => _bloc.onRefresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: BlocBuilder<TabHomeCubit, TabHomeState>(
              bloc: _bloc,
              builder: (c, state) {
                return state.status == StatusType.INIT ||
                        state.status == StatusType.REFRESH
                    ? Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height - 100.h,
                        child: const AppCircleLoading(),
                      )
                    : (state.status == StatusType.ERROR
                        ? Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height - 100.h,
                            child: const AppNotDataWidget())
                        : Column(children: [
                            const SizedBox(height: 10),
                            for (int i = 0; i < state.lCategory.length; i++)
                              listProductWidget(
                                  context, "Bánh kẹo", state.lCategory[i])
                          ]));
              },
            ),
          ),
        ));
  }

  Widget titleCategoryWidget(String title) => Row(
        children: [
          AppText(title,
              style: typoW600.copyWith(fontSize: 14.5.sp, color: colorText90)),
          const Spacer(),
          InkWell(
              child: AppText(LocaleKeys.see_more,
                  style: typoW500.copyWith(
                      fontSize: 13.sp, color: HexColor('3397E0'))),
              onTap: () => _bloc.seeMoreOnClick(context)),
          SizedBox(width: contentPadding)
        ],
      );

  Widget listProductWidget(
          BuildContext context, String title, List<ProductModel> lProduct) =>
      Column(
        children: [
          titleCategoryWidget(title),
          const SizedBox(height: 10),
          SizedBox(
            height: 160.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) => itemProduct(context),
                itemCount: lProduct.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 9)),
          ),
          const SizedBox(height: 22),
        ],
      );

  Widget itemProduct(BuildContext context) => CustomButton(
        onTap: () {},
        widget: Container(
            decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: HexColor('595959').withOpacity(0.3),
                    spreadRadius: 0.5,
                    blurRadius: 0.2,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ]),
            margin: EdgeInsets.all(1.w),
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 4),
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                    flex: 6,
                    child: Center(
                        child: AppNetworkImage(
                            source:
                                'https://orion.vn/media/unig5uxr/cp12p-original.png'))),
                const Spacer(),
                AppText(
                  '${Utils.formatMoney(15000)}đ',
                  style: typoW700.copyWith(fontSize: 14.sp, color: colorRed100),
                ),
                const SizedBox(height: 3),
                AppText(
                  'Nước Giặt Ariel Cửa Trước Hương Bung huong tơm ngao ngat,st',
                  style: typoW600.copyWith(
                      color: colorText90, fontSize: 14, height: 1.2),
                  maxLine: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )),
      );

  PreferredSizeWidget appbar(BuildContext context) => appBarWidget(
      automaticallyImplyLeading: false,
      context: context,
      leadingWidth: 0,
      centerTitle: false,
      titleSpacing: 6,
      title: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 45, right: 10),
          child: AppTextField(
              textStyle: typoW400.copyWith(fontSize: 13.sp),
              decoration: decorTextFieldCircle.copyWith(
                  contentPadding: const EdgeInsets.all(11),
                  isDense: true,
                  hintText: LocaleKeys.search_product,
                  hintStyle:
                      typoW400.copyWith(fontSize: 14.sp, color: colorText50),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 30.w, maxWidth: 50.w),
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 5),
                      child: SvgPicture.asset(
                        Assets.svg.search,
                        width: 20,
                      ))))),
      action: [SvgPicture.asset(Assets.svg.cart), SizedBox(width: 15.w)]);

  @override
  bool get wantKeepAlive => true;
}
