// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(age) =>
      "${Intl.plural(age, zero: 'лет', one: 'год', few: 'года', other: 'лет')}";

  static String m1(name, surname) =>
      "Вы уверены, что хотите удалить гостя\n${name} ${surname} из списка?";

  static String m2(guests) =>
      "${Intl.plural(guests, zero: 'гостей', one: 'гость', few: 'гостя', other: 'гостей')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "_": MessageLookupByLibrary.simpleMessage("Guests Page"),
        "__": MessageLookupByLibrary.simpleMessage("Wishlist Page"),
        "add_gift": MessageLookupByLibrary.simpleMessage("Добавить подарок"),
        "add_guest": MessageLookupByLibrary.simpleMessage("Записаться"),
        "age": m0,
        "confirm_delete": m1,
        "delete_guest": MessageLookupByLibrary.simpleMessage("Удалить"),
        "edit_guest": MessageLookupByLibrary.simpleMessage("Отредактировать"),
        "gift_link": MessageLookupByLibrary.simpleMessage("Ссылка"),
        "gift_name": MessageLookupByLibrary.simpleMessage("Название"),
        "go_to_site":
            MessageLookupByLibrary.simpleMessage("Перейти на сайт места"),
        "guest_birthday":
            MessageLookupByLibrary.simpleMessage("Дата рождения *"),
        "guest_name": MessageLookupByLibrary.simpleMessage("Имя *"),
        "guest_phone": MessageLookupByLibrary.simpleMessage("Телефон"),
        "guest_profession": MessageLookupByLibrary.simpleMessage("Профессия *"),
        "guest_surname": MessageLookupByLibrary.simpleMessage("Фамилия *"),
        "guestlist": MessageLookupByLibrary.simpleMessage("Список гостей"),
        "guests": m2,
        "header_entertaiments":
            MessageLookupByLibrary.simpleMessage("Развлечения"),
        "header_menu": MessageLookupByLibrary.simpleMessage("Меню"),
        "header_place": MessageLookupByLibrary.simpleMessage("Место"),
        "required_field":
            MessageLookupByLibrary.simpleMessage("Обязательное поле"),
        "sort_by_birthday_asc":
            MessageLookupByLibrary.simpleMessage("По возрасту      ▲"),
        "sort_by_birthday_des":
            MessageLookupByLibrary.simpleMessage("По возрасту      ▼"),
        "sort_by_name_asc":
            MessageLookupByLibrary.simpleMessage("По имени      ▲"),
        "sort_by_name_des":
            MessageLookupByLibrary.simpleMessage("По имени      ▼"),
        "sort_by_registration_asc":
            MessageLookupByLibrary.simpleMessage("По дате регистрации      ▲"),
        "sort_by_registration_des":
            MessageLookupByLibrary.simpleMessage("По дате регистрации      ▼"),
        "sort_by_surname_asc":
            MessageLookupByLibrary.simpleMessage("По фамилии      ▲"),
        "sort_by_surname_des":
            MessageLookupByLibrary.simpleMessage("По фамилии      ▼"),
        "unwrap": MessageLookupByLibrary.simpleMessage("Развернуть ▼"),
        "welcome_text": MessageLookupByLibrary.simpleMessage(
            "Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!"),
        "wishlist": MessageLookupByLibrary.simpleMessage("Вишлист"),
        "wrap": MessageLookupByLibrary.simpleMessage("Свернуть ▲")
      };
}
