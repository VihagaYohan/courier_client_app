import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// models
import 'package:courier_client_app/models/models.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Onboarding> onboardingItems = [
    Onboarding(
        index: 0,
        imageUrl: 'assets/images/svgs/onboarding_1.svg',
        title: 'Best package delivery\nfor you'),
    Onboarding(
        index: 1,
        imageUrl: 'assets/images/svgs/onboarding_2.svg',
        title: "Track your parcel from anywhere"),
    Onboarding(
        index: 2,
        imageUrl: 'assets/images/svgs/onboarding_3.svg',
        title: "Get your parcel safely on time")
  ];

  int currentIndex = 0;
  static dynamic currentPageValue = 0.0;

  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return UIContainer(
        children: Stack(
      children: <Widget>[
        PageView.builder(
          controller: _pageController,
          itemCount: onboardingItems.length,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PageItem(onboardingItems[index]);
          },
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: UIElevatedButton(
              label: currentIndex != 2 ? 'Next' : 'Done',
              onPress: () {
                if (currentIndex != 2) {
                  setState(() {
                    currentIndex = currentIndex + 1;
                  });

                  _pageController.animateToPage(currentIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              }),
        )
      ],
    ));
  }

  Widget PageItem(Onboarding item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: Svg(item.imageUrl), width: 350, height: 150),
          const SizedBox(
            height: 10,
          ),
          Text(
            item.title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
