import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_app/utils/constants.dart';
import 'package:instagram_app/utils/widget_functions.dart';

import 'components/user_profile_and_stats.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    final double padding = 15;
    final EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: padding);

    List<String> testingData = [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10"
    ];
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          // elevation: ,
          foregroundColor: COLOR_DARK_GRAY,
          title: Text(username, style: themeData.textTheme.displaySmall),
          leading: Icon(Icons.arrow_back_ios_rounded, color: COLOR_GRAY),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.more_horiz_rounded, color: COLOR_GRAY),
            )
          ]),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(20),
            UserProfileAndStats(
              sidePadding: sidePadding,
              size: size,
              picString: "assets/images/JoshuaPic.jpg",
              posts: 7,
              followers: 863,
              following: 802,
            ),
            addVerticalSpace(padding),
            //Subtitle
            Padding(
              padding: sidePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Joshua Odoi",
                      style: themeData.textTheme.headlineMedium),
                  addVerticalSpace(5),
                  InkWell(
                    child: new Text('www.url.com',
                        style: themeData.textTheme.bodyMedium!
                            .copyWith(color: COLOR_BLUE)),
                    onTap: () => launch('https://google.com'),
                  ),
                  addVerticalSpace(5),
                  RichText(
                    text: TextSpan(
                      text: "Followed by ",
                      style: themeData.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.normal),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'account1, account2',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: ' and 92 others',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Following/Message/Contact Buttons
            addVerticalSpace(padding),
            Padding(
              padding: sidePadding,
              child: Row(
                children: [
                  Expanded(
                    child: UserActionButtons(
                      child: Text("Following",
                          style: themeData.textTheme.headline5),
                      // width: size.width * 0.3,
                    ),
                  ),
                  addHorizontalSpace(3),
                  Expanded(
                    child: UserActionButtons(
                      child:
                          Text("Message", style: themeData.textTheme.headline5),
                      // width: size.width * 0.3,
                    ),
                  ),
                  addHorizontalSpace(3),
                  Expanded(
                    child: UserActionButtons(
                      child:
                          Text("Contact", style: themeData.textTheme.headline5),
                      // width: size.width * 0.3,
                    ),
                  ),
                  addHorizontalSpace(3),
                  UserActionButtons(
                      child: Icon(Icons.keyboard_arrow_down_rounded))
                ],
              ),
            ),
            addVerticalSpace(padding),
            //Stories
            Container(
              width: size.width,
              height: 100,
              child: StoryScroll(
                  sidePadding: sidePadding, testingData: testingData),
            ),

            // Container(
            //   padding: EdgeInsets.all(300),
            //   height: 80,
            //   width: 80,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage(
            //           "assets/images/black_cracked_screen.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(300),
            //   height: 80,
            //   width: 80,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage(
            //           "assets/images/black_cracked_screen.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(300),
            //   height: 80,
            //   width: 80,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage(
            //           "assets/images/black_cracked_screen.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(300),
            //   height: 80,
            //   width: 80,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage(
            //           "assets/images/black_cracked_screen.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(300),
            //   height: 80,
            //   width: 80,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage(
            //           "assets/images/black_cracked_screen.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(300),
            //   height: 80,
            //   width: 80,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: AssetImage(
            //           "assets/images/black_cracked_screen.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            //   ),
            // ]),
            // Grid or Tagged

            // Grid of Photos and

            // Bottom navbar
          ],
        ),
      ),
    );
  }
}

class StoryScroll extends StatelessWidget {
  const StoryScroll({
    Key? key,
    required this.sidePadding,
    required this.testingData,
  }) : super(key: key);

  final EdgeInsets sidePadding;
  final List<String> testingData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: testingData.length,
        itemBuilder: (context, index) {
          return Container(
              // padding: EdgeInsets.all(300),
              margin: sidePadding,
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/black_cracked_screen.jpg"),
                  fit: BoxFit.cover,
                ),
              ));
        });
  }
}

class UserActionButtons extends StatelessWidget {
  const UserActionButtons({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    // required this.width,
    // required this.height
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  // final double width; //, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      // height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
      ),
      child: Center(child: child),
    );
  }
}
