import 'package:flutter/material.dart';
import 'package:flutter_app/common_widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widgets/controllers/onboarding_controller.dart';
import '../../constants/bg_color.dart';
import '../../helpers/dot_widgets.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    // Receiving the controller via getX
    final controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: BgColor.bgColor),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // image section
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      controller: controller.screenController,
                      //prevent horizontal scroll
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.onboardingData.length,
                      onPageChanged: (index) => controller.currentScreens.value = index,
                      itemBuilder: (context, index) {
                        final data = controller.onboardingData[index];
                        return Column(
                          children: [
                            // Taking full width of the screen
                            Expanded(
                              flex: 9,
                              child:ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                                child: Image.asset(
                                  data.image,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            // title , subtitle section
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                children: [
                                  Text(
                                    data.title,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                   SizedBox(height: 16),
                                  Text(
                                    data.subtitle,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Lower section
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        // calling helper widget
                        DotWidgets(),
                       //spacer for taking all available  space
                         Spacer(),

                        // Button section
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                          child:SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: CustomButton(text:'Next',
                                  onPressed: controller.nextScreens,
                                  backgroundColor: Color(0xFF5200FF),
                                   textColor: Color(0xFFE3E0EA) ,
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // skip button
              Positioned(
                top: 10,
                right: 15,
                child: Obx(() => controller.currentScreens.value == 2
                    ? SizedBox.shrink()
                    : TextButton(
                  onPressed: () => controller.screenController.jumpToPage(2),
                  child: Text(
                    "Skip",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}