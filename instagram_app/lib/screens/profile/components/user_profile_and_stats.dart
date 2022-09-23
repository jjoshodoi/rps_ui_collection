import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_app/utils/constants.dart';
import 'package:instagram_app/utils/widget_functions.dart';

class UserProfileAndStats extends StatelessWidget {
  const UserProfileAndStats({
    Key? key,
    required this.sidePadding,
    required this.size,
    required this.picString,
    required this.posts,
    required this.followers,
    required this.following,
  }) : super(key: key);

  final EdgeInsets sidePadding;
  final Size size;
  final String picString;
  final int posts;
  final int followers;
  final int following;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: sidePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(300),
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(picString),
                fit: BoxFit.cover,
              ),
            ),
          ),
          addHorizontalSpace(1),
          StatWithLabel(number: posts, name: "Posts"),
          StatWithLabel(number: followers, name: "Followers"),
          StatWithLabel(number: following, name: "Following"),
          addHorizontalSpace(size.width * 0.03)
        ],
      ),
    );
  }
}

class StatWithLabel extends StatelessWidget {
  const StatWithLabel({Key? key, required this.number, required this.name})
      : super(key: key);

  final int number;
  final String name;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
        child: Column(
      children: [
        Text(number.toString(), style: themeData.textTheme.headline3),
        Text(name, style: themeData.textTheme.bodyText1)
      ],
    ));
  }
}
