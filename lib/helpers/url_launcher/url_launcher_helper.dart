import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static const _webViewConfigDisableDOM = WebViewConfiguration(
    enableDomStorage: false,
  );

  static launchPlatformDefault({required String urlData}) async {
    var url = Uri.parse(urlData);

    await launchUrl(url);
  }

  static launchWebView({required String urlData}) async {
    var url = Uri.parse(urlData);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  static launchInWebView({required String urlData}) async {
    var url = Uri.parse(urlData);
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  }

  static launchInWebViewWithoutDomStorage({required String urlData}) async {
    var url = Uri.parse(urlData);
    await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: _webViewConfigDisableDOM,
    );
  }

  static launchUniversalLinkIos({required String urlData}) async {
    Uri url = Uri.parse(urlData);
    await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication);
  }

  static launchTelp({required String phoneNumber}) async {
    // var phoneFormat = phoneNumber.trim().toString()[0] == '+'
    //     ? phoneNumber.replaceFirst('+', '')
    //     : phoneNumber.trim().toString()[0] == '62'
    //         ? phoneNumber.replaceFirst('62', '0')
    //         : phoneNumber;

    var launchCall = Uri.parse(
      (Platform.isIOS) ? 'tel://$phoneNumber' : 'tel:$phoneNumber',
    );

    await launchUrl(launchCall);
  }

  static launchSMS({required String phoneNumber}) async {
    // var phoneFormat = phoneNumber.trim().toString()[0] == '+'
    //     ? phoneNumber.replaceFirst('+', '')
    //     : phoneNumber.toString()[0] == '0'
    //         ? phoneNumber.replaceFirst('0', '62')
    //         : phoneNumber;

    var second = phoneNumber.trim().toString()[0] == '+'
        ? phoneNumber.replaceFirst('+', '')
        : phoneNumber.trim().toString()[0] == '62'
        ? phoneNumber.replaceFirst('62', '0')
        : phoneNumber;

    var launchCall = Uri.parse('sms:$second');
    // var launchCall = Uri.parse(
    //     (PlatformHelper.isIos) ? 'sms://$phoneFormat' : 'sms:$phoneFormat');

    await launchUrl(launchCall);
  }

  static launchWhatsApp({required String phoneNumber, String? text}) async {
    var phoneFormat = phoneNumber.trim().toString()[0] == '+'
        ? phoneNumber.replaceFirst('+', '')
        : phoneNumber.trim().toString()[0] == '0'
        ? phoneNumber.replaceFirst('0', '62')
        : phoneNumber;

    var uriText = Uri.encodeQueryComponent('$text');

    var launchCall = Uri.parse('https://wa.me/$phoneFormat?text=$uriText');

    await launchUrl(launchCall, mode: LaunchMode.externalApplication);
  }

  static launchWhatsApp2({required String phoneNumber, String? text}) async {
    // var phoneFormat = phoneNumber.trim().toString()[0] == '+'
    //     ? phoneNumber.replaceFirst('+', '')
    //     : phoneNumber.trim().toString()[0] == '0'
    //         ? phoneNumber.replaceFirst('0', '62')
    //         : phoneNumber;

    var uriText = Uri.encodeQueryComponent('$text');

    var launchCall = Uri.parse('https://wa.me/$phoneNumber?text=$uriText');

    await launchUrl(launchCall, mode: LaunchMode.externalApplication);
  }

  static launchEmail({String? subject, String? body}) async {
    // Encode the subject and body text for the email URL
    var encodedSubject = subject ?? '';
    var encodedBody = body ?? '';

    // Create the mailto URL
    var launchCall = Uri.parse(
      'mailto:?subject=$encodedSubject&body=$encodedBody',
    );

    // Launch the email client
    await launchUrl(launchCall, mode: LaunchMode.externalApplication);
  }

  static launchTelegram({required String phoneNumber, String? text}) async {
    // var phoneFormat = phoneNumber.trim().toString()[0] == '+'
    //     ? phoneNumber.replaceFirst('+', '')
    //     : phoneNumber.trim().toString()[0] == '0'
    //         ? phoneNumber.replaceFirst('0', '62')
    //         : phoneNumber;

    var uriText = Uri.encodeQueryComponent('$text');

    var launchCall = Uri.parse(
      'https://telegram.me/share/url?url=$phoneNumber&text=$uriText',
    );

    await launchUrl(launchCall, mode: LaunchMode.externalApplication);
  }

  static launchFacebookShare({required String content}) async {
    // Encode the content (and quote) to make sure it's URL-safe
    var encodedContent = Uri.encodeQueryComponent(content);
    var encodedQuote = Uri.encodeQueryComponent(
      'Check out this amazing content: $content',
    );

    // Construct the Facebook share URL
    var facebookShareUrl =
        'https://www.facebook.com/sharer/sharer.php?u=$encodedContent&quote=$encodedQuote';

    await launchUrl(
      Uri.parse(facebookShareUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  static shareToWhatsApp({required String phoneNumber}) async {
    var phoneFormat = phoneNumber.trim().toString()[0] == '+'
        ? phoneNumber.replaceFirst('+', '')
        : phoneNumber.toString()[0] == '0'
        ? phoneNumber.replaceFirst('0', '62')
        : phoneNumber;

    var uriText = Uri.encodeQueryComponent("");

    var launchCall = Uri.parse('https://wa.me/$phoneFormat?text=$uriText');

    await launchUrl(launchCall, mode: LaunchMode.externalApplication);
  }

  static launchGoogleMap({required String lat, required String lng}) async {
    var url = Uri.parse('https://www.google.com/maps/?q=$lat,$lng');

    await launchUrl(url);
  }
}
