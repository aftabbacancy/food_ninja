import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';
import 'package:food_ninja/widgets/chat_item.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ResponsiveSizes.responsiveHeight(70),
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: FontSizes.responsiveSize(25),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    flex: 1,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 12,
                        primary: false,
                        itemBuilder: (context, index) {
                          if (index == 11) {
                            return const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: ChatItem(),
                            );
                          }
                          return const ChatItem();
                        }),
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
