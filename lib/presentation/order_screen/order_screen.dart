import '../../core/app_export.dart';
import 'notifier/order_notifier.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../urgent_delivery_page_one_page/urgent_delivery_page_one_page.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OrderScreenState createState() => OrderScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class OrderScreenState extends ConsumerState<OrderScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [appTheme.gray1009e, appTheme.gray1009e],
            ),
          ),
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(height: 13.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          height: 146.v,
                          width: 333.h,
                        ),
                        SizedBox(height: 34.v),
                        Container(
                          decoration: AppDecoration
                              .gradientGreenToErrorContainer
                              .copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder50,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgFlowerDelivery,
                                height: 84.v,
                                width: 393.h,
                              ),
                              SizedBox(height: 22.v),
                              _buildRowemail(context),
                              SizedBox(height: 26.v),
                              _buildRowquantity(context),
                              SizedBox(height: 26.v),
                              _buildRowstartdate(context),
                              SizedBox(height: 60.v),
                              _buildCreateAnOrderSection(context),
                              SizedBox(height: 60.v)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: _buildBottomBarSection(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 116.h,
          controller: ref.watch(orderNotifier).emailSectionController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 177.h,
          controller: ref.watch(orderNotifier).phoneNumberSectionController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowemail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_email".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 1.v),
              _buildEmailSection(context)
            ],
          ),
          Column(
            children: [
              Text(
                "lbl_phone_number".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 1.v),
              _buildPhoneNumberSection(context)
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDurationSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          controller: ref.watch(orderNotifier).durationSectionController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowquantity(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_quantity".tr,
                  style: theme.textTheme.titleMedium,
                ),
                Container(
                  height: 39.v,
                  width: 116.h,
                  decoration: BoxDecoration(
                    color: appTheme.gray500,
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary,
                        spreadRadius: 2.h,
                        blurRadius: 2.h,
                        offset: Offset(
                          6,
                          6,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "lbl_duration".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 1.v),
              _buildDurationSection(context)
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 169.h,
          controller: ref.watch(orderNotifier).dateController,
          prefix: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 10.v,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 17.adaptSize,
              width: 17.adaptSize,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 39.v,
          ),
          suffix: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 10.v,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 17.adaptSize,
              width: 17.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 39.v,
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildIntervalsSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          controller: ref.watch(orderNotifier).intervalsSectionController,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowstartdate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  "lbl_start_date".tr,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 1.v),
              _buildDate(context)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 23.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "lbl_intervals".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 1.v),
                _buildIntervalsSection(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCreateAnOrderSection(BuildContext context) {
    return CustomElevatedButton(
      width: 248.h,
      text: "lbl_create_an_order".tr,
    );
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Homepage:
        return AppRoutes.urgentDeliveryPageOnePage;
      case BottomBarEnum.Sms:
        return "/";
      case BottomBarEnum.Maleuser:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.urgentDeliveryPageOnePage:
        return UrgentDeliveryPageOnePage();
      default:
        return DefaultWidget();
    }
  }
}

