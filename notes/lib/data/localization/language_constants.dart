import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:khadematy/data/localization/localization.dart';
// import 'package:khadematy/main.dart';

const String langageCode = 'languageCode';

const String french = 'fr';
const String arabic = 'ar';

Future<Locale> setLocale(String languageCode) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: langageCode, value: languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  const storage = FlutterSecureStorage();
  String languageCode = await storage.read(key: langageCode) ?? "ca";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case french:
      return const Locale(french, 'CA');
    case arabic:
      return const Locale(arabic, 'SA');

    default:
      return const Locale(french, 'CA');
  }
}

// String translate(BuildContext context, String key) {
//   if (Localization.of(context)!.gettranslate(key) != null) {
//     return Localization.of(context)!.gettranslate(key)!;
//   } else {
//     return key;
//   }
// }

// void changeLanguage(BuildContext context, String? language) async {
//   Locale _locale = await setLocale(language!);
//   MyApp.setLocale(context, _locale);
// }
