// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("WeatherApp"),
        "badGateway": MessageLookupByLibrary.simpleMessage("Gateway error"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changeFontSizeTextExample": MessageLookupByLibrary.simpleMessage(
            "This is a text for change the font size"),
        "checkYourInternetConnection": MessageLookupByLibrary.simpleMessage(
            "Check your internet connection"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark theme"),
        "developmentOptions":
            MessageLookupByLibrary.simpleMessage("Development options"),
        "errorOcurred": MessageLookupByLibrary.simpleMessage("Error ocurred"),
        "fontSize": MessageLookupByLibrary.simpleMessage("Font size"),
        "fromApi": MessageLookupByLibrary.simpleMessage("Desde el servidor"),
        "gatewayTimeOut":
            MessageLookupByLibrary.simpleMessage("Gateway time out"),
        "internalServerError":
            MessageLookupByLibrary.simpleMessage("Internal server error"),
        "invalidToken": MessageLookupByLibrary.simpleMessage("Invalid token"),
        "noData": MessageLookupByLibrary.simpleMessage("No data"),
        "nothingFound": MessageLookupByLibrary.simpleMessage("Nothing found"),
        "nullResponseForServer":
            MessageLookupByLibrary.simpleMessage("Null response from server"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("Press again to exit"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "searchCity": MessageLookupByLibrary.simpleMessage("Search city"),
        "serviceUnavailable":
            MessageLookupByLibrary.simpleMessage("Service unavailable"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "tapToRetry": MessageLookupByLibrary.simpleMessage("Tap to retry"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
        "unknownConnectionErrorFromApi":
            MessageLookupByLibrary.simpleMessage("Unknown server error"),
        "version": MessageLookupByLibrary.simpleMessage("Version")
      };
}
