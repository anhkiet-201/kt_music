import 'package:flutter/material.dart';

class BouncingTapWaraper extends StatefulWidget {
  const BouncingTapWaraper({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<BouncingTapWaraper> createState() => _BouncingTapWaraperState();
}

class _BouncingTapWaraperState extends State<BouncingTapWaraper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  final Duration _durationAnimation = const Duration(milliseconds: 80);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _durationAnimation,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onPanDown: (details) {
              _animationController.forward();
            },
            onPanCancel: () {
              _animationController.reverse();
            },
            onPanUpdate: (_) {
              _animationController.reverse();
            },
            child: widget.child,
          ),
        );
      },
    );
  }
}
