import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; 

import 'screens/all_events/home_page.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return   
    Sizer(builder: (context, orientation, deviceType) {
      return  const MaterialApp(
     //  debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    },);
  }
}
 