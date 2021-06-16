import 'package:get/get.dart';
import 'package:test_getx/locales/locale_en.dart';

import 'locale_ru.dart';
import 'locale_ua.dart';

class AppLocales extends Translations {
  Map<String, Map<String, String>> get keys => {
        LocaleEn.langKey: LocaleEn.translations,
        LocaleRu.langKey: LocaleRu.translations,
        LocaleUa.langKey: LocaleUa.translations
      };
}
