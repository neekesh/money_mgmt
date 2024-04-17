import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'notifier/signup_login_notifier.dart';
import '../../widgets/custom_elevated_button.dart';

class SignupLoginScreen extends ConsumerStatefulWidget {
  const SignupLoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupLoginScreenState createState() => SignupLoginScreenState();
}

class SignupLoginScreenState extends ConsumerState<SignupLoginScreen> {
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
              colors: [Color(0xFFA3A8A2), Color(0XFF282828)],
            ),
          ),
          child: SizedBox(
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
                          horizontal: 97.h,
                          vertical: 167.v,
                        ),
                        decoration:
                            AppDecoration.gradientBlueGrayToBlueGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder50,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                              text: "lbl_signup".tr,
                              buttonTextStyle: theme.textTheme.headlineMedium!,
                              buttonStyle: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.green;
                                }),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                onTapSignUp(context);
                              },
                            ),
                            SizedBox(height: 39.v),
                            Text(
                              "lbl_or".tr,
                              style: CustomTextStyles
                                  .headlineMediumPrimaryContainer,
                            ),
                            SizedBox(height: 40.v),
                            CustomElevatedButton(
                              text: "lbl_login".tr,
                              buttonTextStyle: theme.textTheme.headlineMedium!,
                              buttonStyle: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.green;
                                }),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                onTapLogin(context);
                              },
                            )
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
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
