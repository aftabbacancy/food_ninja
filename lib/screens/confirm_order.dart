import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:go_router/go_router.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
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
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: Colors.white,
                          child: TextButton.icon(
                            onPressed: () {
                              context.pop();
                            },
                            icon: SvgPicture.asset(
                              Images.back,
                              width: width * 0.14,
                              height: width * 0.14,
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            label: const Text(""),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Confirm Order",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSizes.responsiveSize(25),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(22),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(11, 10, 11, 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Deliver To",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: FontSizes.responsiveSize(13),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontSize: FontSizes.responsiveSize(13),
                                    color: CustomColors.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Images.circlePin,
                                  width: 33,
                                  height: 33,
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Flexible(
                                  child: Text(
                                    "4517 Washington Ave. Mannchester, Kentucky 39495",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontSizes.responsiveSize(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(22),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(11, 10, 11, 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Payment Method",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: FontSizes.responsiveSize(13),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontSize: FontSizes.responsiveSize(13),
                                    color: CustomColors.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Images.paypal,
                                  width: 33,
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  child: Text(
                                    "2121 6352 8456 ****",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: FontSizes.responsiveSize(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
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
                                context.go('/dashboard');
                              },
                              child: Text(
                                "Place My Order",
                                style: TextStyle(
                                  color: CustomColors.primaryGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizes.responsiveSize(13),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
