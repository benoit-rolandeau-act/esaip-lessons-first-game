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

class Tr {
  Tr();

  static Tr? _current;

  static Tr get current {
    assert(
      _current != null,
      'No instance of Tr was loaded. Try to initialize the Tr delegate before accessing Tr.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Tr> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Tr();
      Tr._current = instance;

      return instance;
    });
  }

  static Tr of(BuildContext context) {
    final instance = Tr.maybeOf(context);
    assert(
      instance != null,
      'No instance of Tr present in the widget tree. Did you add Tr.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Tr? maybeOf(BuildContext context) {
    return Localizations.of<Tr>(context, Tr);
  }

  /// `My application`
  String get appTitle {
    return Intl.message(
      'My application',
      name: 'appTitle',
      desc: 'This is the title of the application in the home page',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Tr> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Tr> load(Locale locale) => Tr.load(locale);
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
