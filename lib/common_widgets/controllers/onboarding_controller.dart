import 'package:flutter/material.dart';
import 'package:flutter_app/features/screens/mainscreen.dart';
import 'package:get/get.dart';
import '../../constants/model/app_models/models.dart';



class OnboardingController extends GetxController {


  final screenController = PageController();
  var currentScreens = 0.obs;

  List<Models> onboardingData = [
    Models(
      'assets/images/plane.jpg',
      'Discover the world, one journey at a time.',
      'From hidden gems to iconic destinations, we make travel simple and inspiring.',
    ),
    Models(
      'assets/images/river.jpg',
      'Explore new horizons, one step at a time.',
      'Every trip tells a story waiting to be told. Let us guide you through the wonders.',
    ),
    Models(
      'assets/images/sea.jpg',
      'See the beauty, one journey at a time.',
      "Travel tells unique stories and discovery places you'll love and remember.",
    ),
  ];

  // code for the button
   nextScreens() {
    if (currentScreens.value < onboardingData.length - 1) {
      screenController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Get.offAll(()=>Mainscreen());
    }
  }
}