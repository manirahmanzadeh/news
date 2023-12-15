import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    this.height = 125,
    this.borderRadius = 20,
    required this.width,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
    this.gradientBlur = false,
    this.wholeBlur = false,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;
  final bool gradientBlur;
  final bool wholeBlur;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: imageUrl.isNotEmpty
              ? DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                )
              : null,
          color: Colors.white),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: wholeBlur ? Colors.black.withOpacity(0.5) : null,
          gradient: gradientBlur
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0), // Top color with zero opacity
                    Colors.black.withOpacity(0.5), // Bottom color with 0.5 opacity
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
