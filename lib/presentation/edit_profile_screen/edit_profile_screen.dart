import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'notifier/edit_profile_notifier.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends ConsumerState<EditProfileScreen> {
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
                SizedBox(height: 53.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "lbl_edit_profile".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                        SizedBox(height: 5.v),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 79.h,
                            vertical: 35.v,
                          ),
                          decoration:
                              AppDecoration.gradientBlueGrayToBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder50,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildEditProfileFirstName(context),
                              SizedBox(height: 35.v),
                              _buildEditProfileLastName(context),
                              SizedBox(height: 37.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "lbl_company_name".tr,
                                  style: theme.textTheme.titleLarge,
                                ),
                              ),
                              Consumer(
                                builder: (context, ref, _) {
                                  return CustomTextFormField(
                                    controller: ref
                                        .watch(editProfileNotifier)
                                        .edittexttwoController,
                                  );
                                },
                              ),
                              SizedBox(height: 34.v),
                              _buildEditProfilePhoneNumber(context),
                              SizedBox(height: 34.v),
                              _buildEditProfileEmail(context),
                              SizedBox(height: 34.v),
                              _buildEditProfilePassword(context),
                              SizedBox(height: 40.v),
                              CustomElevatedButton(
                                height: 39.v,
                                width: 120.h,
                                text: "lbl_update".tr,
                                buttonStyle: CustomButtonStyles.fillGreen,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallOnError,
                                onPressed: () {
                                  onTapUpdate(context);
                                },
                              ),
                              SizedBox(height: 40.v)
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
  Widget _buildEditProfileFirstName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "lbl_first_name".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                controller: ref.watch(editProfileNotifier).edittextController,
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfileLastName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "lbl_last_name".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                controller:
                    ref.watch(editProfileNotifier).edittextoneController,
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfilePhoneNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "lbl_phone_number".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Container(
          height: 40.v,
          width: 233.h,
          margin: EdgeInsets.only(left: 2.h),
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
    );
  }

  /// Section Widget
  Widget _buildEditProfileEmail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_email".tr,
          style: theme.textTheme.titleLarge,
        ),
        Consumer(
          builder: (context, ref, _) {
            return CustomTextFormField(
              controller:
                  ref.watch(editProfileNotifier).edittextthreeController,
            );
          },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfilePassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text(
            "lbl_password".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                controller:
                    ref.watch(editProfileNotifier).edittextfourController,
                textInputAction: TextInputAction.done,
                obscureText: true,
              );
            },
          ),
        )
      ],
    );
  }

  /// Navigates to the profileDetailsScreen when the action is triggered.
  onTapUpdate(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileDetailsScreen,
    );
  }
}
