import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../networks/locationperm.dart';
import 'package:flutter/material.dart';

class PermissionController extends GetxController{

  @override
  void onInit() {
    reqLocation();
    super.onInit();
  }

  reqLocation()async {
    LocationPermission perm=await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition();
    //asking for location
    if(perm==LocationPermission.always)
    {
      Get.snackbar('Success','Location access granted',
        backgroundColor: Colors.white.withOpacity(.3),
        duration: Duration(seconds: 3),
        colorText: Colors.white,
      );
    }
  }

}
