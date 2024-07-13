import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({
    super.key,
    required PageController pageController,
    required this.imageSliders,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<Widget> imageSliders;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 200.h,
          child: PageView(
            controller: _pageController,
            children: imageSliders,
          ),
        ),
        Positioned(
          bottom: 10.h,
          child: SmoothPageIndicator(
            onDotClicked: (index) => _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            ),
            effect: const ScrollingDotsEffect(
              dotWidth: 6,
              dotHeight: 6,
              dotColor: Colors.white38,
              activeDotColor: Colors.white,
            ),
            controller: _pageController,
            count: imageSliders.length,
          ),
        ),
      ],
    );
  }
}
