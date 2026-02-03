import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../common_widgets/controllers/permission_controller.dart';



class MainscreencustomButton extends StatefulWidget {
  const MainscreencustomButton({super.key});

  @override
  State<MainscreencustomButton> createState() => _MainscreencustomButtonState();
}

class _MainscreencustomButtonState extends State<MainscreencustomButton> {
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(PermissionController());
    return  Container(
      width: 328,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(57),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Use Current Location',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(0xFFECEBEF),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }
}
