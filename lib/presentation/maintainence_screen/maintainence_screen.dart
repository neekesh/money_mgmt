import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'notifier/maintainence_notifier.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../dashboard_page/dashboard_page.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MaintenanceScreenState createState() => MaintenanceScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MaintenanceScreenState extends ConsumerState<MaintenanceScreen> {
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
                CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  height: 146.v,
                  width: 333.h,
                ),
                SizedBox(height: 44.v),
                Container(
                  decoration: AppDecoration.gradientLimeToBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgWrench,
                        height: 71.v,
                        width: 393.h,
                      ),
                      SizedBox(height: 8.v),
                      _buildRowEmail(context),
                      SizedBox(height: 27.v),
                      Padding(
                        padding: EdgeInsets.only(left: 30.h),
                        child: Text(
                          "lbl_phone_number".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      _buildPhoneNumberEditText(context),
                      SizedBox(height: 27.v),
                      Padding(
                        padding: EdgeInsets.only(left: 33.h),
                        child: Text(
                          "lbl_book_a_date".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      Container(
                        margin: EdgeInsets.only(left: 30.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 37.h,
                          vertical: 10.v,
                        ),
                        decoration: AppDecoration.outlinePrimary,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgArrowLeft,
                              height: 17.adaptSize,
                              width: 17.adaptSize,
                              margin: EdgeInsets.only(bottom: 1.v),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgArrowLeft,
                              height: 17.adaptSize,
                              width: 17.adaptSize,
                              margin: EdgeInsets.only(
                                left: 34.h,
                                bottom: 1.v,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 29.v),
                      _buildQuantityColumn(context),
                      SizedBox(height: 26.v),
                      _buildConfirmButton(context),
                      SizedBox(height: 26.v)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(right: 4.h),
          child: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          controller: ref.watch(maintenanceNotifier).emailEditTextController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAddressEditText(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          controller: ref.watch(maintenanceNotifier).addressEditTextController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowEmail(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
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
                _buildEmailEditText(context)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_address".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 1.v),
                _buildAddressEditText(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            width: 183.h,
            controller:
                ref.watch(maintenanceNotifier).phoneNumberEditTextController,
            textInputAction: TextInputAction.done,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildQuantityColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_your_message".tr,
            style: theme.textTheme.titleMedium,
          ),
          Container(
            height: 92.v,
            width: 282.h,
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
    );
  }

  /// Section Widget
  Widget _buildConfirmButton(BuildContext context) {
    return CustomElevatedButton(
      width: 141.h,
      text: "lbl_confirm".tr,
      margin: EdgeInsets.only(left: 30.h),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
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
        return AppRoutes.dashboardPage;
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
      case AppRoutes.dashboardPage:
        return DashboardPage();
      default:
        return DefaultWidget();
    }
  }
}
