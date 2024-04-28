import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/models/header_item.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/utils.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());

class HomeProvider extends ChangeNotifier {
  final contactKey = GlobalKey();
  final portfolioKey = GlobalKey();
  final servicesKey = GlobalKey();
  final processDetailsKey = GlobalKey();
  final homeKey = GlobalKey();
  final processKey = GlobalKey();

  Future<void> scrollToContact() async {
    final context = contactKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToPortfolio() async {
    final context = portfolioKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToService() async {
    final context = servicesKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToProcessDetails() async {
    final context = processDetailsKey.currentContext;
    await _scroll(context);
  }

  Future<void> scrollToHome() async {
    final context = homeKey.currentContext;
    await _scroll(context);
  }

  Future _scroll(BuildContext? context) async {
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.linear,
      );
    }
  }

  scrollBasedOnHeader(NameOnTap nameOnTap) {
    if (nameOnTap.title == "Contact") {
      scrollToContact();
    } else if (nameOnTap.title == "Home") {
      scrollToHome();
    } else if (nameOnTap.title == "Services") {
      scrollToService();
    } else if (nameOnTap.title == "Portfolio") {
      scrollToPortfolio();
    } else if (nameOnTap.title == "Process") {
      scrollToProcessDetails();
    } else if (nameOnTap.title == "Blog") {
      Utilty.openUrl(AppConstants.mediumUrl);
    }
  }
}
