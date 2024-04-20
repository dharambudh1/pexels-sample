import "dart:convert";

import "package:flutter/foundation.dart";
import "package:get/get.dart";
import "package:pexels_sample/models/success_response.dart";

class ViewPhotoController extends GetxController {
  final Rx<Photos> photo = Photos().obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters is Map<String, String>) {
      if (!mapEquals(Get.parameters, <String, String>{})) {
        if (Get.parameters.containsKey("item")) {
          final String params = Get.parameters["item"] ?? "";
          if (params.isNotEmpty) {
            final Map<String, dynamic> decodedData = json.decode(params);
            Photos model = Photos();
            model = Photos.fromJson(decodedData);
            
            photo(model);
          } else {}
        } else {}
      } else {}
    } else {}
  }

  @override
  void onClose() {
    photo.close();
    super.onClose();
  }
}
