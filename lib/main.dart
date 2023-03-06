import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liga_corner_app/pages/edit_profile.dart';
import 'package:liga_corner_app/pages/resumen_resultados_pages.dart';
import 'package:liga_corner_app/pages/settingsProfile.dart';
import 'package:liga_corner_app/widgets/animated_nav_bar_item.dart';
import 'package:liga_corner_app/widgets/color_schemes.g.dart';
import 'package:liga_corner_app/widgets/nav_bar.dart';
import 'package:liga_corner_app/widgets/nav_bar_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/settinsProfile': (context) => const SettingsProfilePage(),
        '/edid_Profile': (context) => const EdidProfile(),
      },
      debugShowCheckedModeBanner: false,
      home: const NavigationExample(),
    );
  }
}
