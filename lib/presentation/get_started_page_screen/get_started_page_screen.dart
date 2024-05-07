import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_outlined_button.dart';

class GetStartedPageScreen extends ConsumerStatefulWidget {
  const GetStartedPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  GetStartedPageScreenState createState() => GetStartedPageScreenState();
}

class GetStartedPageScreenState extends ConsumerState<GetStartedPageScreen> {
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
            color: Color.fromRGBO(255, 255, 255, 0.9),
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50.v),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFrankEyesClosed,
                  height: 388.v,
                  width: 393.h,
                  radius: BorderRadius.circular(
                    80.h,
                  ),
                ),
                SizedBox(height: 54.v),
                Container(
                  width: 346.h,
                  margin: EdgeInsets.symmetric(horizontal: 23.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_welcome".tr,
                          style: theme.textTheme.headlineLarge,
                        ),
                        TextSpan(
                          text: "msg_a_better_sustainable".tr,
                          style: theme.textTheme.titleSmall!
                              .copyWith(color: appTheme.blueGray700),
                        ),
                        TextSpan(
                          text: "msg_our_exclusive_100".tr,
                          style: theme.textTheme.labelLarge!
                              .copyWith(color: appTheme.blueGray700),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 44.v),
                CustomOutlinedButton(
                  height: 68.v,
                  width: 203.h,
                  text: "lbl_get_started".tr,
                  buttonTextStyle: theme.textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  buttonStyle: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      return Colors.green;
                    }),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    elevation: MaterialStateProperty.all(12.0),
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  onPressed: () {
                    onTapGetstarted(context);
                  },
                ),
                SizedBox(height: 5.v)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the signupLoginScreen when the action is triggered.
  onTapGetstarted(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupLoginScreen,
    );
  }
}
