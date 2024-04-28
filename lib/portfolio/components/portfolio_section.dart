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
    double subTitleFontSize = ScreenHelper.isDesktop(context)
        ? 22.0
        : (ScreenHelper.isTablet(context) ? 18.0 : 12.0);
    double projectTitleFontSize = ScreenHelper.isDesktop(context)
        ? 30.0
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
                height: 1.2,
                fontSize: titleFontSize * textScaleFactor,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "\"Art is what we're doing when we do our best work. - Seth Godin\"",
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w500,
                height: 1.5,
                fontSize: subTitleFontSize * textScaleFactor,
                color: Colors.grey,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: CarouselSlider(
                options: CarouselOptions(
                  height:
                      imageHeight + MediaQuery.of(context).size.height * 0.25,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  // autoPlayInterval: const Duration(seconds: 5),
                ),
                items: projects.map((projectModel) {
                  return _buildProject(projectModel, imagePadding, imageHeight,
                      projectTitleFontSize, techUsedFontSize);
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 24,
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
    double techUsedFontSize,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer(builder: (context, ref, _) {
          return Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              color: ref.watch(themeProvider).isDarkMode
                  ? const Color.fromARGB(75, 12, 12, 7)
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (projectModel.appPhotos != null)
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 8 : 5,
                    child: Image.asset(
                      projectModel.appPhotos!,
                      fit: BoxFit.fitWidth,
                      height: imageHeight,
                      frameBuilder: (BuildContext context, Widget child,
                          int? frame, bool wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return child;
                        }
                        return AnimatedOpacity(
                          child: child,
                          opacity: frame == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut,
                        );
                      },
                    ),
                  ),
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 2 : 4,
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                children: projectModel.techUsed
                                    .map((e) => Container(
                                          height: constraints.maxWidth > 720.0
                                              ? 60
                                              : 50,
                                          margin: const EdgeInsets.all(10),
                                          width: constraints.maxWidth > 720.0
                                              ? 60
                                              : 50,
                                          alignment: Alignment.center,
                                          color: e.logo ==
                                                  AppConstants.razorPayImage
                                              ? Colors.white
                                              : null,
                                          child: Image.asset(e.logo),
                                        ))
                                    .toList(),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: Alignment.center,
                                  height: 48.0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Utilty.openUrl(AppConstants.linkedInUrl);
                                    },
                                    child: Text(
                                      "Explore more!",
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: SizedBox(
                                  height:
                                      constraints.maxWidth > 720.0 ? 50 : 30,
                                  child: StoreButton(
                                    onPressed: () {
                                      if (projectModel.internalLink) {
                                        context
                                            .goNamed(projectModel.projectLink);
                                      } else {
                                        Utilty.openUrl(
                                            projectModel.projectLink);
                                      }
                                    },
                                    buttonType: StoreButtonType.appStore,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: SizedBox(
                                  height:
                                      constraints.maxWidth > 720.0 ? 50 : 30,
                                  child: StoreButton(
                                    onPressed: () {
                                      if (projectModel.internalLink) {
                                        context
                                            .goNamed(projectModel.projectLink);
                                      } else {
                                        Utilty.openUrl(
                                            projectModel.projectLink);
                                      }
                                    },
                                    buttonType: StoreButtonType.playStore,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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

class StoreButton extends StatelessWidget {
  final StoreButtonType buttonType;
  final VoidCallback onPressed;

  const StoreButton({
    super.key,
    required this.buttonType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String buttonTextLine1;
    String buttonTextLine2;
    IconData buttonIcon;

    switch (buttonType) {
      case StoreButtonType.appStore:
        buttonTextLine1 = 'Download on the';
        buttonTextLine2 = 'App Store';
        buttonIcon = Icons.apple_outlined;
        break;
      case StoreButtonType.playStore:
        buttonTextLine1 = 'Get it on';
        buttonTextLine2 = 'Google Play';
        buttonIcon = Icons.play_circle_fill;
        break;
      case StoreButtonType.github:
        buttonTextLine1 = 'View on';
        buttonTextLine2 = 'GitHub';
        buttonIcon = Icons.code; // Use code icon as a placeholder for GitHub
        break;
      case StoreButtonType.website:
        buttonTextLine1 = 'Visit';
        buttonTextLine2 = 'Website';
        buttonIcon = Icons.web; // Use an appropriate website icon
        break;
      default:
        throw Exception('Unknown button type');
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(buttonIcon, color: Colors.white, size: 24.0), // Icon
            const SizedBox(width: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align text to the start
              mainAxisSize: MainAxisSize.min, // Use minimal vertical space
              children: [
                Text(
                  buttonTextLine1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  buttonTextLine2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
