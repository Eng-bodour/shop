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
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  textstring: 'SIGN',
                                  underline: TextDecoration.none),
                              SizedBox(
                                  width: MediaQuery.of(context).size.height *
                                      0.01),
                              TextUtilis(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
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
                                ? const Icon(
                                    Icons.person,
                                    color: pinkClr,
                                    size: 30,
                                  )
                                : Image.asset('assets/images/user.png'),
                            suffixIcon: const Text(''),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AuthTextFormField(
                            validator: (value) {
                              if (!RegExp(validationEmail).hasMatch(value)) {
                                return 'Invalid email';
                              } else {
                                return null;
                              }
                            },
                            controller: emailController,
                            hintText: 'Email',
                            obscureText: false,
                            prefixIcon: Get.isDarkMode
                                ? const Icon(
                                    Icons.email,
                                    color: pinkClr,
                                    size: 30,
                                  )
                                : Image.asset('assets/images/email.png'),
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
                                  ? const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    )
                                  : Image.asset('assets/images/lock.png'),
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
                          GetBuilder<AuthController>(
                            builder: (controller) => AuthButton(
                              text: 'Sign Up',
                              onPressed: () {
                                if (controller.isCheckedBox == false) {
                                  Get.snackbar('cheched Box',
                                      'Please , Accept terms & condition',
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                      duration: const Duration(seconds: 5),
                                      snackPosition: SnackPosition.BOTTOM);
                                } else if (formKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  passwordController.text.trim();
                                  controller.signUpUsingFirebase(
                                      name: name,
                                      email: email,
                                      password: password);
                                }
                                controller.isCheckedBox = true;
                              },
                            ),
                          )
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
