import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workio_sample/controller/navigation_provider.dart';
import 'package:workio_sample/view/employee_home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
    child: MaterialApp(home: EmployeeHomeScreen(),debugShowCheckedModeBanner: false,
    ));
    }
}
