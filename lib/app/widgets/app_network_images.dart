import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

 class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.height = 200,
    this.weight = double.infinity,
    this.fit = BoxFit.cover
  });
  final String url;
  final double height;
  final double weight;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      height: height,
      width: weight,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
