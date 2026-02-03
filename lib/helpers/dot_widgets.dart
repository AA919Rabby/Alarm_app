import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/controllers/onboarding_controller.dart';

class DotWidgets extends StatelessWidget {
  const DotWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    //calling the controller
    final controller = Get.put(OnboardingController());

    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dot(controller.currentScreens.value == 0),
          dot(controller.currentScreens.value == 1),
          dot(controller.currentScreens.value == 2),
        ],
      ),
    );
  }
  //helper custom widget
    dot(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: isActive ? 9 : 8,
      margin: EdgeInsets.only(right: 10),
      height: 8,
      decoration: BoxDecoration(
        color: isActive ?  Color(0xFF5200FF) : Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}