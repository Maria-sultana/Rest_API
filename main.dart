
import 'package:login/providers/category_provider.dart';
import 'package:login/providers/order_provers.dart';
import 'package:login/screens/auth/splash_screen.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart'; 

void main() async{
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider (create: (context)=>OrderProvider()),
          ChangeNotifierProvider (create: (context)=>CategoryProvider()),


          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}


