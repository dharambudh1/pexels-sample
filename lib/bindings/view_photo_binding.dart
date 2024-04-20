import "package:get/get.dart";
import "package:pexels_sample/controllers/view_photo_controller.dart";

class ViewPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ViewPhotoController.new);
  }
}
