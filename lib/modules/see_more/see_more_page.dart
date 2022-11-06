import 'package:base_bloc/base/base_state.dart';
import 'package:base_bloc/components/app_button.dart';
import 'package:base_bloc/components/app_circle_loading.dart';
import 'package:base_bloc/components/app_network_image.dart';
import 'package:base_bloc/components/app_not_data_widget.dart';
import 'package:base_bloc/components/app_scalford.dart';
import 'package:base_bloc/components/app_text.dart';
import 'package:base_bloc/components/custom_button.dart';
import 'package:base_bloc/components/item_loading.dart';
import 'package:base_bloc/config/constant.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/data/model/ProductModel.dart';
import 'package:base_bloc/modules/see_more/see_more_cubit.dart';
import 'package:base_bloc/modules/see_more/see_more_state.dart';
import 'package:base_bloc/modules/tab_home/tab_home_cubit.dart';
import 'package:base_bloc/utils/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../base/hex_color.dart';
import '../../components/app_text_field.dart';
import '../../components/appbar_widget.dart';
import '../../gen/assets.gen.dart';
import '../../localizations/app_localazations.dart';
import '../../theme/app_styles.dart';
import '../../theme/colors.dart';
import '../../utils/app_utils.dart';

class SeeMorePage extends StatefulWidget {
  final int catId;

  const SeeMorePage({Key? key, this.catId = 0}) : super(key: key);

  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends BasePopState<SeeMorePage> {
  late SeeMoreCubit _bloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    _bloc = SeeMoreCubit(widget.catId);
    _scrollController = ScrollController();
    paging();
    super.initState();
  }

  void paging() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      if (currentScroll >= (maxScroll * 0.9)) _bloc.paging();
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
      appbar: appbar(context),
      body: RefreshIndicator(
        onRefresh: () async => _bloc.onRefresh(),
        child: Stack(
          children: [
            ListView(physics: const AlwaysScrollableScrollPhysics()),
            BlocBuilder<SeeMoreCubit, SeeMoreState>(
              bloc: _bloc,
              builder: (c, state) {
                return state.statusType == StatusType.INIT ||
                        state.statusType == StatusType.REFRESH
                    ? const Center(child: AppCircleLoading())
                    : (state.statusType == StatusType.SUCCESS
                        ? (state.lProduct.isEmpty
                            ? const Center(child: AppNotDataWidget())
                            : lProductWidget(context, state))
                        : const Center(child: AppNotDataWidget()));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget lProductWidget(
          BuildContext context, SeeMoreState state) =>
      ListView.separated(
          controller: _scrollController,
          padding: EdgeInsets.all(contentPadding),
          itemBuilder: (c, index) => index == state.lProduct.length
              ? const ItemLoading()
              : itemProduct(state.lProduct[index]),
          separatorBuilder: (c, i) => const SizedBox(height: 15),
          itemCount:
              state.lProduct.isNotEmpty && state.isLoading && !state.isReadEnd
                  ? state.lProduct.length + 1
                  : state.lProduct.length);

  Widget itemProduct(ProductModel model) => Container(
        padding: const EdgeInsets.all(10),
        height: 90.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                  color: colorGrey80.withOpacity(0.3),
                  spreadRadius: 0.1,
                  blurRadius: 3,
                  offset: const Offset(0, 0))
            ]),
        child: Row(
          children: [
            const AspectRatio(
                aspectRatio: 1 / 1,
                child: AppNetworkImage(
                    source:
                        'https://orion.vn/media/unig5uxr/cp12p-original.png')),
            const SizedBox(width: 15),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: AppText(
                        'Kem đánh răng Sensodyne Fresh Mint giảm ê buốt 24/7 100g  sdjh sdkjh sdjh sdjk',
                        style: typoW600.copyWith(fontSize: 12.sp),
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis)),
                Expanded(
                    child: Row(
                  children: [
                    AppText(Utils.formatMoney(146000),
                        style: typoW700.copyWith(
                            color: colorRed100, fontSize: 14.sp)),
                    const Spacer(),
                    AppButton(
                      onPress: () => _bloc.addToCart(model),
                      title: LocaleKeys.add_to_cart,
                      height: 24.h,
                      textStyle:
                          typoW600.copyWith(fontSize: 13.sp, color: colorText0),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 6, bottom: 6),
                      shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: colorRed90,
                    )
                  ],
                ))
              ],
            ))
          ],
        ),
      );

  PreferredSizeWidget appbar(BuildContext context) => appBarWidget(
      context: context,
      centerTitle: false,
      isBack: true,
      leadingWidth: 30,
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
  int get tabIndex => BottomNavigationConstant.TAB_HOME;
}
