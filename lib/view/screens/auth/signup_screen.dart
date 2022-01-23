import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shop/logic/controller/auth_controller.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/utils/my_string.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/auth/auth_button.dart';
import 'package:shop/view/widgets/auth/auth_text_form_field.dart';
import 'package:shop/view/widgets/auth/check_widget.dart';
import 'package:shop/view/widgets/auth/container_under.dart';
import 'package:shop/view/widgets/text_utilis.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Get.isDarkMode ? Colors.white : darkGrayClr,
              elevation: 0,
            ),
            backgroundColor: Get.isDarkMode ? Colors.white : darkGrayClr,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.3,
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextUtilis(
                                  color: Get.isDarkMode ? mainColor : pinkClr,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  textstring: 'SIGN',
                                  underline: TextDecoration.none),
                              SizedBox(
                                  width: MediaQuery.of(context).size.height *
                                      0.01),
                              TextUtilis(
                                  color: Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  textstring: 'UP',
                                  underline: TextDecoration.none)
                            ],
                          ),
                          const SizedBox(height: 50),
                          AuthTextFormField(
                            validator: (value) {
                              if (value.toString().length <= 2 ||
                                  !RegExp(validationName).hasMatch(value)) {
                                return ' Enter valid name ';
                              } else {
                                return null;
                              }
                            },
                            controller: nameController,
                            hintText: 'UserName',
                            obscureText: false,
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/user.png')
                                : const Icon(
                                    Icons.person,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: const Text(''),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AuthTextFormField(
                            validator: (value) {
                              if (RegExp(validationEmail).hasMatch(value)) {
                                return 'Invalid email';
                              } else {
                                return null;
                              }
                            },
                            controller: emailController,
                            hintText: 'Email',
                            obscureText: false,
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/email.png')
                                : const Icon(
                                    Icons.email,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: const Text(''),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<AuthController>(
                            builder: (controller) => AuthTextFormField(
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                              hintText: 'password',
                              obscureText:
                                  controller.isVisibility ? false : true,
                              prefixIcon: Get.isDarkMode
                                  ? Image.asset('assets/images/lock.png')
                                  : const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    ),
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
                            ),
                          ),
                          const SizedBox(height: 20),
                          CheckWidget(),
                          const SizedBox(height: 20),
                          AuthButton(
                            text: 'Sign Up',
                            onPressed: () async {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: "barry.allen@example.com",
                                      password: "SuperSecretPassword!");
                              print(userCredential);
                            },
                          ),
                        ],
                      ),
                    ),
                    ContainerUnder(
                      text: 'Don\'t have an Account?',
                      textType: 'Log in',
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                      },
                      // color: Get.isDarkMode ? mainColor : pinkClr
                    ),
                  ],
                ),
              ),
            )));
  }
}
