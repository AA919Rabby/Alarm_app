import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/alarmscreencustom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widgets/controllers/alarm_controller.dart';
import '../../constants/bg_color.dart';
import 'package:get/get.dart';



class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    //getting the alarm controller
    final controller=Get.put(AlarmController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: BgColor.bgColor),
        child:Column(
          children: [
            SizedBox(height: 70),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text('Selected Location',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
           AlarmscreencustomButton(),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Alarms',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
           // alarm list section
            Expanded(
              //obx for real time update
                child: Obx(()=>ListView.builder(
              //counting the length of alarm
                itemCount: controller.alarmList.length,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context,index){
                  // store the list in a variable
                  final alarm=controller.alarmList[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF).withOpacity(.2),
                      borderRadius: BorderRadius.circular(57),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // column for time and date
                        Row(
                          children: [
                            Text(
                              alarm.time,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 30),
                            Text(
                              alarm.date,
                              style: GoogleFonts.poppins(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        // toggle switch
                        Switch(
                          value: alarm.isSwitchedOn,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.deepPurpleAccent,
                          inactiveThumbColor: Colors.black,
                          inactiveTrackColor: Colors.white,
                          onChanged: (value) {
                            controller.switchToggle(index, value);
                          },
                        ),
                      ],
                    ),
                  );
                }))),
          ],
        ),
      ),
      //add button section
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ) ,
          child: Icon (Icons.add,color: Colors.white,),
          onPressed: (){
            //dialog box for opening the add alarm
            Get.dialog(
              // clicking outside of the dialog will not close it
              barrierDismissible: false,
              barrierColor: Colors.transparent,
              AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                content: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: BgColor.bgColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        'Add Alarm',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 25),
                      // Time Input field
                      TextField(
                        controller: controller.time,
                        style:  TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter time',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.08),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      // Date Input field
                      TextField(
                        controller: controller.date,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter date',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.08),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      // Buttons
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: (){
                                Get.back();
                              },
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.poppins(color: Colors.white70),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.addAlarm();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                'Add',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

}
