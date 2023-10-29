import 'package:bookapp/Routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
  runApp(BookApp());

}

class BookApp extends StatelessWidget {
  BookApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 844),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Manrope"),
        title: "BookApp",
        routerConfig: appRouter.config(),
      ),
    );
  }
}
