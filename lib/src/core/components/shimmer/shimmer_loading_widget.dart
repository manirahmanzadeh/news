import 'package:flutter/material.dart';

import 'shimmer_screen_widget.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  final Widget child;
  final bool isLoading;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return Builder(
      builder: (BuildContext context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() {});
        });
        final shimmer = ShimmerScreen.of(context);
        if (!shimmer!.isSized) {
          return const SizedBox();
        }

        final shimmerSize = shimmer.size;
        final gradient = shimmer.gradient;
        final renderBox = context.findRenderObject();
        if (renderBox == null) return widget.child;

        final offsetWithinShimmer = shimmer.getDescendantOffset(
          descendant: renderBox as RenderBox,
        );

        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return gradient.createShader(
              Rect.fromLTWH(
                -offsetWithinShimmer.dx,
                -offsetWithinShimmer.dy,
                shimmerSize.width,
                shimmerSize.height,
              ),
            );
          },
          child: widget.child,
        );
      },
    );
  }
}
