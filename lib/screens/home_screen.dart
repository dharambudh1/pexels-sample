import "dart:convert";

import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:pexels_sample/common_widgets/common_gradient.dart";
import "package:pexels_sample/common_widgets/common_image_widget.dart";
import "package:pexels_sample/controllers/home_controller.dart";
import "package:pexels_sample/models/success_response.dart";
import "package:pexels_sample/utils/app_routes.dart";
import "package:pexels_sample/utils/maybe_marquee.dart";

class HomeScreen extends GetResponsiveView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget watch() {
    return commonScaffold(count: 1);
  }

  @override
  Widget phone() {
    return commonScaffold(count: 2);
  }

  @override
  Widget tablet() {
    return commonScaffold(count: 3);
  }

  @override
  Widget desktop() {
    return commonScaffold(count: 4);
  }

  Widget commonScaffold({required int count}) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pexels Sample"),
      ),
      body: SafeArea(
        child: pagedGridView(count: count),
      ),
    );
  }

  Widget pagedGridView({required int count}) {
    return PagedGridView<int, Photos>(
      shrinkWrap: true,
      pagingController: controller.pagingController.value,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
      ),
      builderDelegate: PagedChildBuilderDelegate<Photos>(
        itemBuilder: (BuildContext context, Photos photo, int index) {
          return pagedGridViewAdapter(photo: photo, index: index);
        },
      ),
    );
  }

  Widget pagedGridViewAdapter({required Photos photo, required int index}) {
    return Obx(
      () {
        return AnimatedScale(
          scale: controller.hoveringIndex.value == index ? 1.04 : 1.00,
          duration: const Duration(milliseconds: 250),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: controller.elevationAndOpacity(index: index) ? 8 : 4,
            margin: const EdgeInsets.all(8),
            child: Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: <Widget>[
                stackWidget(photo: photo, index: index),
                materialWidget(photo: photo, index: index),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget stackWidget({required Photos photo, required int index}) {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: <Widget>[
        CommonImageWidget(photo: photo, fit: BoxFit.cover),
        AnimatedOpacity(
          opacity: controller.elevationAndOpacity(index: index) ? 1.00 : 0.00,
          duration: const Duration(milliseconds: 250),
          child: commonGradientWidget(
            photo: photo,
            index: index,
          ),
        ),
      ],
    );
  }

  Widget materialWidget({required Photos photo, required int index}) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.transparent,
      child: MouseRegion(
        onEnter: (PointerEnterEvent pointerEnterEvent) {
          controller.hoveringIndex(index);
        },
        onExit: (PointerExitEvent pointerExitEvent) {
          controller.hoveringIndex(-1);
        },
        child: InkWell(
          onTap: () async {
            final Map<String, String> parameters = <String, String>{
              "item": json.encode(photo.toJson()),
            };
            await Get.toNamed(
              AppRoutes().viewPhotoScreen,
              parameters: parameters,
            );
          },
        ),
      ),
    );
  }

  Widget commonGradientWidget({required Photos photo, required int index}) {
    return CommonGradient(
      id: photo.id ?? 0,
      child: Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.transparent,
        child: MaybeMarqueeText(
          text: "📷 By: ${photo.photographer ?? ""}",
          style: const TextStyle(),
        ),
      ),
    );
  }
}
