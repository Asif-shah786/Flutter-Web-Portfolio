import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/screen_helper.dart';

// Define the Software Development Process Details
class SoftwareDevelopmentProcessDetails {
  final String title, description, image;
  final int index;
  const SoftwareDevelopmentProcessDetails({
    required this.title,
    required this.description,
    required this.image,
    required this.index,
  });
}

// Define the Software Development Process Section Widget
class SoftwareDevelopmentProcessSection extends StatelessWidget {
  // List of Software Development Process Details
  final List<SoftwareDevelopmentProcessDetails> details = [
    const SoftwareDevelopmentProcessDetails(
      title: 'Requirement Analysis',
      description:
          'We begin by discussing and analyzing our client\'s needs, sketching the outline of the required software, figuring out gaps, and proposing solutions alongside the way.',
      image: 'assets/images/development process/req.png',
      index: 1,
    ),
    const SoftwareDevelopmentProcessDetails(
      title: 'UI & UX Designing',
      description:
          'We take your idea through our streamlined procedure of software development. Tailoring the product as per your technical and design specifications.',
      image: 'assets/images/development process/ui-ux.png',
      index: 2,
    ),
    const SoftwareDevelopmentProcessDetails(
      title: 'Development Phase',
      description:
          'We take your idea through our streamlined procedure of software development. Tailoring the product as per your technical and design specifications.',
      image: 'assets/images/development process/dev_phase.png',
      index: 3,
    ),
    const SoftwareDevelopmentProcessDetails(
      title: 'Quality Assurance & Testing',
      description:
          'We maintain strict standards of quality to make sure that your software is according to your specifications with bug-free software operation.',
      image: 'assets/images/development process/quality.png',
      index: 4,
    ),
    const SoftwareDevelopmentProcessDetails(
      title: 'Launching & Marketing',
      description:
          'Our team aims to improve the success of the product launch by analyzing, evaluating, and adjusting throughout the product life cycle. Applying certain marketing strategies that distinguish productiveness and progress.',
      image: 'assets/images/development process/launching.png',
      index: 5,
    ),
    const SoftwareDevelopmentProcessDetails(
      title: 'Active Support & Assistance',
      description:
          'Our team is skilled at planning the rollout of complicated software systems after which providing the technical support to maintain those systems up and running.',
      image: 'assets/images/development process/active.png',
      index: 6,
    ),
  ];

  SoftwareDevelopmentProcessSection({super.key});

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
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Software Development Process",
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w900,
                height: 2,
                fontSize: 45.0,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 720 ? 3 : 1;
                double itemWidth = constraints.maxWidth / crossAxisCount - 8.0 * (crossAxisCount - 1);
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: details.map((item) {
                    return SizedBox(
                      width: itemWidth,
                      child: ProcessCard(item: item, width: itemWidth),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


}

class ProcessCard extends StatefulWidget {
  const ProcessCard({Key? key, required this.item, required this.width})
      : super(key: key);

  final SoftwareDevelopmentProcessDetails item;
  final double width;

  @override
  _ProcessCardState createState() => _ProcessCardState();
}

class _ProcessCardState extends State<ProcessCard> {
  final FlipCardController flipController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onHover: (_) async {
          // await flipController.toggleCard();
          await flipController.hint(duration: const Duration(seconds: 3));
        },
        child: FlipCard(
          controller: flipController,
          fill: Fill.fillBack,
          direction: FlipDirection.HORIZONTAL,
          side: CardSide.FRONT,
          front: buildFront(widget.item),
          back: buildBack(widget.item),
        ),
      ),
    );
  }

  Widget buildFront(SoftwareDevelopmentProcessDetails item) {
    return Container(
      width: widget.width * 0.46,
      height: 300,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(
          image: AssetImage(
            item.image,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 26, horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(
            //   item.title,
            //   style: GoogleFonts.josefinSans(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 22,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            // Text(
            //   "0${item.index}",
            //   style: GoogleFonts.josefinSans(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 30,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildBack(SoftwareDevelopmentProcessDetails item) {
    return Container(
      width: widget.width * 0.46,
      height: 300,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: kPrimaryColor,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                item.title,
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                item.description,
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
