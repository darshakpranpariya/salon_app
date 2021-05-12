import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/ui/constants/image_constants.dart';

class SalonDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            IconButton(icon: Icon(Icons.message), onPressed: () {}),
          ],
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(appbar),
          ),
        )
      ],
    );
  }
}
