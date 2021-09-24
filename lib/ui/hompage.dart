import 'package:flutter/material.dart';
import 'package:local_push_notifcation/ui/services/notification_services.dart';
import 'package:local_push_notifcation/ui/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart' as tz;
import 'package:local_push_notifcation/ui/theme.dart';
import 'package:local_push_notifcation/widgets/button.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  @override
  void initState() {
    super.initState();
     notifyHelper=NotifyHelper();
    notifyHelper. initializeNotification();
     notifyHelper.requestIOSPermissions();
     notifyHelper.scheduledNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
         _addtaskbar(),
          Container(
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: primaryClr,
              selectedTextColor: Colors.white,
              dateTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey
              ),
            ),
          )
        ],
      ),
    );
  }
  _addtaskbar(){
    return  Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,)
                ,Text('Today',
                  style: HeadingStyle,)
              ],
            ),
          ),
          MyButton(onTap:()=>null ,label: "+ Add Task",)
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          notifyHelper.displayNotification(
            title:"Theme Changed",
            body: Get.isDarkMode?"Activated Light them":"Activated Dark Theme"
          );
          notifyHelper.scheduledNotification();

        },
        child: Icon(Get.isDarkMode?Icons.wb_sunny_outlined:Icons.nightlight_round,
        size: 20,color: Get.isDarkMode?Colors.white:Colors.black,)
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            'images/profile.png'
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
