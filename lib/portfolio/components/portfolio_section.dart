import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/core/utils/utils.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PortfoliosSection extends StatelessWidget {
  final List<ProjectModel> projects;
  const PortfoliosSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(context, kDesktopMaxWidth),
      tablet: _buildUi(context, kTabletMaxWidth),
      mobile: _buildUi(context, getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    double titleFontSize = ScreenHelper.isDesktop(context)
        ? 45.0
        : (ScreenHelper.isTablet(context) ? 35.0 : 16.0);
    double projectTitleFontSize = ScreenHelper.isDesktop(context)
        ? 28.0
        : (ScreenHelper.isTablet(context) ? 22.0 : 12.0);
    double techUsedFontSize = ScreenHelper.isDesktop(context)
        ? 16.0
        : (ScreenHelper.isTablet(context) ? 14.0 : 12.0);
    EdgeInsets imagePadding = ScreenHelper.isDesktop(context)
        ? const EdgeInsets.all(20)
        : (ScreenHelper.isTablet(context)
            ? const EdgeInsets.all(10)
            : const EdgeInsets.all(5));
    double imageHeight = ScreenHelper.isDesktop(context)
        ? 500
        : (ScreenHelper.isTablet(context) ? 300 : 300);

    return Center(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Collection of Our Successful Deliveries",
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w900,
                height: 1.5,
                fontSize: titleFontSize * textScaleFactor,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: CarouselSlider(
                options: CarouselOptions(
                  // This ensures that the carousel takes up the height it needs
                  height: imageHeight +
                      MediaQuery.of(context).size.height *
                          0.25, // Adjust the height accordingly
                  // This scrolls one full project item at a time
                  viewportFraction: 1.0,
                  // Enable/Disable sliding with manual dragging
                  enableInfiniteScroll: false,
                  // Disable/Enable auto play
                  autoPlay: true,
                ),
                items: projects.map((projectModel) {
                  // Here we use the _buildProject() method that you will define
                  // to build each project item in the slider.
                  return _buildProject(projectModel, imagePadding, imageHeight,
                      projectTitleFontSize, techUsedFontSize);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(
      ProjectModel projectModel,
      EdgeInsets imagePadding,
      double imageHeight,
      double projectTitleFontSize,
      double techUsedFontSize) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer(builder: (context, ref, _) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ref.watch(themeProvider).isDarkMode
                  ? const Color.fromARGB(75, 12, 12, 7)
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Flex(
              direction: ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (projectModel.appPhotos != null)
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 8 : 5,
                    child: Padding(
                      padding: imagePadding,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          projectModel.appPhotos!,
                          fit: BoxFit.fill,
                          height: imageHeight,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 2 : 5,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          projectModel.title,
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: projectTitleFontSize,
                          ),
                          textAlign : TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        projectModel.techUsed.isEmpty
                            ? Container()
                            : Text(
                                "Technologies Used",
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w900,
                                  fontSize: techUsedFontSize,
                                ),
                          textAlign : TextAlign.start,
                        ),
                        Wrap(
                          children: projectModel.techUsed
                              .map((e) => Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 25,
                                    color: e.logo == AppConstants.razorPayImage
                                        ? Colors.white
                                        : null,
                                    height: 25,
                                    child: Image.asset(e.logo),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Available on',
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.w900,
                                height: 1.3,
                                fontSize: projectTitleFontSize,
                              ),
                              textAlign : TextAlign.center,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: SizedBox(
                                height: constraints.maxWidth > 720.0 ? 50 : 30,
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      kPrimaryColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (projectModel.internalLink) {
                                      context.goNamed(projectModel.projectLink);
                                    } else {
                                      Utilty.openUrl(projectModel.projectLink);
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "AppStore",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: SizedBox(
                                height: constraints.maxWidth > 720.0 ? 50 : 30,
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      kPrimaryColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (projectModel.internalLink) {
                                      context.goNamed(projectModel.projectLink);
                                    } else {
                                      Utilty.openUrl(projectModel.projectLink);
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "PlayStore",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
