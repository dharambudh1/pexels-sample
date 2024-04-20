import "dart:io";

import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_web_plugins/url_strategy.dart";
import "package:get/get.dart";
import "package:pexels_sample/firebase_options.dart";
import "package:pexels_sample/services/app_main_services.dart";
import "package:pexels_sample/utils/app_routes.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    usePathUrlStrategy();
  } else {}

  if (isSupportedPlatform()) {
    final FirebaseOptions options = DefaultFirebaseOptions().currentPlatform;
    await Firebase.initializeApp(options: options);
  } else {}

  injectDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pexels Sample",
      theme: themeData(brightness: Brightness.light),
      darkTheme: themeData(brightness: Brightness.dark),
      getPages: AppRoutes().getPages(),
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(seconds: 1),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData themeData({required Brightness brightness}) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorSchemeSeed: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      applyElevationOverlayColor: true,
    );
    return themeData;
  }
}

bool isSupportedPlatform() {
  return kIsWeb || Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
}
