import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'dealsCntroller.dart';


class DataConstants {
  static SplitController splitController = Get.put(SplitController());

  static getDate(String date){
    var newDate ;
    DateFormat dateFormat = DateFormat("yyyy-MMM-dd");
    newDate = DateTime.parse(date);
    String string = dateFormat.format(newDate);
    return string;



  }
}