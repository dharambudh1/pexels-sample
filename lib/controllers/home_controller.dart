import "package:flutter/foundation.dart";
import "package:get/get.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:logger/logger.dart";
import "package:pexels_sample/models/success_response.dart";
import "package:pexels_sample/services/api_service.dart";
import "package:pexels_sample/utils/app_snackbar.dart";

class HomeController extends GetxController {
  final RxInt _pageSize = 10.obs;
  final RxInt hoveringIndex = (-1).obs;
  final Rx<PagingController<int, Photos>> pagingController =
      PagingController<int, Photos>(firstPageKey: 1).obs;

  @override
  void onInit() {
    super.onInit();
    pagingController.value.addPageRequestListener(_fetchPage);
  }

  @override
  void onClose() {
    _pageSize.close();
    hoveringIndex.close();
    pagingController.value.removePageRequestListener(_fetchPage);
    pagingController.value.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<Photos> newItems = await apiCall(page: pageKey);
      final bool isLastPage = newItems.length < _pageSize.value;
      isLastPage
          ? pagingController.value.appendLastPage(newItems)
          : pagingController.value.appendPage(newItems, pageKey + 1);
    } on Exception catch (error, stackTrace) {
      Logger().e("functionGet() catch:", error: error, stackTrace: stackTrace);

      pagingController.value.error = error;
    }
  }

  Future<List<Photos>> apiCall({required int page}) async {
    final List<Photos> photosList = <Photos>[].obs;
    await APIService().functionGet(
      endPoint: "/curated",
      page: page,
      perPage: _pageSize.value,
      successCallback: (Map<String, dynamic> json) {
        SuccessResponse successResponse = SuccessResponse();
        successResponse = SuccessResponse.fromJson(json);
        photosList.addAll(successResponse.photos ?? <Photos>[]);
      },
      failureCallback: (Map<String, dynamic> json) {
        if (!mapEquals(json, <String, String>{})) {
          if (json.containsKey("code")) {
            final String message = json["code"] ?? "";
            if (message.isNotEmpty) {
              AppSnackbar().snackbar(message);
            } else {}
          } else {}
        } else {}
      },
    );
    return Future<List<Photos>>.value(photosList);
  }

  bool elevationAndOpacity({required int index}) {
    return (kIsWeb || GetPlatform.isDesktop)
        ? hoveringIndex.value == index || (Get.context?.isPhone ?? false)
        : GetPlatform.isMobile;
  }
}
