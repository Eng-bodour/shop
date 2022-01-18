import 'package:flutter/material.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/utils/theme.dart';

import 'package:shop/view/widgets/text_utilis.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.3)),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.3,
                  child: Center(
                    child: TextUtilis(
                        underline: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        textstring: 'Welcome'),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.3)),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtilis(
                          underline: TextDecoration.none,
                          color: mainColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          textstring: 'Bodour'),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.04,
                      ),
                      TextUtilis(
                          underline: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          textstring: 'Shop')
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    child: TextUtilis(
                      underline: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      textstring: 'Get Start',
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtilis(
                        underline: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        textstring: 'Don\'t have an Account? '),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: TextUtilis(
                          underline: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          textstring: 'Sign Up',
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
