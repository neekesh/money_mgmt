import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'notifier/profile_details_notifier.dart';
import '../../widgets/custom_elevated_button.dart';
// import '../profile_invoice_page/profile_invoice_page.dart';

class ProfileDetailsScreen extends ConsumerStatefulWidget {
  const ProfileDetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileDetailsScreenState createState() => ProfileDetailsScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ProfileDetailsScreenState extends ConsumerState<ProfileDetailsScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 92.v),
                Padding(
                  padding: EdgeInsets.only(left: 23.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEllipse1,
                        height: 49.v,
                        width: 46.h,
                        radius: BorderRadius.circular(
                          23.h,
                        ),
                      ),
                      Container(
                        width: 110.h,
                        margin: EdgeInsets.only(
                          left: 13.h,
                          top: 5.v,
                          bottom: 11.v,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "lbl_manish_pandey".tr,
                                style: CustomTextStyles
                                    .labelLargePrimaryContainerSemiBold_1,
                              ),
                              TextSpan(
                                text: "lbl_xyz_compay".tr,
                                style:
                                    CustomTextStyles.labelLargePrimaryContainer,
                              )
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.h,
                    vertical: 39.v,
                  ),
                  decoration: AppDecoration.gradientBlueGrayToBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRowDetails(context),
                      SizedBox(height: 5.v),
                      SizedBox(
                        width: 76.h,
                        child: Divider(
                          color:
                              theme.colorScheme.primaryContainer.withOpacity(1),
                          indent: 22.h,
                        ),
                      ),
                      SizedBox(height: 37.v),
                      SizedBox(
                        width: 184.h,
                        child: Text(
                          "msg_name_manish_pandey".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ),
                      SizedBox(height: 40.v),
                      SizedBox(
                        width: 205.h,
                        child: Text(
                          "msg_email_abcd_gmail_com".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ),
                      SizedBox(height: 40.v),
                      SizedBox(
                        width: 179.h,
                        child: Text(
                          "msg_phone_number_04010101010".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ),
                      SizedBox(height: 44.v),
                      SizedBox(
                        width: 186.h,
                        child: Text(
                          "msg_company_name_xyz".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeBold,
                        ),
                      ),
                      SizedBox(height: 18.v),
                      CustomElevatedButton(
                        height: 28.v,
                        width: 65.h,
                        text: "lbl_edit".tr,
                        buttonStyle: CustomButtonStyles.outlinePrimaryTL14,
                        buttonTextStyle:
                            CustomTextStyles.titleSmallOnErrorSemiBold,
                        onPressed: () {
                          onTapEdit(context);
                        },
                      ),
                      SizedBox(height: 55.v)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "lbl_details".tr,
              style: theme.textTheme.titleMedium,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTapTxtHistory(context);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 2.v),
              child: Text(
                "lbl_history".tr,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "lbl_invoice".tr,
              style: theme.textTheme.titleMedium,
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
        return AppRoutes.profileInvoicePage;
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
      case AppRoutes.profileInvoicePage:
      // return ProfileInvoicePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the profileHistoryTabContainerScreen when the action is triggered.
  onTapTxtHistory(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileHistoryTabContainerScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapEdit(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
