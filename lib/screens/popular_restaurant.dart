import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/fake_products.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';
import 'package:food_ninja/widgets/global_bg.dart';
import 'package:food_ninja/widgets/near_restaurant_item.dart';

class PopularRestaurant extends StatefulWidget {
  const PopularRestaurant({super.key});

  @override
  State<PopularRestaurant> createState() => _PopularRestaurantState();
}

class _PopularRestaurantState extends State<PopularRestaurant> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            const GlobalBg(),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                ResponsiveSizes.responsiveHeight(45),
                0,
                0,
              ),
              child: Container(
                height: ScreenUtil().screenHeight * 0.8,
                width: ScreenUtil().screenWidth,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.01,
                      0.1,
                    ],
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.6),
                      Colors.white,
                    ],
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
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Find Your\nFavorite Food",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSizes.responsiveSize(31),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
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
                            padding: const EdgeInsets.fromLTRB(
                              15.0,
                              12.0,
                              15.0,
                              12.0,
                            ),
                            child: SvgPicture.asset(
                              Images.notification,
                              width: ResponsiveSizes.responsiveWidth(30, width),
                              height:
                                  ResponsiveSizes.responsiveWidth(30, width),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: CustomColors.orangeTransparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                ResponsiveSizes.responsiveHeight(18),
                                ScreenUtil().setWidth(0),
                                ResponsiveSizes.responsiveHeight(18),
                                ScreenUtil().setWidth(0),
                              ),
                              child: Expanded(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Images.search,
                                      width: ResponsiveSizes.responsiveWidth(
                                          24, width),
                                      height:
                                          ResponsiveSizes.responsiveHeight(24),
                                    ),
                                    SizedBox(
                                      width: ResponsiveSizes.responsiveWidth(
                                          19, width),
                                    ),
                                    Flexible(
                                      child: TextField(
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize:
                                              FontSizes.responsiveSize(12),
                                        ),
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                            0,
                                            5,
                                            0,
                                            5,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                244,
                                                244,
                                                244,
                                                1,
                                              ),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                244,
                                                244,
                                                244,
                                                0.8,
                                              ),
                                              width: 1.0,
                                            ),
                                          ),
                                          hintText:
                                              "What do you want to order?",
                                          hintStyle: TextStyle(
                                            color: CustomColors.orange,
                                          ),
                                          labelStyle: TextStyle(
                                            color: Color.fromRGBO(
                                              59,
                                              59,
                                              59,
                                              0.2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ResponsiveSizes.responsiveWidth(15, width),
                        ),
                        Flexible(
                          child: Container(
                            height: ScreenUtil().setHeight(47),
                            decoration: const BoxDecoration(
                              color: CustomColors.orangeTransparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                15,
                                0,
                                15,
                                0,
                              ),
                              child: SvgPicture.asset(
                                Images.filter,
                                width: ResponsiveSizes.responsiveWidth(
                                  24,
                                  width,
                                ),
                                height: ResponsiveSizes.responsiveHeight(
                                  24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Text(
                      "Nearest Restaurant",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FontSizes.responsiveSize(15),
                        color: Colors.black,
                      ),
                    ),
                    Consumer(builder: (context, ref, _) {
                      final productsRepository = ref.watch(productsProvider);
                      final restaurants =
                          productsRepository.getNearestRestaurant();
                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          restaurants.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 8, 10),
                              child: NearRestaurantItem(
                                title: restaurants[index].title,
                                distance: restaurants[index].deliveryTime,
                              ),
                            );
                          },
                        ),
                      );
                    })
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
