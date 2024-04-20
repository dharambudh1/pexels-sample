import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:pexels_sample/common_widgets/common_gradient.dart";
import "package:pexels_sample/common_widgets/common_image_widget.dart";
import "package:pexels_sample/controllers/view_photo_controller.dart";
import "package:pexels_sample/models/success_response.dart";
import "package:pexels_sample/utils/maybe_marquee.dart";

class ViewPhotoScreen extends GetResponsiveView<ViewPhotoController> {
  ViewPhotoScreen({super.key});

  @override
  Widget watch() {
    return commonScaffold();
  }

  @override
  Widget phone() {
    return commonScaffold();
  }

  @override
  Widget tablet() {
    return commonScaffold();
  }

  @override
  Widget desktop() {
    return commonScaffold();
  }

  Widget commonScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Photo"),
      ),
      body: SafeArea(
        child: cardImageWidget(),
      ),
    );
  }

  Widget cardImageWidget() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 8,
            margin: const EdgeInsets.all(16),
            child: CommonImageWidget(
              photo: controller.photo.value,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        commonGradientWidget(
          photo: controller.photo.value,
          index: 0,
        ),
      ],
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
