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
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();
  TextEditingController? dateController = TextEditingController();
  TextEditingController? addressCtrl = TextEditingController();
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
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xD963681B), // First color
                                Color(0x66D9D9D9), // Second color
                              ],
                              stops: [0.0, 0.81], // Stop positions
                              begin: Alignment
                                  .topCenter, // Gradient start position

                              end: Alignment
                                  .bottomCenter, // Gradient end position
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgDeliverFood,
                                height: 115.v,
                                width: 393.h,
                                color: Color(0xFF63681B),
                              ),
                              SizedBox(height: 5.v),
                              _buildRowemail(context),
                              SizedBox(height: 27.v),
                              _buildQuantitySection(context),
                              SizedBox(height: 27.v),
                              _buildPhoneSection(context),
                              SizedBox(height: 27.v),
                              Text(
                                "Pick a Date".tr,
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 1.v),
                              _buildDate(context),
                              SizedBox(height: 26.v),
                              CustomElevatedButton(
                                width: 141.h,
                                height: 46.h,
                                text: "Confirm".tr,
                                onPressed: () {
                                  onTapConfirm(context);
                                },
                                buttonTextStyle:
                                    theme.textTheme.headlineSmall!.copyWith(
                                  fontSize: 21,
                                  color: Colors.white,
                                ),
                                buttonStyle: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    return Color(0xFF4B984D);
                                  }),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  elevation: MaterialStateProperty.all(12.0),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.grey),
                                ),
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
  Widget _buildPhoneSection(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Phone Number".tr,
            style: theme.textTheme.titleMedium!.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 1.v),
          Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                width: 141.h,
                contentPadding: EdgeInsets.all(6),
                controller: phoneNumberCtrl,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySection(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quantity".tr,
            style: theme.textTheme.titleMedium!.copyWith(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 1.v),
          Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                width: 141.h,
                contentPadding: EdgeInsets.all(6),
                controller: qtyCtrl,
              );
            },
          ),
        ],
      ),
    );
  }

  /// Navigates to the urgentDeliveryPageTwoScreen when the action is triggered.
  onTapConfirm(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.urgentPayment,
    );
  }

  /// Section Widget
  Widget _buildRowemail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email".tr,
              style: theme.textTheme.titleMedium!.copyWith(
                color: Colors.black,
              ),
            ),
            _buildEmailSection(context)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Address".tr,
              style: theme.textTheme.titleMedium!.copyWith(
                color: Colors.black,
              ),
            ),
            _buildAddressSection(context)
          ],
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 116.h,
          contentPadding: EdgeInsets.all(6),
          controller: emailCtrl,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          contentPadding: EdgeInsets.all(8),
          controller: phoneNumberCtrl,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAddressSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 141.h,
          contentPadding: EdgeInsets.all(6),
          controller: addressCtrl,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          width: 169.h,
          controller: dateController,
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
