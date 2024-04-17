import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'notifier/dashboard_notifier.dart';
import 'models/gridordertext_item_model.dart';
import 'widgets/gridordertext_item_widget.dart'; // ignore_for_file: must_be_immutable

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({Key? key})
      : super(
          key: key,
        );

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
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
            decoration: AppDecoration.gradientGrayEToGray1009e,
            child: Column(
              children: [
                SizedBox(height: 13.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                        ),
                        SizedBox(height: 22.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 131.h,
                              right: 100.h,
                            ),
                            decoration:
                                AppDecoration.fillPrimaryContainer.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgTrackOrder,
                                  height: 70.v,
                                  width: 162.h,
                                ),
                                SizedBox(height: 8.v),
                                Container(
                                  width: 149.h,
                                  margin: EdgeInsets.symmetric(horizontal: 6.h),
                                  child: Text(
                                    "msg_track_your_order".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .titleLargeOnErrorExtraBold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 23.v),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.h),
                          decoration:
                              AppDecoration.gradientLimeToBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder50,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 76.v),
                              _buildGridordertext(context),
                              SizedBox(height: 54.v),
                              SizedBox(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: GestureDetector(
                                        onTap: () {
                                          onTapCreatefromone(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          onTapViewone(context);
                                        },
                                        child: Container(
                                          height: 122.v,
                                          width: 141.h,
                                          decoration: BoxDecoration(
                                            color: appTheme.yellow900,
                                            borderRadius: BorderRadius.circular(
                                              20.h,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 141.h,
                                        child: Text(
                                          "lbl_book_a_rep".tr,
                                          maxLines: null,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyles
                                              .titleSmallOnError_1,
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgInvoice,
                                      height: 69.v,
                                      width: 141.h,
                                      alignment: Alignment.topCenter,
                                    )
                                  ],
                                ),
                              )
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
  Widget _buildGridordertext(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 123.v,
            crossAxisCount: 2,
            mainAxisSpacing: 51.h,
            crossAxisSpacing: 51.h,
          ),
          physics: ScrollPhysics(),
          itemCount: ref
                  .watch(dashboardNotifier)
                  .dashboardModelObj
                  ?.gridordertextItemList
                  .length ??
              0,
          itemBuilder: (context, index) {
            GridordertextItemModel model = ref
                    .watch(dashboardNotifier)
                    .dashboardModelObj
                    ?.gridordertextItemList[index] ??
                GridordertextItemModel();
            return GridordertextItemWidget(
              model,
              onTapColumnordertext: () {
                onTapColumnordertext(context);
              },
            );
          },
        );
      },
    );
  }

  onTapColumnordertext(BuildContext context) {}
  onTapCreatefromone(BuildContext context) {}
  onTapViewone(BuildContext context) {}
}
