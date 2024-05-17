import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_mgmt/core/app_export.dart';
import 'package:money_mgmt/widgets/custom_elevated_button.dart';

import '../invoices_page_one_screen/notifier/invoices_page_one_notifier.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  void initState() {
    // if (mounted) {
    // ref.read(invoicesPageOneNotifier).notificationStatus!.value = {
    //   "id": PrefUtils().getNotificationID(),
    //   "status": "seen",
    // };
    // }
    super.initState();
  }

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
                CustomImageView(
                  imagePath: ImageConstant.imgLogo,
                  height: 146.v,
                  width: 333.h,
                ),
                SizedBox(height: 59.v),
                Expanded(
                  child: Container(
                    height: SizeUtils.height - 146.v,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(217, 229, 247, 93), // First color
                          Color(0x66D9D9D9), // Second color
                        ],
                        stops: [0.0, 0.81], // Stop positions
                        begin: Alignment.topCenter, // Gradient start position

                        end: Alignment.bottomCenter, // Gradient end position
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Color.fromARGB(217, 11, 55, 24),
                          size: 115.v,
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: ref
                                .read(invoicesPageOneNotifier.notifier)
                                .getAllNotification(context),
                            builder: (context,
                                AsyncSnapshot<List<dynamic>> snapshot) {
                              if (snapshot.hasData) {
                                List<dynamic> data = snapshot.data!;
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> items = data[index];
                                      String orderDate =
                                          DateFormat('yyyy-MM-dd').format(
                                              DateTime.parse(
                                                  data[index]["date"]));
                                      return Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Color(0xFF63681B),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Date: ${orderDate}",
                                                  style: theme
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Status: ${items["status"].toString().toUpperCase()}",
                                                  style: theme
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16.fSize,
                                                  ),
                                                ),
                                                items["status"] == "processing"
                                                    ? SizedBox()
                                                    : CustomElevatedButton(
                                                        width: 120.h,
                                                        height: 30,
                                                        text: "Completed",
                                                        onPressed: () {
                                                          showPopup(int.parse(
                                                              items["id"]
                                                                  .toString()));
                                                        },
                                                        buttonTextStyle: theme
                                                            .textTheme
                                                            .headlineSmall!
                                                            .copyWith(
                                                          fontSize: 12.fSize,
                                                          color: Colors.white,
                                                        ),
                                                        buttonStyle:
                                                            ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .resolveWith(
                                                                      (states) {
                                                            return Color(
                                                                0xFF4B984D);
                                                          }),
                                                          shadowColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .grey),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  items["status"] == "pending"
                                                      ? "The order is Pending"
                                                      : "The order has been ${items["status"].toString().toUpperCase()}",
                                                  style: theme
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 12.fSize,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
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
                            },
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

  void showPopup(int orderID) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xE6D9D9D9),
          surfaceTintColor: Color(0xE6D9D9D9),
          title: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              right: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "SHIPPED *",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: appTheme.green600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: SizeUtils.width - 50,
            height: 100.v,
            child: Center(
              child: Text(
                "Have you received your order?",
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: appTheme.green600,
                ),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          actions: [
            CustomElevatedButton(
              width: 120.h,
              height: 30,
              text: "Confirm",
              onPressed: () {
                ref
                    .read(invoicesPageOneNotifier.notifier)
                    .updateOrderStatus(context, orderID);
              },
              buttonTextStyle: theme.textTheme.headlineSmall!.copyWith(
                fontSize: 12.fSize,
                color: Colors.white,
              ),
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Color(0xFF4B984D);
                }),
                shadowColor: MaterialStateProperty.all(Colors.grey),
              ),
            ),
            SizedBox(
              width: 20.v,
            ),
            CustomElevatedButton(
              width: 100.h,
              height: 30,
              text: "Deny",
              onPressed: () {
                Navigator.pop(context);
              },
              buttonTextStyle: theme.textTheme.headlineSmall!.copyWith(
                fontSize: 12.fSize,
                color: Colors.white,
              ),
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Color(0xFF4B984D);
                }),
                shadowColor: MaterialStateProperty.all(Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }
}
