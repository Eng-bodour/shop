import 'package:flutter/material.dart';
import 'package:shop/logic/controller/auth_controller.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/utils/my_string.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/auth/auth_button.dart';
import 'package:shop/view/widgets/auth/auth_text_form_field.dart';

import 'package:shop/view/widgets/auth/container_under.dart';
import 'package:shop/view/widgets/text_utilis.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGrayClr : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Column(
          children: [
            //contain all widget in page without last widget
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtilis(
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            textstring: 'LOG',
                            underline: TextDecoration.none),
                        const SizedBox(width: 10),
                        TextUtilis(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            textstring: 'IN',
                            underline: TextDecoration.none),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthTextFormField(
                        hintText: 'Email',
                        suffixIcon: const Text(''),
                        prefixIcon: Get.isDarkMode
                            ? const Icon(
                                Icons.email,
                                color: pinkClr,
                                size: 30,
                              )
                            : Image.asset('assets/images/email.png'),
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        obscureText: false,
                        controller: emailController),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AuthController>(
                      builder: (controller) => AuthTextFormField(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: controller.isVisibility
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                            onPressed: () {
                              controller.visibility();
                            },
                          ),
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.lock,
                                  color: pinkClr,
                                  size: 30,
                                )
                              : Image.asset('assets/images/lock.png'),
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'Password should be longer or equal to 6 characters';
                            } else {
                              return null;
                            }
                          },
                          obscureText: controller.isVisibility ? false : true,
                          controller: passwordController),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.forgotPassword);
                          },
                          child: TextUtilis(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            underline: TextDecoration.none,
                            textstring: 'Forgot Password?',
                          )),
                    ),
                    const SizedBox(height: 20),
                    // CheckWidget(),

                    GetBuilder<AuthController>(
                      builder: (controller) => AuthButton(
                          text: 'LOG IN',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();
                              controller.logInUsingFirebase(
                                  email: email, password: password);
                            }
                          }),
                    ),
                    const SizedBox(height: 20),
                    TextUtilis(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        textstring: 'OR',
                        underline: TextDecoration.none),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: const Icon(Icons.facebook,
                                color: Colors.blue, size: 33)),
                        const SizedBox(width: 10),
                        GetBuilder<AuthController>(
                          builder: (_) => InkWell(
                              onTap: () {
                                controller.googleSignUpApp();
                              },
                              child: Image.asset('assets/images/google.png')),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //under
            ContainerUnder(
                text: 'Don\'t have an Account ?',
                textType: 'Sign UP',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                })
          ],
        ),
      )),
    ));
  }
}
