import 'package:auto_route/auto_route.dart';
import 'package:bookapp/Routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  const Color(0xff1D1D4E),
      body:  Container(
        padding: EdgeInsets.all(20.r),
        child: const Column(
          children: [
            _Logo(),
            _LoginButton(),
            _SkipButton(),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 267.h),
      width: 200.w,
      height: 130.h,
      child: Image.asset("assets/Logo.png",fit: BoxFit.cover),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 287.h),
      width: 350.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: () {
          AutoRouter.of(context).push(const LoginRoute());
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color(0xffef6b4a),
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: () {
          AutoRouter.of(context).push(const HomeRoute());
        },
        style: const ButtonStyle(
          shadowColor: MaterialStatePropertyAll(Colors.transparent),
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        child: Text(
          'Skip',
          style: TextStyle(
            color: const Color(0xFF6251DD),
            fontSize: 16.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
