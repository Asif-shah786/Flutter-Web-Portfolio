import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/footer_item.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/core/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/insights.dart';

final List<Insights> homeInsights = [
  Insights(
    iconData: Icons.location_on,
    title: "3",
    text1: "years",
    text2: "Proven Track Record",
  ),
  Insights(
    iconData: Icons.phone,
    title: "98",
    text1: "%",
    text2: "Customer Satisfaction",
  ),
  Insights(
    iconData: Icons.mail,
    title: "50+",
    text1: "projects",
    text2: "We Have Completed",
  ),
  Insights(
    iconData: Icons.sms,
    title: "3",
    text1: "mins",
    text2: "Average Answer Time",
  )
];

class HomeInsights extends StatelessWidget {
  const HomeInsights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: homeInsights
                      .map(
                        (footerItem) => MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            child: SizedBox(
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 20.0
                                  : constraints.maxWidth / 4.0 - 20.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${footerItem.title} ",
                                          style: GoogleFonts.josefinSans(
                                            fontSize: 40.0,
                                            color : kPrimaryColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: footerItem.text1,
                                          style: const TextStyle(
                                            color: kCaptionColor,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  // Row(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.center,
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Icon(
                                  //       footerItem.iconData,
                                  //       color: kPrimaryColor,
                                  //       size: 28,
                                  //     ),
                                  //     const SizedBox(
                                  //       width: 15.0,
                                  //     ),
                                  //     Text(
                                  //       footerItem.title,
                                  //       style: GoogleFonts.josefinSans(
                                  //         fontSize: 18.0,
                                  //         fontWeight: FontWeight.w700,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    footerItem.text2,
                                    style: const TextStyle(
                                      color: kCaptionColor,
                                      fontSize: 20,
                                    ),
                                  )                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // const Flex(
              //   direction: Axis.horizontal,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(bottom: 8.0),
              //       child: Text(
              //         "Developed in 💛 with Flutter",
              //         style: TextStyle(
              //           color: kCaptionColor,
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          );
        },
      ),
    ),
  );
}
