import 'package:flutter_app/constants/model/app_models/alarm_models.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class AlarmController extends GetxController{
  //controller for store in user value in the textfields
  TextEditingController time = TextEditingController();
  TextEditingController date= TextEditingController();

  //to store the value
   var alarmList=<AlarmModel>[].obs;

   addAlarm(){
     if (time.text.isNotEmpty && date.text.isNotEmpty) {
       //add to alarmModel
       alarmList.add(AlarmModel(
         time: time.text,
         date: date.text,
       ));
       //clear the textfields
       time.clear();
       date.clear();
     }
     //back to alarm screen
     Get.back();
   }
  //on off toggle
   switchToggle(int index,bool value){
  var alarm=alarmList[index];
  alarm.isSwitchedOn=value;
  //update the ui
  alarmList.refresh();
  //condition for notification
  if(value==false){
    Get.snackbar('⏰', 'Alarm was cancelled',
        backgroundColor: Colors.white.withOpacity(.3),
        duration: Duration(seconds: 1),
        colorText: Colors.white,
    );
  }
   }

  }
