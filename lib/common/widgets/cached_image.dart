import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/gen/assets.gen.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
    this.imageUrl, {
    this.radius = 9,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    super.key,
  });

  final String imageUrl;
  final double radius;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => const Center(child: SizedBox()),
        height: height,
        width: double.infinity,
        filterQuality: FilterQuality.high,
        errorWidget: (context, url, error) {
          return Assets.images.placeholderImage.image(
            fit: fit,
            height: height,
            width: width,
          );
        },
      ),
    );
  }
}
