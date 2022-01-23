import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/auth_controller.dart';

import 'package:shop/utils/my_string.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/auth/auth_text_form_field.dart';
import 'package:shop/view/widgets/text_utilis.dart';
import 'package:shop/view/widgets/auth/auth_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGrayClr,
        title: TextUtilis(
          color: Get.isDarkMode ? mainColor : pinkClr,
          textstring: 'Forgot Password',
          fontSize: 20,
          fontWeight: FontWeight.normal,
          underline: TextDecoration.none,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
      ),
      backgroundColor: Get.isDarkMode ? Colors.white : darkGrayClr,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'if you want to recovery your account then please provide your email ID below',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextFormField(
                    hintText: 'Email',
                    suffixIcon: const Text(''),
                    prefixIcon: Get.isDarkMode
                        ? Image.asset('assets/images/email.png')
                        : const Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 30,
                          ),
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
                  height: 50,
                ),
                AuthButton(
                  text: 'SEND',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
