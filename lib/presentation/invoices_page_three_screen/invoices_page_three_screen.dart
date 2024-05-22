import 'package:flutter/material.dart';
import 'package:oll2u/core/utils/get_route.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'notifier/invoices_page_three_notifier.dart';

class InvoicesPageThreeScreen extends ConsumerStatefulWidget {
  const InvoicesPageThreeScreen({Key? key, required this.invoiceID})
      : super(
          key: key,
        );
  final int invoiceID;
  @override
  InvoicesPageThreeScreenState createState() => InvoicesPageThreeScreenState();
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class InvoicesPageThreeScreenState
    extends ConsumerState<InvoicesPageThreeScreen> {
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
                        SizedBox(height: 59.v),
                        Container(
                          height: SizeUtils.height - 146.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xD90F5323), // First color
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgInvoice,
                                height: 176.v,
                                width: 393.h,
                                color: Color.fromARGB(217, 11, 55, 24),
                              ),
                              SizedBox(height: 9.v),
                              FutureBuilder<Map<String, dynamic>>(
                                  future: ref
                                      .read(invoicesPageThreeNotifier.notifier)
                                      .getInvoiceDetails(
                                          invoiceID: widget.invoiceID,
                                          context: context),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      Map<String, dynamic> data =
                                          snapshot.data!;
                                      bool isUrgent =
                                          data["urgent_delivery"] != null
                                              ? true
                                              : false;

                                      String? checkPrice() {
                                        if (isUrgent) {
                                          return data["urgent_delivery"]
                                              ["price"];
                                        } else {
                                          return data["order"]["price"];
                                        }
                                      }

                                      return Container(
                                          width: 327.h,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 32.h),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Scheduled Delivery",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: theme.textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 24.fSize,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Date: ",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: theme.textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 24.fSize,
                                                    ),
                                                  ),
                                                  Text(
                                                    " ${isUrgent ? data["urgent_delivery"]["date"] : data["order"]["start_date"]}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: theme.textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 24.fSize,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Company Name: ",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: theme.textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 24.fSize,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      " ${data["user"]["company_name"] ?? ""}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 3,
                                                      style: theme.textTheme
                                                          .headlineSmall!
                                                          .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 20.fSize,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Quantity: ${isUrgent ? data["urgent_delivery"]["quantity"] : data["order"]["quantity"]}L",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: theme.textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 24.fSize,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              checkPrice() == null
                                                  ? SizedBox()
                                                  : Row(
                                                      children: [
                                                        Text(
                                                          "Price: ${checkPrice()}AUD",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: theme.textTheme
                                                              .headlineSmall!
                                                              .copyWith(
                                                            color: Colors.black,
                                                            fontSize: 24.fSize,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            ],
                                          ));
                                    }

                                    return Center(
                                      child: Container(
                                        height: 40.v,
                                        width: 40.v,
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                          valueColor: AlwaysStoppedAnimation(
                                            Colors.orange,
                                          ),
                                          strokeWidth: 4,
                                        ),
                                      ),
                                    );
                                  }),
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
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.only(right: 4.h),
        //   child: _buildBottomBar(context),
        // ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        NavigatorService.pushNamed(getCurrentRoute(type, BottomBarEnum.none));
      },
    );
  }
}
