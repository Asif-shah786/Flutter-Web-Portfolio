


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/screen_helper.dart';
import '../models/project.dart';
import '../pages/home/components/footer.dart';
import '../widgets/header.dart';
import 'components/portfolio_section.dart';


class Portfolio extends ConsumerStatefulWidget {
  const Portfolio({super.key});

  @override
  ConsumerState<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends ConsumerState<Portfolio> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
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
                Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Portfolios",
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 36,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    )),
                PortfoliosSection(
                  projects: ProjectModel.projects,
                ),
                const Footer()
              ],
            ),
          ),
        ),
        const CommonHeader(),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
    );
  }
}
