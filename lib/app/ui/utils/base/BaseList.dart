import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/theme/app_text_theme.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

class BaseList extends StatelessWidget {
  BaseList({Key key, this.controller, this.pagedListView}) : super(key: key);

  PagingController controller;
  PagedListView pagedListView;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => Future.sync(
              () => controller.refresh(),
            ),
        child: pagedListView);
  }
}

class FirstPageErrorIndicator extends StatelessWidget {
  FirstPageErrorIndicator({this.onTryAgain});
  VoidCallback onTryAgain;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => onTryAgain(),
      ),
      child: Center(
        child: Text(
          "Error",
          style: black28BigLableTextStyle,
        ),
      ),
    );
  }
}

class NewPageErrorIndicator extends StatelessWidget {
  VoidCallback onTryAgain;
  NewPageErrorIndicator({this.onTryAgain});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => onTryAgain(),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getSize(15)),
          child: Text(
            "some thing went wrong!!",
            style: black18TitleTextStyle,
          ),
        ),
      ),
    );
  }
}

class FirstPageProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index.isEven ? primaryColor : primaryColor.withOpacity(0.2),
          ),
        );
      },
    );
  }
}

class NewPageProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? primaryColor : whiteColor,
          ),
        );
      },
    );
  }
}

class NoItemsFoundIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? primaryColor : primaryColor.withOpacity(0.2),
          ),
        );
      },
    );
  }
}

class NoMoreItemsIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? primaryColor : primaryColor,
          ),
        );
      },
    );
  }
}
