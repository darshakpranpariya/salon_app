import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/utils/animations.dart';
import 'package:salon_app/app/ui/utils/app_background.dart';
import 'package:salon_app/app/ui/utils/app_button.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

showToast({String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorConstants.toastBgColor,
    textColor: ColorConstants.whiteColor,
    fontSize: getSize(16),
  );
}

void showprofileImageBottomSheet(context, Function getImgFile) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
    builder: (BuildContext bc) {
      return Container(
        height: height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton.icon(
              onPressed: () async {
                Navigator.pop(context, true);
                PickedFile file = await ImagePicker().getImage(
                  source: ImageSource.camera,
                );

                File cropImage = await ImageCropper.cropImage(
                  sourcePath: file.path,
                  maxHeight: 2080,
                  maxWidth: 2080,
                  aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
                  androidUiSettings: AndroidUiSettings(
                      statusBarColor: ColorConstants.primaryColor,
                      backgroundColor: Colors.white,
//                                              toolbarTitle: 'Crop Image',
                      toolbarColor: ColorConstants.primaryColor,
                      toolbarWidgetColor: Colors.white),
                );
//

                getImgFile(cropImage);
              },
              icon: Icon(
                Icons.camera_alt,
                color: ColorConstants.primaryColor,
              ),
              label: Text(
                'Camera',
                style: TextStyle(
                  fontFamily: "Segoe",
                  color: ColorConstants.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: getSize(14),
                ),
              ),
            ),
            FlatButton.icon(
              onPressed: () async {
                Navigator.pop(context, true);
                PickedFile file = await ImagePicker().getImage(
                  source: ImageSource.camera,
                );
                // var image = await ImagePicker.pickImage(
                //     source: ImageSource.gallery,
                //     imageQuality: 50,
                //     maxHeight: 2080,
                //     maxWidth: 2080);

                File cropImage = await ImageCropper.cropImage(
                  sourcePath: file.path,
                  maxHeight: 2080,
                  maxWidth: 2080,
                  aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
                  androidUiSettings: AndroidUiSettings(
                      statusBarColor: ColorConstants.primaryColor,
                      backgroundColor: Colors.white,
//                                              toolbarTitle: 'Crop Image',
                      toolbarColor: ColorConstants.primaryColor,
                      toolbarWidgetColor: Colors.white),
                );
//

                getImgFile(cropImage);
              },
              icon: Icon(
                Icons.photo_library,
                color: ColorConstants.primaryColor,
              ),
              label: Text(
                'Gallery',
                style: TextStyle(
                  fontFamily: "Segoe",
                  color: ColorConstants.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: getSize(14),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

/// A styled dialog used with [showDialog].
///
/// If the [actions] contain discard and confirm actions, the discard action
/// should always be on the left while the confirm action should be on the
/// right.
class CustomDialog extends StatelessWidget {
  const CustomDialog({
    @required this.actions,
    this.title,
    this.text,
    this.body,
    this.backgroundColors,
    this.scrollPhysics,
  });

  final String title;
  final List<DialogAction> actions;

  /// The text is build below the [title] if not `null`.
  final String text;

  /// The body is build below the [text] if not `null`.
  final Widget body;

  /// The colors used by the [AppBackground].
  ///
  /// Uses the theme colors when `null`.
  final List<Color> backgroundColors;

  /// The scroll physics of the dialog (title, text + body).
  final ScrollPhysics scrollPhysics;

  List<Widget> _buildContent(TextTheme textTheme) {
    return <Widget>[
      if (title != null) ...[
        Text(title, style: textTheme.title, textAlign: TextAlign.center),
        const SizedBox(height: 12),
      ],
      if (text != null) ...[
        Text(text, style: textTheme.subtitle, textAlign: TextAlign.center),
        const SizedBox(height: 12),
      ],
      if (body != null) ...[
        body,
        const SizedBox(height: 12),
      ],
      const SizedBox(height: 12),
    ];
  }

  Widget _buildActions() {
    if (actions.length > 1) {
      return SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: actions,
        ),
      );
    } else if (actions.length == 1) {
      return actions.first;
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BounceInAnimation(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: AppBackground(
          colors: backgroundColors,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            // less on the bottom to compensate for the button padding
            padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    physics: scrollPhysics,
                    children: _buildContent(textTheme),
                  ),
                ),
                _buildActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNormalDialog extends StatelessWidget {
  const CustomNormalDialog({
    @required this.actions,
    this.title,
    this.text,
    this.body,
    this.backgroundColors,
  });

  final String title;
  final List<DialogAction> actions;

  /// The text is build below the [title] if not `null`.
  final String text;

  /// The body is build below the [text] if not `null`.
  final Widget body;

  /// The colors used by the [AppBackground].
  ///
  /// Uses the theme colors when `null`.
  final List<Color> backgroundColors;

  List<Widget> _buildContent(TextTheme textTheme) {
    return <Widget>[
      if (title != null) ...[
        Text(title, style: textTheme.title, textAlign: TextAlign.center),
        const SizedBox(height: 12),
      ],
      if (text != null) ...[
        Text(text, style: textTheme.subtitle, textAlign: TextAlign.center),
        const SizedBox(height: 12),
      ],
      if (body != null) ...[
        body,
        const SizedBox(height: 12),
      ],
      const SizedBox(height: 12),
    ];
  }

  Widget _buildActions() {
    if (actions.length > 1) {
      return SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: actions,
        ),
      );
    } else if (actions.length == 1) {
      return actions.first;
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: _buildContent(textTheme),
            ),
            _buildActions(),
          ],
        ),
      ),
    );
  }
}

