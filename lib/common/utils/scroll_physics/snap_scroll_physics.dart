import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:kt_course/ui/pages/discover/discover_page.dart';

class ScrollSnappingPhysics extends ScrollPhysics {
  ScrollSnappingPhysics({super.parent});

  @override
  ScrollSnappingPhysics applyTo(ScrollPhysics? ancestor) {
    return ScrollSnappingPhysics(parent: buildParent(ancestor));
  }

  double _getPage(ScrollMetrics position) {
    return position.pixels / (1200);
  }

  double _getPixels(ScrollMetrics position, double page) {
    return min(page * (1500), position.maxScrollExtent);
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    final Tolerance tolerance = toleranceFor(position);
    final remainingScrollOffset = position.maxScrollExtent - position.pixels;
    if (remainingScrollOffset < DiscoverPage.pageSnapPoint) {
      return ScrollSpringSimulation(
          spring, position.pixels, position.maxScrollExtent, velocity,
          tolerance: tolerance);
    }
    if (position.outOfRange) {
      double? end;
      if (position.pixels > position.maxScrollExtent) {
        end = position.maxScrollExtent;
      }
      if (position.pixels < position.minScrollExtent) {
        end = position.minScrollExtent;
      }
      assert(end != null);
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        end!,
        min(0.0, velocity),
        tolerance: tolerance,
      );
    }
    if (velocity.abs() < tolerance.velocity) {
      return null;
    }
    if (velocity > 0.0 && position.pixels >= position.maxScrollExtent) {
      return null;
    }
    if (velocity < 0.0 && position.pixels <= position.minScrollExtent) {
      return null;
    }
    return ClampingScrollSimulation(
      position: position.pixels,
      velocity: velocity,
      tolerance: tolerance,
    );
  }

  @override
  bool get allowImplicitScrolling => false;
}
