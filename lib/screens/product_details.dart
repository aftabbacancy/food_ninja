import 'package:flutter/material.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';
import 'package:food_ninja/widgets/testimonial_item.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Images.menuImage2,
              width: ResponsiveSizes.width,
              height: ResponsiveSizes.responsiveHeight(340),
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ResponsiveSizes.responsiveHeight(260),
                  ),
                  Container(
                    width: ResponsiveSizes.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20.0,
                        20.0,
                        20.0,
                        20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 5,
                              width: 80,
                              decoration: const BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(40),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 184, 251, 186),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    12.0,
                                    5.0,
                                    12.0,
                                    5.0,
                                  ),
                                  child: Text(
                                    "Popular",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: FontSizes.responsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 180, 250, 221),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(200),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.location_pin,
                                        color: CustomColors.primaryGreen,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 255, 224, 224),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(200),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          Text(
                            "Rainbow Sandwich Sugarless",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSizes.responsiveSize(27),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_pin,
                                  color: CustomColors.primaryGreen,
                                ),
                                Text(
                                  "19 Km",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: FontSizes.responsiveSize(14),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Icon(
                                  Icons.star_border_outlined,
                                  color: CustomColors.primaryGreen,
                                ),
                                Text(
                                  "4.8 Rating",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: FontSizes.responsiveSize(14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          Text(
                            "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum. Strowberry Cream wheat Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt.",
                            style: TextStyle(
                              fontSize: FontSizes.responsiveSize(12),
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          Text(
                            "Testimonials",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSizes.responsiveSize(15),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TestimonialItem(),
                          const SizedBox(
                            height: 20,
                          ),
                          const TestimonialItem(),
                          const SizedBox(
                            height: 20,
                          ),
                          const TestimonialItem(),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: ResponsiveSizes.width - 40,
          decoration: BoxDecoration(
            color: CustomColors.primaryGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
            child: Text(
              "Add To Chart",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizes.responsiveSize(14),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
