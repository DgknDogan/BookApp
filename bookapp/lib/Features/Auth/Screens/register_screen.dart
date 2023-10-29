import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Logo(),
                const _RegisterGreeting(),
                const _RegisterForm(),
                SizedBox(height: 10.h),
                const _LoginTextButton(),
                const _RegisterButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Image(
        image: const AssetImage("assets/Logo.png"),
        height: 65.h,
        width: 100.w,
      ),
    );
  }
}

class _RegisterGreeting extends StatelessWidget {
  const _RegisterGreeting();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 115.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(
              'Welcome',
              style: TextStyle(
                color: const Color(0x99090937),
                fontSize: 16.sp,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            'Register an account',
            style: TextStyle(
              color: const Color(0xFF090937),
              fontSize: 20.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 75.h),
      child: Form(
        child: Column(
          children: [
            const _NameForm(),
            Padding(padding: EdgeInsets.only(top: 25.h)),
            const _EmailForm(),
            Padding(padding: EdgeInsets.only(top: 25.h)),
            const _PasswordForm(),
          ],
        ),
      ),
    );
  }
}

class _NameForm extends StatelessWidget {
  const _NameForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Text(
            'Name',
            style: TextStyle(
              color: const Color(0xFF090937),
              fontSize: 16.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 50.h,
          padding: EdgeInsets.only(left: 16.w),
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F4FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "John Doe",
              border: InputBorder.none,
            ),
            cursorColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

class _EmailForm extends StatelessWidget {
  const _EmailForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Text(
            'E-mail',
            style: TextStyle(
              color: const Color(0xFF090937),
              fontSize: 16.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 50.h,
          padding: EdgeInsets.only(left: 16.w),
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F4FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "john@mail.com",
              border: InputBorder.none,
            ),
            cursorColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

class _PasswordForm extends StatelessWidget {
  const _PasswordForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Text(
            'Password',
            style: TextStyle(
              color: const Color(0xFF090937),
              fontSize: 16.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 50.h,
          padding: EdgeInsets.only(left: 16.w),
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F4FF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r)),
          ),
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: "·······",
              hintStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              border: InputBorder.none,
            ),
            obscureText: true,
          ),
        ),
      ],
    );
  }
}

class _LoginTextButton extends StatelessWidget {
  const _LoginTextButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: MaterialStatePropertyAll(Size.zero),
          ),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: const Color(0xFF6251DD),
              fontSize: 12.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 55.h),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Color(0xffef6b4a),
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(350.w, 60.h),
          ),
        ),
        child: Text(
          'Register',
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
