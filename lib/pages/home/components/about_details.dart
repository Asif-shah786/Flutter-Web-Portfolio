import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutDetails {
  final String title, description, image;
  const AboutDetails(
      {required this.title, required this.description, required this.image});
}

class AboutDetailsSection extends StatefulWidget {
  const AboutDetailsSection({Key? key}) : super(key: key);

  @override
  State<AboutDetailsSection> createState() => _AboutDetailsSectionState();
}

class _AboutDetailsSectionState extends State<AboutDetailsSection> {
  List<AboutDetails> details = [
    const AboutDetails(
      title: 'Solution focused, not hours focused',
      description:
          'Instead of just counting hours, we think it\'s important to provide solutions. We are not just timekeepers; we are the problem solvers. Our approach is centered on your needs, and we make sure that every line of code contributes meaningful and efficient solutions.',
      image: 'assets/images/aboutDetails/solution.png',
    ),
    const AboutDetails(
      title: 'Transparent communication',
      description:
          'Our commitment is crystal clear, we will keep you informed at every stage of the development process. We believe in a partnership where transparency is the foundation, ensuring that your vision aligns with our execution.',
      image: 'assets/images/aboutDetails/ideas.png',
    ),
    const AboutDetails(
      title: 'Getting you from vision to reality',
      description:
          'We specialize in turning your vision into functional solutions. We are not just developers; we are architects of your dreams. Our dedicated team bridges the gap between concept and execution. Let us be your partners in turning ideas into impactful solutions.',
      image: 'assets/images/aboutDetails/vision.png',
    ),
    const AboutDetails(
      title: 'Under one roof',
      description:
          'We are happy that you are here, where your all tech needs find a home. From development to deployment and design to support, we have got it all covered. You will find everything you need for your software needs at a single, convenient place.',
      image: 'assets/images/aboutDetails/development.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    AboutDetailCard(item: details[0], width: width),
                    AboutDetailCard(item: details[1], width: width),
                    if (constraints.maxWidth < 720.0)
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            AboutDetailCard(
                                item: details[2], width: width),
                            AboutDetailCard(
                                item: details[3], width: width),
                          ],
                        ),
                      ),
                  ],
                ),
                if (constraints.maxWidth > 720.0)
                  Column(
                    children: [
                      const SizedBox(
                        height: 300,
                      ),
                      AboutDetailCard(item: details[2], width: width),
                      AboutDetailCard(item: details[3], width: width),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget _buildUi(double width) {
  //   return Center(
  //     child: LayoutBuilder(
  //       builder: (context, constraints) {
  //         return ResponsiveWrapper(
  //           maxWidth: width,
  //           minWidth: width,
  //           defaultScale: false,
  //           child: Flex(
  //             direction:
  //                 constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
  //             children: [
  //               Expanded(
  //                 flex: constraints.maxWidth > 720.0 ? 1 : 0,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const SizedBox(
  //                       height: 15.0,
  //                     ),
  //                     Text(
  //                       "About Me",
  //                       style: GoogleFonts.josefinSans(
  //                         fontWeight: FontWeight.w900,
  //                         height: 1.3,
  //                         fontSize: 35.0,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 25.0,
  //                     ),
  //                     Text(
  //                       "I'm Agnel Selvan, A Flutter and iOS Developer and Technical Blog Writer",
  //                       style: GoogleFonts.josefinSans(
  //                         fontWeight: FontWeight.bold,
  //                         height: 1.3,
  //                         fontSize: 24.0,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 10.0,
  //                     ),
  //                     const Text(
  //                       "I have done my Computer Science graduation at Xavier's Institute of Engineering on 2021. I have been developing Mobile Apps for more than 1 years now. I have worked as a Team and as an Indivual in various organization and launched the apps in Playstore as well as in Appstore. In my free time I use to write Technical Blog in Medium. Always love to learn new technologies and to succeed in an environment of growth and excellence and earn a job which provides me job satisfaction and self-development and help me achieve personal as well as organisational goals.",
  //                       style: TextStyle(
  //                         color: kCaptionColor,
  //                         height: 1.5,
  //                         fontSize: 15.0,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 20.0,
  //                     ),
  //                     const Text(
  //                       "Technology I have worked with",
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       height: 10.0,
  //                     ),
  //                     Consumer(builder: (context, ref, _) {
  //                       return ScrollConfiguration(
  //                         behavior: ScrollConfiguration.of(context)
  //                             .copyWith(scrollbars: false),
  //                         child: SingleChildScrollView(
  //                           scrollDirection: Axis.horizontal,
  //                           child: Row(
  //                             children: TechnologyConstants.technologyLearned
  //                                 .map((e) => MouseRegion(
  //                                       cursor: SystemMouseCursors.click,
  //                                       child: Container(
  //                                         decoration: BoxDecoration(
  //                                           color: ref
  //                                                   .watch(themeProvider)
  //                                                   .isDarkMode
  //                                               ? Colors.grey[800]
  //                                               : Colors.grey[200],
  //                                           borderRadius:
  //                                               BorderRadius.circular(4.0),
  //                                         ),
  //                                         margin: const EdgeInsets.symmetric(
  //                                             horizontal: 5),
  //                                         padding: const EdgeInsets.symmetric(
  //                                             horizontal: 8.0, vertical: 6),
  //                                         child: InkWell(
  //                                           onTap: () {},
  //                                           child: Center(
  //                                             child: Row(
  //                                               children: [
  //                                                 SizedBox(
  //                                                     width: 20,
  //                                                     height: 20,
  //                                                     child:
  //                                                         Image.asset(e.logo)),
  //                                                 const SizedBox(
  //                                                   width: 10,
  //                                                 ),
  //                                                 Text(
  //                                                   e.name,
  //                                                   style: const TextStyle(
  //                                                     fontSize: 12.0,
  //                                                     fontWeight:
  //                                                         FontWeight.bold,
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ))
  //                                 .toList(),
  //                           ),
  //                         ),
  //                       );
  //                     }),
  //                     const SizedBox(
  //                       height: 70.0,
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 25.0,
  //               ),
  //               if (ScreenHelper.isDesktop(context) ||
  //                   ScreenHelper.isTablet(context))
  //                 Expanded(
  //                   flex: constraints.maxWidth > 720.0 ? 1 : 0,
  //                   child: SvgPicture.asset(
  //                     AppConstants.personSvg,
  //                     width: constraints.maxWidth > 720.0 ? null : 350.0,
  //                   ),
  //                 ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}

class AboutDetailCard extends StatefulWidget {
  const AboutDetailCard({
    super.key,
    required this.item,
    required this.width,
  });

  final AboutDetails item;
  final double width;

  @override
  State<AboutDetailCard> createState() => _AboutDetailCardState();
}

class _AboutDetailCardState extends State<AboutDetailCard> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHelper.isMobile(context) ? widget.width * 0.9 : widget.width * 0.46,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
            },
            onHover: (hover) {
              setState(() {
                isHovered = hover;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isHovered
                  ? ScreenHelper.isMobile(context)
                      ? widget.width * 0.95 // Adjust size when hovered
                      : widget.width * 0.5
                  : ScreenHelper.isMobile(context)
                      ? widget.width * 0.9
                      : widget.width * 0.46,
              height: isHovered ? 350 : 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.item.image,
                  width: 380.0,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            widget.item.title,
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1,
              fontSize: 26.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            widget.item.description,
            style: const TextStyle(
              color: kCaptionColor,
              height: 1.5,
              fontSize: 15.0,
              overflow: TextOverflow.clip,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
