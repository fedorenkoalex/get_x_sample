import 'package:get/get.dart';

class AppLocales extends Translations {
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'post_title': 'Title: @postBody',
          'post_description': 'Description: @postDescription',
          'comments': 'Comments:'
        },
        'ru_RU': {
          'post_title': 'Название: @postBody',
          'post_description': 'Описание: @postDescription',
          'comments': 'Коментарии:'
        },
        'uk_UA': {
          'post_title': 'Назва: @postBody',
          'post_description': 'Опис: @postDescription',
          'comments': 'Коментарі:'
        }
      };
}
