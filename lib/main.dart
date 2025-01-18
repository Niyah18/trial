import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial/appointment/personalised_advice.dart';
import 'package:trial/hiddenprofilepage/hidden_profile_page';
//import 'package:trial/hiddenprofilepage/hidden_profile_page.dart';
import 'package:trial/infoandresources/information_and_resources.dart';
import 'package:trial/menu/menu_page.dart';
import 'package:trial/nearbyresources/nearby_resources.dart';
import 'package:trial/pages/login_page.dart';  // Your login page
import 'package:trial/placement/data_storage_page.dart';
import 'package:trial/placement/help_page';
import 'package:trial/placement/logout_page.dart';
import 'package:trial/placement/notifications_page.dart';
import 'package:trial/placement/profile_page';
import 'package:trial/themes/theme_provider.dart';  // Ensure you have this file for ThemeProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),  // Provide ThemeProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),  // Start with the LoginPage
      theme: themeProvider.themeData,  // Use the theme from the provider
      routes: {
        '/menu/menu_page': (context) => MenuPage(),
        '/personalised_advice': (context) => AppointmentPage(),
        '/nearby_resources': (context) => NearbyLocationPage(),
        '/information_and_resources': (context) => InformationPage(),
        '/profile': (context) => ProfilePage(),  // Example placeholder
        '/hidden_profile': (context) => HiddenProfilePage(),  // Example placeholder
        '/help': (context) => HelpPage(),  // Example placeholder
        '/notifications': (context) => NotificationsPage(),  // Example placeholder
        '/data_storage': (context) => DataStoragePage(),  // Example placeholder
        '/logout': (context) => LogoutPage(),  // Example placeholder
      },
    );
  }
}
