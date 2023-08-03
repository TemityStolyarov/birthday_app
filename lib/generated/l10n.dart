// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  // skipped getter for the '' key

  /// `Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!`
  String get welcome_text {
    return Intl.message(
      'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
      name: 'welcome_text',
      desc: '',
      args: [],
    );
  }

  /// `Меню`
  String get header_menu {
    return Intl.message(
      'Меню',
      name: 'header_menu',
      desc: '',
      args: [],
    );
  }

  /// `Развлечения`
  String get header_entertaiments {
    return Intl.message(
      'Развлечения',
      name: 'header_entertaiments',
      desc: '',
      args: [],
    );
  }

  /// `Место`
  String get header_place {
    return Intl.message(
      'Место',
      name: 'header_place',
      desc: '',
      args: [],
    );
  }

  /// `Свернуть ▲`
  String get wrap {
    return Intl.message(
      'Свернуть ▲',
      name: 'wrap',
      desc: '',
      args: [],
    );
  }

  /// `Развернуть ▼`
  String get unwrap {
    return Intl.message(
      'Развернуть ▼',
      name: 'unwrap',
      desc: '',
      args: [],
    );
  }

  /// `Перейти на сайт места`
  String get go_to_site {
    return Intl.message(
      'Перейти на сайт места',
      name: 'go_to_site',
      desc: '',
      args: [],
    );
  }

  /// `Guests Page`
  String get _ {
    return Intl.message(
      'Guests Page',
      name: '_',
      desc: '',
      args: [],
    );
  }

  /// `{guests, plural, zero{гостей} one{гость} few{гостя} other{гостей}}`
  String guests(num guests) {
    return Intl.plural(
      guests,
      zero: 'гостей',
      one: 'гость',
      few: 'гостя',
      other: 'гостей',
      name: 'guests',
      desc: '',
      args: [guests],
    );
  }

  /// `Список гостей`
  String get guestlist {
    return Intl.message(
      'Список гостей',
      name: 'guestlist',
      desc: '',
      args: [],
    );
  }

  /// `Имя *`
  String get guest_name {
    return Intl.message(
      'Имя *',
      name: 'guest_name',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия *`
  String get guest_surname {
    return Intl.message(
      'Фамилия *',
      name: 'guest_surname',
      desc: '',
      args: [],
    );
  }

  /// `Дата рождения *`
  String get guest_birthday {
    return Intl.message(
      'Дата рождения *',
      name: 'guest_birthday',
      desc: '',
      args: [],
    );
  }

  /// `Телефон`
  String get guest_phone {
    return Intl.message(
      'Телефон',
      name: 'guest_phone',
      desc: '',
      args: [],
    );
  }

  /// `Профессия *`
  String get guest_profession {
    return Intl.message(
      'Профессия *',
      name: 'guest_profession',
      desc: '',
      args: [],
    );
  }

  /// `Записаться`
  String get add_guest {
    return Intl.message(
      'Записаться',
      name: 'add_guest',
      desc: '',
      args: [],
    );
  }

  /// `По имени      ▲`
  String get sort_by_name_asc {
    return Intl.message(
      'По имени      ▲',
      name: 'sort_by_name_asc',
      desc: '',
      args: [],
    );
  }

  /// `По фамилии      ▲`
  String get sort_by_surname_asc {
    return Intl.message(
      'По фамилии      ▲',
      name: 'sort_by_surname_asc',
      desc: '',
      args: [],
    );
  }

  /// `По дате регистрации      ▲`
  String get sort_by_registration_asc {
    return Intl.message(
      'По дате регистрации      ▲',
      name: 'sort_by_registration_asc',
      desc: '',
      args: [],
    );
  }

  /// `По возрасту      ▲`
  String get sort_by_birthday_asc {
    return Intl.message(
      'По возрасту      ▲',
      name: 'sort_by_birthday_asc',
      desc: '',
      args: [],
    );
  }

  /// `По имени      ▼`
  String get sort_by_name_des {
    return Intl.message(
      'По имени      ▼',
      name: 'sort_by_name_des',
      desc: '',
      args: [],
    );
  }

  /// `По фамилии      ▼`
  String get sort_by_surname_des {
    return Intl.message(
      'По фамилии      ▼',
      name: 'sort_by_surname_des',
      desc: '',
      args: [],
    );
  }

  /// `По дате регистрации      ▼`
  String get sort_by_registration_des {
    return Intl.message(
      'По дате регистрации      ▼',
      name: 'sort_by_registration_des',
      desc: '',
      args: [],
    );
  }

  /// `По возрасту      ▼`
  String get sort_by_birthday_des {
    return Intl.message(
      'По возрасту      ▼',
      name: 'sort_by_birthday_des',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist Page`
  String get __ {
    return Intl.message(
      'Wishlist Page',
      name: '__',
      desc: '',
      args: [],
    );
  }

  /// `Вишлист`
  String get wishlist {
    return Intl.message(
      'Вишлист',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get gift_name {
    return Intl.message(
      'Название',
      name: 'gift_name',
      desc: '',
      args: [],
    );
  }

  /// `Ссылка`
  String get gift_link {
    return Intl.message(
      'Ссылка',
      name: 'gift_link',
      desc: '',
      args: [],
    );
  }

  /// `Добавить подарок`
  String get add_gift {
    return Intl.message(
      'Добавить подарок',
      name: 'add_gift',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
