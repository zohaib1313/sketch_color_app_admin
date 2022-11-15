import 'package:flutter/material.dart';
import 'package:sketch_color_app/common/app_styles.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
