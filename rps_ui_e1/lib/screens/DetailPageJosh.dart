import 'package:flutter/material.dart';
import 'package:rps_ui_e1/custom/BorderIcon.dart';
import 'package:rps_ui_e1/custom/OptionButton.dart';
import 'package:rps_ui_e1/utils/constants.dart';
import 'package:rps_ui_e1/utils/custom_functions.dart';
import 'package:rps_ui_e1/utils/widget_functions.dart';

import '../sample_data.dart';

class DetailPageJosh extends StatelessWidget {
  const DetailPageJosh({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    const double padding = 25;
    final EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final houseData = RE_DATA[0];

    return SafeArea(
      child: Scaffold(
          backgroundColor: COLOR_WHITE,
          body: Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(houseData["image"]),
                              Padding(
                                padding: EdgeInsets.all(padding),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BorderIcon(
                                        child: Icon(Icons.arrow_back),
                                        height: 50,
                                        width: 50),
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
                                    Text(
                                        "${formatCurrency(houseData["amount"])}",
                                        style:
                                            themeData.textTheme.displayLarge),
                                    addVerticalSpace(4),
                                    Text("${houseData["address"]}",
                                        style: themeData.textTheme.bodySmall)
                                  ],
                                ),
                                BorderIcon(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                        "${formatPostedDate(houseData["time_posted"])}",
                                        style:
                                            themeData.textTheme.headlineLarge))
                              ],
                            ),
                          ),
                          addVerticalSpace(padding),
                          Padding(
                            padding: sidePadding,
                            child: Text("House Information",
                                style: themeData.textTheme.displaySmall),
                          ),
                          addVerticalSpace(padding),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  InformationTile(
                                      info: houseData["bedrooms"].toString(),
                                      name: "bedrooms"),
                                  InformationTile(
                                      info: houseData["bathrooms"].toString(),
                                      name: "bathrooms"),
                                  InformationTile(
                                      info: houseData["area"].toString(),
                                      name: "area"),
                                  InformationTile(
                                      info: houseData["garage"].toString(),
                                      name: "garage"),
                                ],
                              )),
                          addVerticalSpace(padding),
                          Padding(
                            padding: sidePadding,
                            child: Text(houseData["description"],
                                textAlign: TextAlign.justify,
                                style: themeData.textTheme.bodyMedium),
                          ),
                          addVerticalSpace(size.width * 0.30)
                        ]),
                  ),
                  Positioned(
                      bottom: 20,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OptionButton(
                              text: "Message",
                              icon: Icons.message,
                              width: size.width * 0.35),
                          addHorizontalSpace(10),
                          OptionButton(
                              text: "Call",
                              icon: Icons.call,
                              width: size.width * 0.35)
                        ],
                      ))
                ],
              ))),
    );
  }
}

class InformationTile extends StatelessWidget {
  const InformationTile({Key key, @required this.info, @required this.name})
      : super(key: key);

  final String info;
  final String name;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    double tileSize = size.width * 0.2;
    double padding = 15;
    EdgeInsets sidePadding = EdgeInsets.only(left: 25);

    return Container(
      padding: sidePadding,
      child: Column(children: [
        BorderIcon(
            height: tileSize,
            width: tileSize,
            child: Text(info, style: themeData.textTheme.displaySmall)),
        addVerticalSpace(padding),
        Text(name, style: themeData.textTheme.headlineMedium)
      ]),
    );
  }
}
