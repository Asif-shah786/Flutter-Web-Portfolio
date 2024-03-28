
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/utils/globals.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/pages/home/components/carousel.dart';
import 'package:my_portfolio/pages/home/components/footer.dart';
import 'package:my_portfolio/pages/home/components/header.dart';
import 'package:my_portfolio/pages/home/components/service.dart';
import 'package:my_portfolio/portfolio/components/portfolio_section.dart';
import 'package:my_portfolio/provider/home.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/widgets/switch.dart';
import 'package:particles_flutter/particles_flutter.dart';

import '../../core/utils/utils.dart';
import 'components/about_details.dart';
import 'components/home_insights.dart';
import 'components/software_development_process.dart';


class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  late HomeProvider _homeProvider;
  // late AmplitutdeProvider _amplitutdeProvider;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _homeProvider = ref.read(homeProvider);
    // _amplitutdeProvider = ref.read(amplitudeProvider);
    //
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   Timer(const Duration(seconds: 2), () async {
    //     _amplitutdeProvider.logStartupEvent();
    //     await _amplitutdeProvider.logAScreen("home");
    //   });
    // });
    super.initState();
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context) ? 30 : 20,
                ),
                Carousel(
                  key: _homeProvider.homeKey,
                ),
                const HomeInsights(),
                const SizedBox(
                  height: 16,
                ),
                AboutDetailsSection(
                  key: _homeProvider.aboutKey,
                ),
                const SizedBox(
                  height: 16,
                ),
                SoftwareDevelopmentProcessSection(
                  key: _homeProvider.processKey,
                ),
                const SizedBox(
                  height: 16,
                ),
                PortfoliosSection(
                    key: _homeProvider.portfolioKey,
                    projects: ProjectModel.projects.sublist(2, 4)),

                ServiceSection(
                  key: _homeProvider.servicesKey,
                ),
                // SizedBox(
                //   key: _homeProvider.portfolioKey,
                //   height: 100.0,
                // ),
                // Center(
                //     child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         context.goNamed(
                //           Routes.simulation,
                //         );
                //       },
                //       child: Text(
                //         "My Works",
                //         style: GoogleFonts.josefinSans(
                //           fontWeight: FontWeight.w900,
                //           fontSize: 36,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 5,
                //     ),
                //     Text(
                //       "Here are some of my Previous Work :)",
                //       style: GoogleFonts.josefinSans(
                //         color: Colors.grey[400],
                //         fontSize: 14,
                //       ),
                //     ),
                //     Align(
                //       alignment: Alignment.centerRight,
                //       child: Container(
                //         margin: const EdgeInsets.only(right: 10),
                //         child: InkWell(
                //           onTap: () {
                //             context.goNamed(
                //               Routes.myWorks,
                //             );
                //           },
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Text(
                //               "View All",
                //               style: GoogleFonts.josefinSans(
                //                 color: kPrimaryColor,
                //                 fontWeight: FontWeight.w700,
                //                 fontSize: 14,
                //                 decoration: TextDecoration.underline,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 15,
                //     )
                //   ],
                // )),
                // ProjectSection(
                //   projects: ProjectModel.projects.take(4).toList(),
                // ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 28.0),
                //   child: PortfolioStats(),
                // ),
                // const SizedBox(
                //   height: 50.0,
                // ),
                Footer(
                  key: _homeProvider.contactKey,
                )
              ],
            ),
          ),
        ),
        Header(
          themeSwitch: ThemeSwitcher(
              clipper: const ThemeSwitcherBoxClipper(),
              builder: (context) {
                return CustomSwitch(
                  value: ref.watch(themeProvider).isDarkMode,
                  onChanged: (val) {
                    ref.read(themeProvider).changeTheme(val);
                    ThemeSwitcher.of(context).changeTheme(
                        theme: ref.read(themeProvider).getCurrentTheme,
                        isReversed: false // default: false
                        );
                  },
                );
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Stack(
        children: [
          CircularParticle(
            key: UniqueKey(),
            awayRadius: 1,
            numberOfParticles: CommonFunction.isApp(context) ? 20 : 50,
            speedOfParticles: 2,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            onTapAnimation: true,
            particleColor: Colors.yellow,
            awayAnimationDuration: const Duration(milliseconds: 600),
            maxParticleSize: 2,
            isRandSize: true,
            isRandomColor: true,
            randColorList: const [
              Colors.white,
              Colors.green,
              Colors.yellowAccent
            ],
            awayAnimationCurve: Curves.easeInOut,
            enableHover: true,
            connectDots: true,
          ),
          Scaffold(
            key: Globals.scaffoldKey,
            backgroundColor: Colors.transparent,
            endDrawer: Drawer(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24.0,
                  ),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          if (Globals.scaffoldKey.currentState != null) {
                            if (Globals
                                .scaffoldKey.currentState!.isEndDrawerOpen) {
                              Navigator.pop(context);
                              _homeProvider.scrollBasedOnHeader(
                                  HeaderRow.headerItems[index]);
                            }
                          }
                        },
                        leading: Icon(
                          HeaderRow.headerItems[index].iconData,
                        ),
                        title: Text(
                          HeaderRow.headerItems[index].title,
                          style: const TextStyle(),
                        ),
                        trailing: HeaderRow.headerItems[index].isDarkTheme !=
                                null
                            ? HeaderRow.headerItems[index].isDarkTheme!
                                ? SizedBox(
                                    width: 50,
                                    child: CustomSwitch(
                                      value:
                                          ref.watch(themeProvider).isDarkMode,
                                      onChanged: (val) {
                                        ref
                                            .read(themeProvider)
                                            .changeTheme(val);
                                        ThemeSwitcher.of(context).changeTheme(
                                            theme: ref
                                                .read(themeProvider)
                                                .getCurrentTheme,
                                            isReversed: false // default: false
                                            );
                                      },
                                    ),
                                  )
                                : null
                            : null,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10.0,
                      );
                    },
                    itemCount: HeaderRow.headerItems.length,
                  ),
                ),
              ),
            ),
            body: _buildPage(),
          ),
        ],
      ),
    );
  }
}
