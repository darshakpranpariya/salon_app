import 'dart:math';
import 'package:flutter/material.dart';
import 'package:salon_app/app/ui/utils/implicit_animation.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

/// A simple circular button mainly used by the [MediaVideoPlayer].
class CircleButton extends StatelessWidget {
  const CircleButton({
    @required this.child,
    this.backgroundColor = Colors.black26,
    this.highlightColor = Colors.white10,
    this.splashColor = Colors.white24,
    this.padding = const EdgeInsets.all(8),
    this.onPressed,
  });

  final Widget child;
  final Color backgroundColor;
  final Color highlightColor;
  final Color splashColor;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.circle,
      color: backgroundColor,
      child: InkWell(
        highlightColor: highlightColor,
        splashColor: splashColor,
        onTap: onPressed,
        customBorder: CircleBorder(),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

/// The base for the [AppButton].
///
/// Uses [AnimatedScale] to have the button appear pressed down while it is
/// tapped.
class _AppButtonBase extends StatefulWidget {
  const _AppButtonBase({
    @required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  _AppButtonBaseState createState() => _AppButtonBaseState();
}

class _AppButtonBaseState extends State<_AppButtonBase> {
  bool _tapDown = false;

  void _updateTapDown(bool value) {
    if (widget.onTap != null && _tapDown != value) {
      setState(() {
        _tapDown = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _tapDown ? .9 : 1,
      child: GestureDetector(
        onTapDown: (_) => _updateTapDown(true),
        onTapUp: (_) => _updateTapDown(false),
        onTapCancel: () => _updateTapDown(false),
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}

/// A custom button with a rounded border that uses an [AnimatedScale] to
/// appear pressed down on tap.
///
/// The [AppButton.raised] builds a button with elevation and a
/// [backgroundColor].
///
/// The [AppButton.flat] builds a flat button with a transparent background.
///
/// The button can have an [icon] and [text]. When both are not `null`, the
/// icon is built to the left of the text with a padding in between that is
/// half of its vertical padding.
///
/// Alternatively to [icon], an [iconBuilder] can be used to build the icon
/// widget with more control.
///
/// Either [icon], [iconBuilder] or [text] must not be `null`.
class AppButton extends StatelessWidget {
  /// A button that appears raised with a shadow.
  ///
  /// Uses the [ThemeData.buttonColor] as the [backgroundColor] by default.
  const AppButton.raised({
    @required this.onTap,
    this.text,
    this.textSize,
    this.textColor,
    this.icon,
    this.iconColor,
    this.buttonHeight = 50,
    this.iconSize,
    this.iconBuilder,
    this.backgroundColor,
    this.isButtonEnabled = true,
    this.isBorder = false,
    this.dense = false,
    this.fitWidth = false,
    this.padding,
    this.foregroundColor,
    this.isIconRightSide = false,
    this.borderRadius = 0,
  })  : materialType = MaterialType.canvas,
        elevation = 8,
        assert(text != null || icon != null || iconBuilder != null);

  /// A flat button that has a transparent background and no shadow.
  ///
  /// Should only be used when the context makes it clear it can be tapped.
  const AppButton.flat(
      {@required this.onTap,
      this.text,
      this.textColor = Colors.white,
      this.icon,
      this.iconColor,
      this.textSize = 18,
      this.iconSize,
      this.buttonHeight = 50,
      this.iconBuilder,
      this.backgroundColor = Colors.blue,
      this.dense = false,
      this.fitWidth = false,
      this.padding,
      this.foregroundColor,
      this.isIconRightSide = false,
      this.isButtonEnabled = true,
      this.isBorder = false,
      this.borderRadius})
      : materialType = MaterialType.canvas,
        elevation = 2,
        assert(text != null || icon != null || iconBuilder != null);

  /// The [text] of the button.
  ///
  /// Can be `null` if the button has no text.
  final String text;
  final double textSize;
  final bool isIconRightSide;

  /// The color of the Text.
  ///
  /// Uses the [ThemeData.textTheme.button.color] if `null`.
  final Color textColor;

  /// The [icon] of the button.
  ///
  /// Can be `null` if the button has no icon.
  final IconData icon;
  final Color iconColor;

  final double buttonHeight;

  /// The size of the [icon];
  final double iconSize;

  /// Can be used in place of [icon] to build the icon widget.
  final WidgetBuilder iconBuilder;

  /// The callback when the button is tapped.
  ///
  /// If `null`, the button is slightly transparent to appear disabled.
  final VoidCallback onTap;

  /// The color of the button.
  ///
  /// Uses the [ThemeData.buttonColor] if `null`.
  final Color backgroundColor;

  final double borderRadius;

  /// The color of the [icon] and [text] of the button.
  ///
  /// Defaults to [TextTheme.button] if the [backgroundColor] is `null`,
  /// to the [TextTheme.body1] color if the [backgroundColor] is transparent
  /// or to a complimentary color when [backgroundColor] is set.
  final Color foregroundColor;

  /// Whether or not the button should have less padding.
  ///
  /// Has no effect if [padding] is not `null`.
  final bool dense;
  final bool isButtonEnabled;
  final bool fitWidth;
  final bool isBorder;

  /// The padding for the button.
  ///
  /// Should usually be `null` to use the default padding that is controlled
  /// with [dense] if a smaller padding is required.
  final EdgeInsets padding;

  /// The [elevation] that changes when using a [AppButton.flat] or
  /// [AppButton.raised].
  final double elevation;

  /// Determines the material type that the button uses as its background.
  ///
  /// Set to [MaterialType.transparency] for [AppButton.flat] and
  /// [MaterialType.canvas] for [AppButton.raised].
  final MaterialType materialType;

  EdgeInsets get _padding =>
      padding ??
      EdgeInsets.symmetric(
        vertical: dense ? 4 : 8,
        horizontal: dense ? 8 : 16,
      );

  /// Returns the color for the [icon] and [text].
  Color _getForegroundColor(ThemeData theme) {
    if (foregroundColor != null) {
      return foregroundColor;
    } else if (materialType == MaterialType.transparency) {
      // the text color since the button is transparent, therefore directly
      // on the background

      return theme.textTheme.body1.color;
    } else if (backgroundColor == null) {
      // dont override the button color
      return theme.textTheme.button.color;
    } else {
      // black or white depending on the background color
      final brightness = ThemeData.estimateBrightnessForColor(backgroundColor);

      return brightness == Brightness.light ? Colors.black : Colors.white;
    }
  }

  /// Builds the row with the [Icon] and [Text] widget.
  Widget _buildContent(BuildContext context) {
    Widget iconWidget;
    Widget textWidget;

    if (text != null) {
      // need to make sure the text overflow is handled when the button size is
      // constrained, for example during an AnimatedCrossFade transition
      textWidget = Text(
        text,
        //textAlign: fitWidth ? TextAlign.center : TextAlign.start,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          // color: textColor == null ? primaryColor : textColor,
          color: textColor,
          fontSize: getFontSize(textSize),
        ),
        overflow: TextOverflow.fade,

        softWrap: false,
      );
    }

    if (icon != null) {
      iconWidget = Icon(
        icon,
        color: Colors.white,
      );
    } else if (iconBuilder != null) {
      iconWidget = iconBuilder(context);
    }

    return IntrinsicWidth(
      child: isIconRightSide
          ? Stack(
              alignment: Alignment.center,
              children: <Widget>[
                if (textWidget != null) textWidget,
                if (iconWidget != null && textWidget != null)
                  SizedBox(width: _padding.vertical / 4),
                if (iconWidget != null) iconWidget,
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: <Widget>[
                if (iconWidget != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: iconWidget,
                  ),
                if (iconWidget != null && textWidget != null)
                  SizedBox(width: _padding.vertical / 4),
                if (textWidget != null) textWidget,
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadiusVar = BorderRadius.circular(borderRadius ?? getSize(8));

    Color bgColor = backgroundColor;
    Color fgColor = backgroundColor;

    if (onTap == null) {
      // reduce the opacity by 30% when disabled
      bgColor = bgColor.withOpacity(max(0, bgColor.opacity - 0.3));
      fgColor = fgColor.withOpacity(max(0, fgColor.opacity - 0.3));
    }

    return _AppButtonBase(
      onTap: isButtonEnabled ? onTap : null,
      child: AnimatedTheme(
        data: ThemeData(
          // material background color
          canvasColor: bgColor,
          // text color
          // textTheme: TextTheme(
          //   button: theme.textTheme.button.copyWith(color: fgColor),
          // ),

          // icon color
          iconTheme: IconThemeData(color: fgColor, size: iconSize),
        ),
        child: Material(
          elevation: elevation,
          type: materialType,
          borderRadius: borderRadiusVar,
          child: Container(
            height: getSize(buttonHeight),
            width: fitWidth ? MediaQuery.of(context).size.width : null,
            decoration: isBorder
                ? BoxDecoration(
                    border: Border.all(
                      width: getSize(1.2),
                      // color: appTheme.colorPrimary,
                    ),
                    borderRadius: borderRadiusVar,
                  )
                : BoxDecoration(),
            child: Padding(
              padding: _padding,
              // use a builder so the context references the animated theme
              child: Builder(builder: _buildContent),
            ),
          ),
        ),
      ),
    );
  }
}
