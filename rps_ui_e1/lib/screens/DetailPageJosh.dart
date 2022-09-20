import 'package:flutter/material.dart';
import 'package:rps_ui_e1/custom/BorderIcon.dart';
import 'package:rps_ui_e1/utils/custom_functions.dart';
import 'package:rps_ui_e1/utils/widget_functions.dart';

import '../sample_data.dart';

class DetailPageJosh extends StatelessWidget {
  const DetailPageJosh({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double padding = 25;
    final EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: padding);
    ThemeData themeData = Theme.of(context);
    final houseData = RE_DATA[0];

    DateTime tsdate =
        DateTime.fromMillisecondsSinceEpoch(houseData["time_posted"]);

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Title'),
        // ),
        body: SafeArea(
      child: Container(
          width: size.width,
          height: size.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Image.asset(houseData["image"]),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderIcon(
                          child: Icon(Icons.arrow_back), height: 50, width: 50),
                      BorderIcon(
                          child: Icon(Icons.favorite_border),
                          height: 50,
                          width: 50)
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("${formatCurrency(houseData["amount"])}",
                          style: themeData.textTheme.headline1),
                      addVerticalSpace(4),
                      Text("${houseData["address"]}",
                          style: themeData.textTheme.subtitle1)
                    ],
                  ),
                  BorderIcon(
                      padding: EdgeInsets.all(12),
                      child:
                          Text("${formatPostedDate(houseData["time_posted"])}"))
                ],
              ),
            ),
            addVerticalSpace(padding),
            Text("House Information", style: themeData.textTheme.headline3)
          ])),
    ));
  }
}
