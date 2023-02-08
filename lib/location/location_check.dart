import 'package:flutter/material.dart';
import 'package:flutter_ui/location/show_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class LocationCheck extends StatelessWidget {
  Position? position;
  late LocationPermission permission;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () async{
                  permission = await Geolocator.requestPermission();
                  if(permission == LocationPermission.denied){
                    permission = await Geolocator.requestPermission();
                  }else if(permission == LocationPermission.deniedForever){
                    await Geolocator.openAppSettings();
                  }else if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
                    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                    if(position != null){
                      Get.to(() => MapSample(position!.latitude, position!.longitude));
                    }

                  }

                },
                child: Text('check location')
            )
        )
    );
  }
}