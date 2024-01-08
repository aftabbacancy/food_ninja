import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';
import 'package:food_ninja/widgets/fav_item.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset(
            Images.demoUser,
            width: ResponsiveSizes.width,
            height: ResponsiveSizes.responsiveHeight(320),
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: SafeArea(
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
                        40.0,
                        20.0,
                        20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.amber,
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
                                "Member Gold",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: FontSizes.responsiveSize(12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Anam Wusono",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSizes.responsiveSize(27),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                Images.edit,
                              ),
                            ],
                          ),
                          Text(
                            "anamwp66@gmail.com",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: FontSizes.responsiveSize(14),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(Images.coupon),
                                  Text(
                                    "You Have 3 Voucher",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontSizes.responsiveSize(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          Text(
                            "Favorite",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: FontSizes.responsiveSize(15),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          const FavItem(),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          const FavItem(),
                          SizedBox(
                            height: ResponsiveSizes.responsiveHeight(20),
                          ),
                          const FavItem(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
