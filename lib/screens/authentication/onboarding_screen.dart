import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        children: Column(
      children: [
        Image(
          image: Svg("assets/images/svgs/onboarding_3.svg"),
          width: 100,
          height: 100,
        )
      ],
    ));
  }
}
