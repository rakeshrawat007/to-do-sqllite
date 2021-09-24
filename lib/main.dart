import 'package:flutter/material.dart';
import 'package:local_push_notifcation/ui/hompage.dart';
import 'package:local_push_notifcation/ui/services/theme_services.dart';
import 'package:local_push_notifcation/ui/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To Do',
        debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,

      home: HomePage(),
    );
  }
}

