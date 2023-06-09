import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yoyo/presentation/widgets/customs/text.dart';
import 'package:yoyo/presentation/widgets/customs/textfield.dart';

import '../../../core/constants/constant.dart';
import '../../../core/dtos/auth_dto.dart';
import '../../cubits/auth/authentication/authentication_cubit.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          'Sign Up',
          size: 18.sp,
          weight: FontWeight.w600,
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hint: 'enter your username',
                  controller: username,
                  label: 'Username',
                  width: 80.w,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your username";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hint: 'enter an email',
                  controller: email,
                  label: 'Email',
                  width: 80.w,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please Enter a Valid Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                    label: 'Password',
                    hint: 'enter an password',
                    width: 80.w,
                    isObscure: true,
                    controller: password,
                    validator: (value) {
                      String missings = "";
                      if (value!.isEmpty) {
                        missings += 'Please enter a password\n';
                      }
                      if (value.length < 8) {
                        missings += "Password has at least 8 characters\n";
                      }

                      if (!RegExp("(?=.*[a-z])").hasMatch(value)) {
                        missings +=
                            "Password must contain at least one lowercase letter\n";
                      }
                      if (!RegExp("(?=.*[A-Z])").hasMatch(value)) {
                        missings +=
                            "Password must contain at least one uppercase letter\n";
                      }
                      if (!RegExp((r'\d')).hasMatch(value)) {
                        missings +=
                            "Password must contain at least one digit\n";
                      }

                      //if there is password input errors return error string
                      if (missings != "") {
                        return missings;
                      }
                      return null;
                    }),
                SizedBox(height: 2.h),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is SignUpError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: CustomText(state.msg)));
                    } else if (state is SignedUp) {
                      if (AutoRouter.of(context).canPop()) {
                        Future.delayed(const Duration(seconds: 1), () {
                          AutoRouter.of(context).pop();
                        });
                      }
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: state is SigningUp
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthenticationCubit>().onSignup(
                                        authDto: AuthDto(
                                      email: email.text,
                                      password: password.text,
                                      username: username.text,
                                    ));
                              }
                            },
                      child: AnimatedContainer(
                        width: state is SigningUp ? 6.h : 80.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(
                            state is SigningUp ? 100 : AppDimens.minRadius,
                          ),
                        ),
                        alignment: Alignment.center,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease,
                        child: state is SigningUp
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const CustomText(
                                'Sign Up',
                                color: Colors.white,
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText('Already have an account? '),
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                      child: CustomText(
                        'Sign In',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
