import 'package:complete_advanced_flutter/presentation/resources/assets.dart';
import 'package:complete_advanced_flutter/presentation/resources/colors.dart';
import 'package:complete_advanced_flutter/presentation/resources/sizes.dart';
import 'package:complete_advanced_flutter/presentation/resources/strings.dart';
import 'package:complete_advanced_flutter/presentation/views/onboading/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/routes.dart';
import '../component/onboarding_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlideViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapShot) {
        return _getContentWidget(snapShot.data);
      },
    );
  }

  Widget _getContentWidget(SlideViewObject? slideViewObject) {
    if (slideViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: slideViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChannged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(slideViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: AppColors.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, Routes.loginRoute),
                    child: Text(AppStrings.skip,
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.end)),
              ),
              // add layout for indicator and arrows
              _getBottomSheetWidget(slideViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getProperCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc); // selected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // unselected slider
    }
  }

  Widget _getBottomSheetWidget(SlideViewObject slideViewObject) {
    return Container(
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceOut);
              },
            ),
          ),
          // circles indicator
          Row(
            children: [
              for (int i = 0; i < slideViewObject.numOfSlides; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, slideViewObject.currentIndex),
                )
            ],
          ),
          // right arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightarrowIc),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceOut);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
