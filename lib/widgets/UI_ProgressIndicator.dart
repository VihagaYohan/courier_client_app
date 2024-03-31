import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class UIProgressIndicator extends StatelessWidget {
  final String? title;

  const UIProgressIndicator({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: DeviceUtils.isDarkmode(context) == true
              ? AppColors.white
              : AppColors.dark),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.primary,
              backgroundColor: AppColors.primary.withOpacity(0.2),
              strokeCap: StrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}
