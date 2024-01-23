import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';
import 'package:food_ninja/widgets/cart_item.dart';
import 'package:go_router/go_router.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;

    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          SvgPicture.asset(
            Images.bg,
            width: width,
            height: height * 0.38,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, height * 0.1, 0, 0),
            child: Container(
              height: height * 0.9,
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.01,
                    0.1,
                  ],
                  colors: [Color.fromRGBO(255, 255, 255, 0.6), Colors.white],
                  tileMode: TileMode.mirror,
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ResponsiveSizes.responsiveHeight(70),
                    ),
                    Text(
                      "Cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSizes.responsiveSize(25),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        if (index == 11) {
                          return const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: CartItem(),
                          );
                        }
                        return const CartItem();
                      },
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: CustomColors.primaryGreen,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          20,
                          20,
                          20,
                          20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Sub-Total',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSizes.responsiveSize(12),
                                    ),
                                  ),
                                ),
                                Text(
                                  '120\$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSizes.responsiveSize(12),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Delivery Charge',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSizes.responsiveSize(12),
                                    ),
                                  ),
                                ),
                                Text(
                                  '10\$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSizes.responsiveSize(12),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Discount',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSizes.responsiveSize(12),
                                    ),
                                  ),
                                ),
                                Text(
                                  '20\$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSizes.responsiveSize(12),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Total',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSizes.responsiveSize(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '150\$',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSizes.responsiveSize(16),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  Size(
                                    width - 60,
                                    50,
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ), // Adjust the radius here
                                  ),
                                ),
                              ),
                              onPressed: () {
                                context.go('/cart/confirm-order');
                              },
                              child: Text(
                                "Place My Order",
                                style: TextStyle(
                                    color: CustomColors.primaryGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes.responsiveSize(13)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
