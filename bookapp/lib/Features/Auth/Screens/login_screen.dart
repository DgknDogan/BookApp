import 'package:auto_route/auto_route.dart';
import 'package:bookapp/Features/Auth/cubit/auth_cubit.dart';
import 'package:bookapp/Routes/app_router.gr.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _Logo(),
                  const _GreetingText(),
                  const _LoginForm(),
                  SizedBox(height: 10.h),
                  const _FormButtons(),
                  const _LoginButton(),
                ],
              ),
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
    return Container(
      padding: EdgeInsets.only(top: 40.h),
      child: Image(
        image: const AssetImage("assets/Logo.png"),
        height: 65.h,
        width: 100.w,
      ),
    );
  }
}

class _GreetingText extends StatelessWidget {
  const _GreetingText();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 115.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back!',
            style: TextStyle(
              color: const Color(0x99090937),
              fontSize: 16.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.h)),
          Text(
            'Login to your account',
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

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80.h),
      child: Form(
        child: Column(
          children: [
            const _EmailField(),
            Container(
              margin: EdgeInsets.only(top: 24.h),
            ),
            const _PasswordField()
          ],
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8.h),
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
          padding: EdgeInsets.only(left: 16.w),
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F4FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          height: 50.h,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "john@mail.com",
              hintStyle: TextStyle(
                color: const Color(0x66090937),
                fontSize: 16.sp,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
            ),
            cursorColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8.h),
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
          padding: EdgeInsets.only(left: 16.w),
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F4FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          height: 50.h,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: "·······",
              hintStyle: TextStyle(
                color: const Color(0x66090937),
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

class _FormButtons extends StatelessWidget {
  const _FormButtons();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: const Color(0xFF6251DD),
                    overlayColor:
                        const MaterialStatePropertyAll(Color(0xFF6251DD)),
                    focusColor: const Color(0xFF6251DD),
                    side:
                        BorderSide(color: const Color(0xFF6251DD), width: 2.w),
                    splashRadius: 0,
                    value: state.isChecked,
                    onChanged: (bool? value) {
                      context.read<AuthCubit>().onRememberButtonPressed(value);
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 4.w)),
                TextButton(
                  onPressed: () => context
                      .read<AuthCubit>()
                      .onRememberButtonPressed(!state.isChecked),
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStatePropertyAll(Size.zero),
                  ),
                  child: Text(
                    'Remember Me',
                    style: TextStyle(
                      color: const Color(0xFF6251DD),
                      fontSize: 12.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            TextButton(
              style: const ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: MaterialStatePropertyAll(Size.zero),
              ),
              onPressed: () {
                AutoRouter.of(context).push(const RegisterRoute());
              },
              child: Text(
                'Register',
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
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 150.h),
      child: ElevatedButton(
        onPressed: () {
          AutoRouter.of(context).push(const HomeRoute());
        },
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Color(0xffef6b4a),
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(350.w, 60.h),
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
