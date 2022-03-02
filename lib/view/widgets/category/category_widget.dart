import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/view/widgets/category/item_category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: ScrollController(),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Get.to(() => CategoryItems());
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/forgetpass copy.png'),
                      fit: BoxFit.cover,
                    )),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'mens',
                      style: TextStyle(
                        backgroundColor: Colors.black38,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ));
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: 10,
      ),
    );
  }
}
