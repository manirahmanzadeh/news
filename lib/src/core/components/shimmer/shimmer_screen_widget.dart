import 'package:flutter/material.dart';

class ShimmerScreen extends StatefulWidget {
  static ShimmerScreenState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerScreenState>();
  }

  const ShimmerScreen({
    super.key,
    this.child,
    required this.enabled,
  });

  final Widget? child;
  final bool enabled;

  @override
  ShimmerScreenState createState() => ShimmerScreenState();
}

class ShimmerScreenState extends State<ShimmerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    if (widget.enabled) {
      _shimmerController = AnimationController.unbounded(vsync: this)
        ..repeat(
          min: -1,
          max: 1,
          period: const Duration(milliseconds: 1000),
        );
      _shimmerController.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  Gradient get gradient => LinearGradient(
        colors: const [
          Color(0xFFEBEBF4),
          Color(0xFFF4F4F4),
          Color(0xFFEBEBF4),
        ],
        stops: const [
          0.1,
          0.3,
          0.4,
        ],
        begin: const Alignment(-1.0, -0.3),
        end: const Alignment(1.0, 0.3),
        transform: _SlidingGradientTransform(slidePercent: _shimmerController.value, screenWidth: MediaQuery.sizeOf(context).width),
      );

  bool get isSized => (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
    required this.screenWidth,
  });

  final double slidePercent;
  final double screenWidth;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(screenWidth * slidePercent, 0.0, 0.0);
  }
}
