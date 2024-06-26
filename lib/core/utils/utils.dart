import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("mailto:agnelselvan007@gmail.com");

  static Future<void> openMyLocation() =>
      openUrl("https://goo.gl/maps/YDFt3w2xWAu3nwD17");
  static Future<void> openMyPhoneNo() => openUrl("tel:+91-9167877725");
  static Future<void> openWhatsapp() => openUrl("https://wa.me/9167877725");
}



class CommonFunction {
  static void openFromUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void openMail() {
    Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'hiashutoshkumarsingh@gmail.com',
    );
    launch(_emailLaunchUri.toString());
  }

  static bool isApp(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 800) {
      return false;
    } else {
      return true;
    }
  }
}
