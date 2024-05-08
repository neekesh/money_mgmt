import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'notifier/appointment_notifier.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../dashboard_page/dashboard_page.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class AppointmentScreen extends ConsumerStatefulWidget {
  const AppointmentScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppointmentScreenState createState() => AppointmentScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppointmentScreenState extends ConsumerState<AppointmentScreen> {
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
                  decoration: AppDecoration.gradientYellowToBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgInvoice,
                        height: 69.v,
                        width: 393.h,
                      ),
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.only(left: 30.h),
                        child: Text(
                          "lbl_email".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      Padding(
                        padding: EdgeInsets.only(left: 30.h),
                        child: Consumer(
                          builder: (context, ref, _) {
                            return CustomTextFormField(
                              width: 141.h,
                              controller: ref
                                  .watch(appointmentNotifier)
                                  .emailController,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 36.v),
                      _buildQuantityColumn(context),
                      SizedBox(height: 38.v),
                      _buildMessageColumn(context),
                      SizedBox(height: 35.v),
                      CustomElevatedButton(
                        width: 150.h,
                        text: "lbl_confirm".tr,
                        margin: EdgeInsets.only(left: 30.h),
                        onPressed: () {
                          onTapConfirm(context);
                        },
                        buttonTextStyle:
                            theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 21.fSize,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 35.v)
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
  Widget _buildQuantityColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_phone_number".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 1.v),
          Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                width: 183.h,
                controller:
                    ref.watch(appointmentNotifier).phoneNumberController,
                textInputAction: TextInputAction.done,
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMessageColumn(BuildContext context) {
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

  /// Navigates to the appointmentOneScreen when the action is triggered.
  onTapConfirm(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.appointmentOneScreen,
    );
  }
}
