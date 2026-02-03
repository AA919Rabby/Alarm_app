import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AlarmscreencustomButton extends StatefulWidget {
  const AlarmscreencustomButton({super.key});

  @override
  State<AlarmscreencustomButton> createState() => _AlarmscreencustomButtonState();
}

class _AlarmscreencustomButtonState extends State<AlarmscreencustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF).withOpacity(.2),
        borderRadius: BorderRadius.circular(57),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: 10),
          Text('add your location',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(0xFFCCBFF3),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
