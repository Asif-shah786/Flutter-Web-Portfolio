import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/name_color.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/core/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/design_process.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "Learn",
    imagePath: "assets/images/learn.png",
    subtitle: "",
  ),
  DesignProcess(
    title: "Develop",
    imagePath: "assets/images/develop.png",
    subtitle: "",
  ),
  DesignProcess(
    title: "Document It",
    imagePath: "assets/images/blog.png",
    subtitle: "",
  ),
];

class ServiceSection extends StatelessWidget {
  ServiceSection({Key? key}) : super(key: key);
  final whatIDo = [
    NameIconColor(
      title: "Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
    ),
    NameIconColor(
      title: "Web Development",
      iconData: Icons.web,
      color: Colors.yellow[400]!,
    ),
    NameIconColor(
      title: "UI/UX Design",
      iconData: Icons.mobile_screen_share,
      color: Colors.orange[400]!,
    ),
    NameIconColor(
      title: "Courses by Industry Experts",
      iconData: Icons.school_outlined,
      color: Colors.blue[400]!,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Solutions and Services",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1,
              fontSize: 35.0,
            ),
          ),
          SizedBox(
            height: ScreenHelper.isDesktop(context) ? 70 : 30,
          ),
          Consumer(builder: (context, ref, _) {
            return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: whatIDo
                    .map((e) => Container(
                          height: 200,
                          width: 200,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: ref.watch(themeProvider).isDarkMode
                                ? const Color.fromARGB(75, 12, 12, 7)
                                : Colors.grey[50],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: ref.watch(themeProvider).isDarkMode
                                      ? Colors.grey[900]
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: Icon(
                                  e.iconData,
                                  color: e.color,
                                  size: 52,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.josefinSans(
                                  color: ref.watch(themeProvider).isDarkMode
                                      ? Colors.grey[400]
                                      : Colors.grey[800],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ))
                    .toList());
          }),
          // const SizedBox(
          //   height: 80.0,
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   child: LayoutBuilder(
          //     builder: (_context, constraints) {
          //       return ResponsiveGridView.builder(
          //         padding: const EdgeInsets.all(0.0),
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         gridDelegate: ResponsiveGridDelegate(
          //           mainAxisSpacing: 20.0,
          //           crossAxisSpacing: 20.0,
          //           maxCrossAxisExtent: ScreenHelper.isMobile(context)
          //               ? constraints.maxWidth / 1.0
          //               : ScreenHelper.isTablet(context)
          //                   ? constraints.maxWidth / 2.0
          //                   : 450.0,
          //           childAspectRatio: 5,
          //         ),
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             alignment: Alignment.center,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Image.asset(
          //                       designProcesses[index].imagePath,
          //                       width: 40.0,
          //                     ),
          //                     const SizedBox(
          //                       width: 15.0,
          //                     ),
          //                     Text(
          //                       designProcesses[index].title,
          //                       style: GoogleFonts.josefinSans(
          //                         fontSize: 20.0,
          //                         fontWeight: FontWeight.w700,
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //         itemCount: designProcesses.length,
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
