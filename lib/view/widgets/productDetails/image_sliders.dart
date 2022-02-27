import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/cart_controller.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/productDetails/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String imageUrl;

  const ImageSlider({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<Color> colorSelected = [
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
    kColor2,
    kColor3,
    kColor4,
  ];
  CarouselController carouselController = CarouselController();
  final cartController = Get.find<CartController>();
  int currentPage = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    //print('image :${widget.imageUrl}');
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            // viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(25)),
            );
          },
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
                activeIndex: currentPage,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                  dotColor: Get.isDarkMode ? Colors.black : Colors.white,
                ))),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 200,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentColor = index;
                      });
                    },
                    child: ColorPicker(
                      outerBorder: currentColor == index,
                      color: colorSelected[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 3,
                ),
                itemCount: colorSelected.length,
              ),
            )),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Obx(() {
                return Badge(
                  position: BadgePosition.topEnd(top: -1, end: -5),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    '${cartController.quantity()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Get.isDarkMode
                                ? pinkClr.withOpacity(0.8)
                                : mainColor.withOpacity(0.8)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.shopping_bag,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            size: 20,
                          ),
                        )),
                  ),
                );
              })
            ],
          ),
        )
      ],
    );
  }
}
