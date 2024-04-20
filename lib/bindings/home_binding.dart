import "package:get/get.dart";
import "package:pexels_sample/controllers/home_controller.dart";

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(HomeController.new);
  }
}
