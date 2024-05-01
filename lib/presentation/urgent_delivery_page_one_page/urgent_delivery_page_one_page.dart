import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'notifier/urgent_delivery_page_one_page_notifier.dart'; // ignore_for_file: must_be_immutable

class UrgentDeliveryPageOnePage extends ConsumerStatefulWidget {
  const UrgentDeliveryPageOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  UrgentDeliveryPageOnePageState createState() =>
      UrgentDeliveryPageOnePageState();
}

class UrgentDeliveryPageOnePageState
    extends ConsumerState<UrgentDeliveryPageOnePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
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
          child: Container(
            decoration: AppDecoration.gradientGrayEToGrayE,
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
                        SizedBox(height: 54.v),
                        Container(
                          decoration: AppDecoration.gradientLimeToErrorContainer
                              .copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder50,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgDeliverFood,
                                height: 115.v,
                                width: 393.h,
                              ),
                              SizedBox(height: 5.v),
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
                                          .watch(urgentDeliveryPageOneNotifier)
                                          .emailController,
                                      textInputAction: TextInputAction.done,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 29.v),
                              Padding(
                                padding: EdgeInsets.only(left: 30.h),
                                child: Text(
                                  "lbl_quantity".tr,
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                              Container(
                                height: 39.v,
                                width: 141.h,
                                margin: EdgeInsets.only(left: 30.h),
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
                              ),
                              SizedBox(height: 27.v),
                              _buildQuantitySection(context),
                              SizedBox(height: 27.v),
                              Padding(
                                padding: EdgeInsets.only(left: 33.h),
                                child: Text(
                                  "lbl_pick_a_date".tr,
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
                              SizedBox(height: 26.v),
                              CustomElevatedButton(
                                width: 141.h,
                                text: "lbl_confirm".tr,
                                margin: EdgeInsets.only(left: 30.h),
                                onPressed: () {
                                  onTapConfirm(context);
                                },
                              ),
                              SizedBox(height: 26.v)
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
      ),
    );
  }

  /// Section Widget
  Widget _buildQuantitySection(BuildContext context) {
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
          Container(
            height: 39.v,
            width: 141.h,
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

  /// Navigates to the urgentDeliveryPageTwoScreen when the action is triggered.
  onTapConfirm(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.urgentDeliveryPageTwoScreen,
    );
  }
}
