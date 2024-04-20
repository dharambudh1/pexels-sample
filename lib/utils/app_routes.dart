import "package:get/get.dart";
import "package:pexels_sample/bindings/home_binding.dart";
import "package:pexels_sample/bindings/view_photo_binding.dart";
import "package:pexels_sample/screens/home_screen.dart";
import "package:pexels_sample/screens/view_photo_screen.dart";

class AppRoutes extends GetxService {
  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();
  static final AppRoutes _singleton = AppRoutes._internal();

  final String homeScreen = "/";
  final String viewPhotoScreen = "/viewPhotoScreen";

  List<GetPage<dynamic>> getPages() {
    final GetPage<dynamic> homeRoute = GetPage<dynamic>(
      name: homeScreen,
      page: HomeScreen.new,
      binding: HomeBinding(),
    );
    final GetPage<dynamic> viewPhotoRoute = GetPage<dynamic>(
      name: viewPhotoScreen,
      page: ViewPhotoScreen.new,
      binding: ViewPhotoBinding(),
    );
    return <GetPage<dynamic>>[
      homeRoute,
      viewPhotoRoute,
    ];
  }
}
