import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

enum OpenUrlIn {
  browser,
  facebook,
  twitter,
  youtube,
  instagram,
  linkedin,
  telegram,
  google_review,
}

typedef Launched = bool;

abstract class UrlLauncherService {
  Future<Launched> callPhone(String phoneNumber);

  Future<Launched> sendSms(String phoneNumber, {String? body});

  Future<Launched> sendEmail(
    String emailAddress, {
    String? subject,
    String? emailSignature,
  });

  Future<Launched> openUrl(String url);

  Future<Launched> openUrlSocialNetworksApp({
    required String userName,
    required OpenUrlIn openUrlIn,
  });

  Future<Launched> openUrlInNativeApp({
    String? protocolAppUrl,
    String? fallbackWebUrl,
    String? protocolAppUrlAndroid,
    String? protocolAppUrlIos,
  });

  Future<Launched> launchMaps(
    double latitude,
    double longitude, {
    String? label,
  });
}

class UrlLauncherServiceImpl extends UrlLauncherService {
  @override
  Future<Launched> callPhone(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
      query: '',
    );

    if (await canLaunchUrl(phoneLaunchUri)) {
      return launchUrl(phoneLaunchUri);
    } else {
      return false;
    }
  }

  @override
  Future<Launched> sendSms(String phoneNumber, {String? body}) async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent(body ?? ''),
      },
    );
    if (await canLaunchUrl(smsLaunchUri)) {
      return launchUrl(smsLaunchUri);
    } else {
      return false;
    }
  }

  @override
  Future<Launched> sendEmail(
    String emailAddress, {
    String? subject,
    String? body,
    String? emailSignature,
  }) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map(
            (MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query: encodeQueryParameters(<String, String>{
        'subject': subject ?? '',
        'body': '${body ?? ''}\n\n\n\n${emailSignature ?? ''}'
      }),
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      return launchUrl(emailLaunchUri);
    } else {
      return false;
    }
  }

  @override
  Future<Launched> openUrl(String url) async {
    final Uri urlLaunchUri = Uri.parse(url);

    if (await canLaunchUrl(urlLaunchUri)) {
      return launchUrl(
        urlLaunchUri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      return false;
    }
  }

  @override
  Future<Launched> openUrlSocialNetworksApp({
    required String userName,
    required OpenUrlIn openUrlIn,
  }) async {
    Uri? nativeUrlForApp;
    switch (openUrlIn) {
      case OpenUrlIn.facebook:
        if (Platform.isAndroid) {
          nativeUrlForApp = Uri.parse(
            'fb://page/$userName',
          );
        }
        if (Platform.isIOS) {
          nativeUrlForApp = Uri.parse(
            'fb://profile/$userName',
          );
        }
        break;

      case OpenUrlIn.twitter:
        nativeUrlForApp = Uri.parse(
          'Twitter:profile?username=@$userName',
        );
        break;

      case OpenUrlIn.linkedin:
        nativeUrlForApp = Uri.parse(
          'linkedin://company/[$userName]',
        );
        break;

      case OpenUrlIn.telegram:
        nativeUrlForApp = Uri.parse(
          'tg://resolve/?domain=$userName',
        );
        break;

      case OpenUrlIn.youtube:
        nativeUrlForApp = Uri.parse(
          'https://www.youtube.com/user/$userName',
        );
        break;

      default:
    }

    String webUrlForApp = '';
    switch (openUrlIn) {
      case OpenUrlIn.facebook:
        webUrlForApp = 'https://www.facebook.com/$userName';
        break;
      case OpenUrlIn.twitter:
        webUrlForApp = 'https://www.twitter.com/$userName?lang=en';
        break;
      case OpenUrlIn.instagram:
        webUrlForApp = 'https://www.instagram.com/$userName/';
        break;
      case OpenUrlIn.youtube:
        webUrlForApp = 'https://www.youtube.com/user/$userName';
        break;
      case OpenUrlIn.linkedin:
        webUrlForApp = 'https://www.linkedin.com/company/$userName/';
        break;
      case OpenUrlIn.google_review:
        webUrlForApp = 'https://www.g.page/$userName/review?nr';
        break;
      case OpenUrlIn.telegram:
        webUrlForApp = 'https://www.telegram.com/$userName';
        break;
      default:
    }

    try {
      bool launched = false;
      if (nativeUrlForApp != null) {
        launched = await launchUrl(
          nativeUrlForApp,
          // ignore: avoid_redundant_argument_values
          mode: LaunchMode.platformDefault,
        );
      }
      if (!launched) {
        return await openUrl(webUrlForApp);
      }
      return true;
    } catch (e) {
      debugPrint('boom');
      return openUrl(webUrlForApp);
    }
  }

  @override
  Future<Launched> openUrlInNativeApp({
    String? protocolAppUrl,
    String? fallbackWebUrl,
    String? protocolAppUrlAndroid,
    String? protocolAppUrlIos,
  }) async {
    Uri urlLaunchUri = Uri(
      path: Uri.encodeComponent(protocolAppUrl ?? ''),
    );

    if (Platform.isAndroid && protocolAppUrlAndroid != null) {
      urlLaunchUri = Uri.parse(
        protocolAppUrlAndroid,
      );
    }
    if (Platform.isIOS && protocolAppUrlIos != null) {
      urlLaunchUri = Uri.parse(
        protocolAppUrlIos,
      );
    }

    try {
      final bool launched = await launchUrl(
        urlLaunchUri,
        // ignore: avoid_redundant_argument_values
        mode: LaunchMode.platformDefault,
      );

      if (!launched && fallbackWebUrl != null) {
        return await openUrl(fallbackWebUrl);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Launched> launchMaps(
    double latitude,
    double longitude, {
    String? label,
  }) async {
    final urlLaunchUri = createCoordinatesUrl(latitude, longitude, label);

    if (await canLaunchUrl(urlLaunchUri)) {
      return launchUrl(
        urlLaunchUri,
      );
    } else {
      return false;
    }
  }

  /// Returns a URL that can be launched on the current platform
  /// to open a maps application showing coordinates ([latitude] and [longitude]).
  static Uri createCoordinatesUrl(
    double latitude,
    double longitude, [
    String? label,
  ]) {
    Uri uri;

    if (kIsWeb) {
      uri = Uri.https('www.google.com', '/maps/search/', <String, dynamic>{
        'api': '1',
        'query': '$latitude,$longitude',
      });
    } else if (Platform.isAndroid) {
      var query = '$latitude,$longitude';

      if (label != null) query += '($label)';

      uri = Uri(
          scheme: 'geo',
          host: '0,0',
          queryParameters: <String, dynamic>{'q': query},);
    } else if (Platform.isIOS) {
      final params = {
        'll': '$latitude,$longitude',
        'lls': '$latitude,$longitude',
        'daddr': '$latitude,$longitude',
      };

      if (label != null) params['q'] = label;

      uri = Uri.https('maps.apple.com', '/', params);
    } else {
      uri = Uri.https('www.google.com', '/maps/search',
          <String, dynamic>{'api': '1', 'query': '$latitude,$longitude'});
    }

    return uri;
  }
}
