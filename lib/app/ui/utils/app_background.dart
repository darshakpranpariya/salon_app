import 'package:flutter/material.dart';
import 'package:salon_app/app/ui/theme/app_theme.dart';

/// Builds a background with a gradient from top to bottom.
///
/// The [colors] default to the [AppTheme.backgroundColors] if omitted.
class AppBackground extends StatelessWidget {
  const AppBackground({
    this.child,
    this.colors,
    this.borderRadius,
  });

  final Widget child;
  final List<Color> colors;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = colors ?? appThemeData.backgroundColor;

    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors ?? backgroundColor,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Directionality(
          child: child ?? Container(),
        ),
      ),
    );
  }
}