/// An action for a [CustomDialog].
///
/// If [result] is not `null` the action will pop the dialog with the [result].
/// If [onTap] is not `null` the action will execute the callback.
///
/// The action will build a text button with [text] or an icon button with
/// [icon].
///
/// Either [text] or [icon] must not be `null`.
class DialogAction<T> extends StatelessWidget {
  const DialogAction(
      {this.result,
      this.onTap,
      this.text,
      this.icon,
      this.dense = true,
      this.isWhite = true})
      : assert(result != null || onTap != null),
        assert(text != null || icon != null);

  final T result;
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final bool dense;
  final bool isWhite;

  static DialogAction<bool> discard = const DialogAction(
    result: false,
    icon: Icons.close,
  );

  static DialogAction<bool> confirm = const DialogAction(
    result: true,
    icon: Icons.check,
  );

  @override
  Widget build(BuildContext context) {
    final Function callback = onTap ?? () => Navigator.of(context).pop(result);

    if (text != null) {
      return AppButton.flat(
        text: text,
        onTap: callback,
        dense: dense,
        backgroundColor: Colors.transparent,
        textColor: isWhite ? Colors.white : Colors.black,
      );
    } else if (icon != null) {
      return AppButton.flat(
        icon: icon,
        onTap: callback,
        dense: dense,
        backgroundColor: Colors.transparent,
        textColor: isWhite ? Colors.white : Colors.black,
      );
    } else {
      return Container();
    }
  }
}

/// Builds a [CustomDialog] to inform about a feature being only available for
/// the pro version of app.
class ProgressDialog extends StatefulWidget {
  const ProgressDialog({
    @required this.message,
  });

  /// The name of the feature.
  final String message;

  @override
  _ProgressDialogState createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(getSize(16)),
        child: Material(
          type: MaterialType.transparency,
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              SizedBox(
                width: getSize(20),
              ),
              new Text(widget.message),
            ],
          ),
        ),
      ),
    );
  }
}

/// Builds a [CustomDialog] to inform about a feature being only available for
/// the pro version of app.
class AppExitDialog extends StatefulWidget {
  const AppExitDialog({
    @required this.message,
  });

  /// The name of the feature.
  final String message;

  @override
  _AppExitDialogState createState() => _AppExitDialogState();
}

class _AppExitDialogState extends State<AppExitDialog> {
  GestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _recognizer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.subtitle;

    final linkStyle = style.copyWith(
      color: theme.accentColor,
      fontWeight: FontWeight.bold,
    );

    return CustomDialog(
      title: "updateAvailable",
      body: Column(
        children: <Widget>[
//          const FlareIcon.shiningStar(size: 64),
          const SizedBox(height: 12),
          Text(
            widget.message,
            style: style,
          ),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "downloadAppFrom",
                ),
                TextSpan(
                  text: " ",
                ),
                TextSpan(
                  text: "PlayStore",
                  style: linkStyle,
                  recognizer: _recognizer,
                ),
              ],
            ),
            style: style,
          ),
        ],
      ),
      actions: [
        DialogAction<bool>(
          result: false,
          text: "skipUpdate",
        ),
      ],
    );
  }
}
