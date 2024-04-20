import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:pexels_sample/models/success_response.dart";

class CommonImageWidget extends StatelessWidget {
  const CommonImageWidget({
    required this.photo,
    required this.fit,
    super.key,
  });

  final Photos photo;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "photo_${photo.id}",
      transitionOnUserGestures: true,
      child: CachedNetworkImage(
        imageUrl: photo.src?.large ?? "",
        height: double.infinity,
        width: double.infinity,
        fit: fit,
        useOldImageOnUrlChange: true,
        errorWidget: (BuildContext context, String url, Object error) {
          return const Icon(Icons.error);
        },
        progressIndicatorBuilder: (
          BuildContext context,
          String string,
          DownloadProgress prgs,
        ) {
          return Center(child: CircularProgressIndicator(value: prgs.progress));
        },
      ),
    );
  }
}
