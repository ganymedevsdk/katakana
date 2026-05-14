import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Katakana App'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In es, this message translates to:
  /// **'Configuración'**
  String get settings;

  /// No description provided for @katakanaTable.
  ///
  /// In es, this message translates to:
  /// **'Tabla Katakana'**
  String get katakanaTable;

  /// No description provided for @practice.
  ///
  /// In es, this message translates to:
  /// **'Práctica'**
  String get practice;

  /// No description provided for @quiz.
  ///
  /// In es, this message translates to:
  /// **'Quiz'**
  String get quiz;

  /// No description provided for @progress.
  ///
  /// In es, this message translates to:
  /// **'Progreso'**
  String get progress;

  /// No description provided for @language.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get language;

  /// No description provided for @spanish.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get spanish;

  /// No description provided for @english.
  ///
  /// In es, this message translates to:
  /// **'Inglés'**
  String get english;

  /// No description provided for @dailyStreak.
  ///
  /// In es, this message translates to:
  /// **'Racha diaria'**
  String get dailyStreak;

  /// No description provided for @level.
  ///
  /// In es, this message translates to:
  /// **'Nivel'**
  String get level;

  /// No description provided for @xp.
  ///
  /// In es, this message translates to:
  /// **'XP'**
  String get xp;

  /// No description provided for @correct.
  ///
  /// In es, this message translates to:
  /// **'¡Correcto!'**
  String get correct;

  /// No description provided for @tryAgain.
  ///
  /// In es, this message translates to:
  /// **'Intenta de nuevo'**
  String get tryAgain;

  /// No description provided for @start.
  ///
  /// In es, this message translates to:
  /// **'Comenzar'**
  String get start;

  /// No description provided for @next.
  ///
  /// In es, this message translates to:
  /// **'Siguiente'**
  String get next;

  /// No description provided for @finish.
  ///
  /// In es, this message translates to:
  /// **'Terminar'**
  String get finish;

  /// No description provided for @score.
  ///
  /// In es, this message translates to:
  /// **'Puntuación'**
  String get score;

  /// No description provided for @bestScore.
  ///
  /// In es, this message translates to:
  /// **'Mejor puntuación'**
  String get bestScore;

  /// No description provided for @characters.
  ///
  /// In es, this message translates to:
  /// **'Caracteres'**
  String get characters;

  /// No description provided for @difficult.
  ///
  /// In es, this message translates to:
  /// **'Difíciles'**
  String get difficult;

  /// No description provided for @mastered.
  ///
  /// In es, this message translates to:
  /// **'Dominados'**
  String get mastered;

  /// No description provided for @basicKatakana.
  ///
  /// In es, this message translates to:
  /// **'Katakana Básico'**
  String get basicKatakana;

  /// No description provided for @dakuten.
  ///
  /// In es, this message translates to:
  /// **'Dakuten'**
  String get dakuten;

  /// No description provided for @handakuten.
  ///
  /// In es, this message translates to:
  /// **'Handakuten'**
  String get handakuten;

  /// No description provided for @combinations.
  ///
  /// In es, this message translates to:
  /// **'Combinaciones'**
  String get combinations;

  /// No description provided for @writeMode.
  ///
  /// In es, this message translates to:
  /// **'Modo Escritura'**
  String get writeMode;

  /// No description provided for @drawCharacter.
  ///
  /// In es, this message translates to:
  /// **'Dibuja el carácter'**
  String get drawCharacter;

  /// No description provided for @verify.
  ///
  /// In es, this message translates to:
  /// **'Verificar'**
  String get verify;

  /// No description provided for @clear.
  ///
  /// In es, this message translates to:
  /// **'Limpiar'**
  String get clear;

  /// No description provided for @selectRomaji.
  ///
  /// In es, this message translates to:
  /// **'Selecciona el romaji correcto'**
  String get selectRomaji;

  /// No description provided for @typeRomaji.
  ///
  /// In es, this message translates to:
  /// **'Escribe el romaji'**
  String get typeRomaji;

  /// No description provided for @speedRun.
  ///
  /// In es, this message translates to:
  /// **'Contrarreloj'**
  String get speedRun;

  /// No description provided for @multipleChoice.
  ///
  /// In es, this message translates to:
  /// **'Opción Múltiple'**
  String get multipleChoice;

  /// No description provided for @reverse.
  ///
  /// In es, this message translates to:
  /// **'Modo Inverso'**
  String get reverse;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
