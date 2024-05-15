import '../../core/app_export.dart';
import 'notifier/login_notifier.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
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
            color: Color.fromRGBO(226, 226, 226, 1),
          ),
          child: SizedBox(
            child: Form(
              key: ref.read(loginNotifier).formKey,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: SizeUtils.height,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.h,
                            vertical: 35.v,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFF3FFF4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 50.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 36.h),
                                  child: Text(
                                    "Email".tr,
                                    style: CustomTextStyles
                                        .headlineMediumOnPrimary,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 36.h,
                                  right: 34.h,
                                ),
                                child: Consumer(
                                  builder: (context, ref, _) {
                                    return CustomTextFormField(
                                      controller:
                                          ref.watch(loginNotifier).usernameCtrl,
                                      contentPadding: EdgeInsets.all(12),
                                      validator: (value) => ref
                                          .read(loginNotifier.notifier)
                                          .validateEmail(value),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 27.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 36.h),
                                  child: Text(
                                    "lbl_password".tr,
                                    style: CustomTextStyles
                                        .headlineMediumOnPrimary,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 36.h,
                                  right: 34.h,
                                ),
                                child: Consumer(
                                  builder: (context, ref, _) {
                                    return CustomTextFormField(
                                      controller:
                                          ref.watch(loginNotifier).passwordCtrl,
                                      contentPadding: EdgeInsets.all(12),
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      validator: (value) => ref
                                          .read(loginNotifier.notifier)
                                          .validatePassword(value),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 31.v),
                              CustomElevatedButton(
                                width: 199.h,
                                height: 63.v,
                                text: "lbl_login".tr,
                                buttonTextStyle:
                                    theme.textTheme.headlineMedium!,
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
                                onPressed: () {
                                  ref
                                      .read(loginNotifier.notifier)
                                      .onSingIn(context);
                                },
                              ),
                              SizedBox(height: 31.v),
                              Container(
                                decoration: AppDecoration.outlinePrimary,
                                child: Text(
                                  "msg_forgot_your_password".tr,
                                  style: theme.textTheme.titleMedium!
                                      .copyWith(color: Color(0xFF1E1E1E)),
                                ),
                              ),
                              SizedBox(height: 41.v),
                            ],
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgFrankEyesClosed394x393,
                        height: 394.v,
                        width: 393.h,
                        radius: BorderRadius.circular(
                          80.h,
                        ),
                        alignment: Alignment.topCenter,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogin() {
    NavigatorService.pushNamed(
      AppRoutes.dashboardPage,
    );
  }
}
