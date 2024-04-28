import '../core/app_export.dart';
import 'package:flutter/material.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/appointment_screen/appointment_screen.dart';
import '../presentation/maintainence_screen/maintainence_screen.dart';
import '../presentation/signup_login_screen/signup_login_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/appointment_one_screen/appointment_one_screen.dart';
import 'package:money_mgmt/presentation/dashboard_page/dashboard_page.dart';
import '../presentation/maintainence_one_screen/maintainence_one_screen.dart';
import '../presentation/get_started_page_screen/get_started_page_screen.dart';
import '../presentation/signup_screen/signup_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String getStartedPageScreen = '/get_started_page_screen';

  static const String signupLoginScreen = '/signup_login_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String dashboardPage = '/dashboard_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String orderScreen = '/order_screen';
  static const String urgentDeliveryScreen = '/urgent_delivery_screen';
  static const String invoiceScreen = '/invoice_screen';
  static const String maintainenceScreen = '/maintainence_screen';
  static const String appointmentScreen = '/appointment_screen';
  static const String appointmentOneScreen = '/appointment_one_screen';
  static const String maintainenceOneScreen = '/maintainence_one_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    getStartedPageScreen: (context) => GetStartedPageScreen(),
    signupLoginScreen: (context) => SignupLoginScreen(),
    loginScreen: (context) => LoginScreen(),
    signupScreen: (context) => SignupScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    dashboardPage: (context) => DashboardPage(),
    initialRoute: (context) => GetStartedPageScreen(),
    // orderScreen: (context) => OrderScreen(),
    // maintainenceScreen: (context) => MaintainenceScreen(),
    // urgentDeliveryScreen: (context) => UrgentDeliveryScreen(),
    // invoiceScreen: (context) => InvoiceScreen(),
    appointmentScreen: (context) => AppointmentScreen(),
    maintainenceScreen: (context) => MaintenanceScreen(),
    appointmentOneScreen: (context) => AppointmentOneScreen(),
    maintainenceOneScreen: (context) => MaintenanceOneScreen(),
  };
}
