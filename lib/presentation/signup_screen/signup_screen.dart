import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'notifier/signup_notifier.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
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
              colors: [Color(0xFFA3A8A2), Color(0XFF282828)],
            ),
          ),
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(height: 57.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "lbl_signup".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                        SizedBox(height: 1.v),
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
                              _buildSignupForm(context),
                              SizedBox(height: 35.v),
                              _buildLastnameForm(context),
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
                                        .watch(signupNotifier)
                                        .edittexttwoController,
                                  );
                                },
                              ),
                              SizedBox(height: 20.v),
                              _buildPhonenumberForm(context),
                              SizedBox(height: 20.v),
                              _buildEmailForm(context),
                              SizedBox(height: 20.v),
                              _buildPasswordForm(context),
                              SizedBox(height: 20.v),
                              CustomElevatedButton(
                                text: "lbl_update".tr,
                                buttonTextStyle:
                                    theme.textTheme.headlineMedium!,
                                buttonStyle: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    return Colors.green;
                                  }),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
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
  Widget _buildSignupForm(BuildContext context) {
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
                controller: ref.watch(signupNotifier).edittextController,
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildLastnameForm(BuildContext context) {
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
                controller: ref.watch(signupNotifier).edittextoneController,
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildPhonenumberForm(BuildContext context) {
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
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Consumer(
            builder: (context, ref, _) {
              return CustomTextFormField(
                borderDecoration: null,
                controller: ref.watch(signupNotifier).edittextoneController,
              );
            },
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildEmailForm(BuildContext context) {
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
              controller: ref.watch(signupNotifier).edittextthreeController,
            );
          },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildPasswordForm(BuildContext context) {
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
                controller: ref.watch(signupNotifier).edittextfourController,
                textInputAction: TextInputAction.done,
                obscureText: true,
              );
            },
          ),
        )
      ],
    );
  }

  onTapUpdate(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashboardPage,
    );
  }
}
