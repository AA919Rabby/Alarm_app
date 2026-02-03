import 'package:flutter/material.dart';
import 'package:flutter_app/common_widgets/custom_button.dart';
import 'package:flutter_app/features/screens/alarm_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widgets/controllers/permission_controller.dart';
import '../../constants/bg_color.dart';
import '../../helpers/mainscreencustom_button.dart';



class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  PermissionController permissionController=Get.put(PermissionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: BgColor.bgColor),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'Welcome! Your Smart Travel Alarm',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 17),
              Text(
                'Stay on schedule and enjoy every\n moment of your journey',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
               SizedBox(height: 58),
              Image.asset('assets/images/desert.jpg'),
             Spacer(),
            //calling the button
             MainscreencustomButton(),
              SizedBox(height: 20),
              CustomButton(
                text: 'Home',
                onPressed: (){
                  Get.to(()=>AlarmScreen());
                },
                backgroundColor: Color(0xFF5200FF),
                textColor: Color(0xFFE3E0EA),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
