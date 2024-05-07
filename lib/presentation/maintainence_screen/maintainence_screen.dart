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
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xD9C9C55E), // First color
                        Color(0x66D9D9D9), // Second color
                      ],
                      stops: [0.0, 0.81], // Stop positions
                      begin: Alignment.topCenter, // Gradient start position
                      end: Alignment.bottomCenter, // Gradient end position
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgWrench,
                        height: 71.v,
                        width: 393.h,
                        color: Color.fromARGB(255, 168, 165, 60),
                      ),
                      SizedBox(height: 8.v),
                      _buildRowEmail(context),
                      SizedBox(height: 27.v),
                      Text(
                        "Phone Number".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 1.v),
                      _buildPhoneNumberEditText(context),
                      SizedBox(height: 27.v),
                      Text(
                        "Book a Date".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 1.v),
                      _buildDate(context),
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
          contentPadding: EdgeInsets.all(6),
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
          contentPadding: EdgeInsets.all(6),
          controller: ref.watch(maintenanceNotifier).addressEditTextController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildRowEmail(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email".tr,
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
                "Address".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 1.v),
              _buildAddressEditText(context)
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberEditText(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 183.h,
          controller:
              ref.watch(maintenanceNotifier).phoneNumberEditTextController,
          contentPadding: EdgeInsets.all(6),
          textInputAction: TextInputAction.done,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildQuantityColumn(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Message".tr,
            style: theme.textTheme.titleMedium,
          ),
          CustomTextFormField(
            width: 282.h,
            maxLines: 3,
            contentPadding: EdgeInsets.all(6),
            controller: ref.watch(maintenanceNotifier).messageTextController,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmButton(BuildContext context) {
    return CustomElevatedButton(
      width: 141.h,
      height: 46.h,
      text: "Confirm".tr,
      onPressed: () {
        NavigatorService.pushNamed(
          AppRoutes.maintainenceOneScreen,
        );
      },
      buttonTextStyle: theme.textTheme.headlineSmall!.copyWith(
        fontSize: 21,
        color: Colors.white,
      ),
      buttonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return Color(0xFF4B984D);
        }),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Colors.transparent,
          ),
        ),
        elevation: MaterialStateProperty.all(12.0),
        shadowColor: MaterialStateProperty.all(Colors.grey),
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

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 169.h,
          controller: ref.watch(maintenanceNotifier).addressEditTextController,
          contentPadding: EdgeInsets.all(6),
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
}
