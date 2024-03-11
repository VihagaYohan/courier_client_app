import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// models
import 'package:courier_client_app/models/models.dart';

class OnBoardingScreen extends StatelessWidget {
  List<Onboarding> onboardingItems = [
    Onboarding(
        index: 0,
        imageUrl: 'assets/images/svgs/onboarding_1.svg',
        title: "title 1"),
    Onboarding(
        index: 1,
        imageUrl: 'assets/images/svgs/onboarding_2.svg',
        title: "title 2"),
    Onboarding(
        index: 2,
        imageUrl: 'assets/images/svgs/onboarding_3.svg',
        title: "title 3")
  ];

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        children: Column(
      children: <Widget>[
        Expanded(
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: onboardingItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            width: 200,
                            height: 200,
                            image: Svg(onboardingItems[index].imageUrl))
                      ],
                    ),
                  );
                }))
      ],
    ));
  }
}
