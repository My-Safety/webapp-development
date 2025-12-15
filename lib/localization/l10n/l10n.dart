import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
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
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

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
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @mysafety_web.
  ///
  /// In en, this message translates to:
  /// **'mysafety_web'**
  String get mysafety_web;

  /// No description provided for @please_enter_dob.
  ///
  /// In en, this message translates to:
  /// **'Please enter DOB'**
  String get please_enter_dob;

  /// No description provided for @invalid_date_format_use_DD_MM_YYYY.
  ///
  /// In en, this message translates to:
  /// **'Invalid Date Format! Use DD/MM/YYYY'**
  String get invalid_date_format_use_DD_MM_YYYY;

  /// No description provided for @age_should_be_18_or_above.
  ///
  /// In en, this message translates to:
  /// **'Age should be 18 or above'**
  String get age_should_be_18_or_above;

  /// No description provided for @please_enter_your_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get please_enter_your_name;

  /// No description provided for @please_enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get please_enter_phone_number;

  /// No description provided for @phone_number_not_valid.
  ///
  /// In en, this message translates to:
  /// **'Phone number not valid'**
  String get phone_number_not_valid;

  /// No description provided for @please_enter_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter email'**
  String get please_enter_email;

  /// No description provided for @not_a_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Not a valid email'**
  String get not_a_valid_email;

  /// No description provided for @please_enter.
  ///
  /// In en, this message translates to:
  /// **'Please enter'**
  String get please_enter;

  /// No description provided for @minimum_eigth_characters.
  ///
  /// In en, this message translates to:
  /// **'Minimum 8 characters'**
  String get minimum_eigth_characters;

  /// No description provided for @at_least_one_uppercase_letter.
  ///
  /// In en, this message translates to:
  /// **'At least one uppercase letter'**
  String get at_least_one_uppercase_letter;

  /// No description provided for @at_least_one_lowercase_letter.
  ///
  /// In en, this message translates to:
  /// **'At least one lowercase letter'**
  String get at_least_one_lowercase_letter;

  /// No description provided for @at_least_one_digit.
  ///
  /// In en, this message translates to:
  /// **'At least one digit'**
  String get at_least_one_digit;

  /// No description provided for @at_least_one_special_character.
  ///
  /// In en, this message translates to:
  /// **'At least one special character (e.g. !@#%)'**
  String get at_least_one_special_character;

  /// No description provided for @no_whitespace_allowed.
  ///
  /// In en, this message translates to:
  /// **'No whitespace allowed'**
  String get no_whitespace_allowed;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get something_went_wrong;

  /// No description provided for @oops_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Oops something went wrong'**
  String get oops_something_went_wrong;

  /// No description provided for @but_dont_worry.
  ///
  /// In en, this message translates to:
  /// **'But don\'t worry - it\'s not your fault.'**
  String get but_dont_worry;

  /// No description provided for @are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are your sure?'**
  String get are_you_sure;

  /// No description provided for @are_you_sure_you_want_to_exit.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit?'**
  String get are_you_sure_you_want_to_exit;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @safety_with_a_touch_of.
  ///
  /// In en, this message translates to:
  /// **'Safety with a touch of'**
  String get safety_with_a_touch_of;

  /// No description provided for @comfort.
  ///
  /// In en, this message translates to:
  /// **'comfort'**
  String get comfort;

  /// No description provided for @enter_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get enter_mobile_number;

  /// No description provided for @register_login_to_mysafety_web.
  ///
  /// In en, this message translates to:
  /// **'Register / Login to mysafety_web'**
  String get register_login_to_mysafety_web;

  /// No description provided for @your_information_is_secure_protected.
  ///
  /// In en, this message translates to:
  /// **'Your information is secure & protected'**
  String get your_information_is_secure_protected;

  /// No description provided for @i_understand_and_accept_the_terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'I understand and accept the Terms & Conditions.'**
  String get i_understand_and_accept_the_terms_conditions;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @enter_otp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get enter_otp;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @add_your_details.
  ///
  /// In en, this message translates to:
  /// **'Add your details'**
  String get add_your_details;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @write_your_name.
  ///
  /// In en, this message translates to:
  /// **'Write your name'**
  String get write_your_name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @write_your_email.
  ///
  /// In en, this message translates to:
  /// **'Write your email'**
  String get write_your_email;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @fetching_your_location.
  ///
  /// In en, this message translates to:
  /// **'Fetching your location...'**
  String get fetching_your_location;

  /// No description provided for @add_address_details.
  ///
  /// In en, this message translates to:
  /// **'Add Address details'**
  String get add_address_details;

  /// No description provided for @full_address.
  ///
  /// In en, this message translates to:
  /// **'Full Address*'**
  String get full_address;

  /// No description provided for @please_add_your_full_address.
  ///
  /// In en, this message translates to:
  /// **'Please add your full address'**
  String get please_add_your_full_address;

  /// No description provided for @pincode.
  ///
  /// In en, this message translates to:
  /// **'Pincode*'**
  String get pincode;

  /// No description provided for @landmark.
  ///
  /// In en, this message translates to:
  /// **'landmark*'**
  String get landmark;

  /// No description provided for @select_language.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get select_language;

  /// No description provided for @international_language.
  ///
  /// In en, this message translates to:
  /// **'International language'**
  String get international_language;

  /// No description provided for @regional_language.
  ///
  /// In en, this message translates to:
  /// **'Regional language'**
  String get regional_language;

  /// No description provided for @na.
  ///
  /// In en, this message translates to:
  /// **'NA'**
  String get na;

  /// No description provided for @welcome_to_mysafety_web.
  ///
  /// In en, this message translates to:
  /// **'Welcome to mysafety_web!'**
  String get welcome_to_mysafety_web;

  /// No description provided for @vehicle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get vehicle;

  /// No description provided for @doorbell.
  ///
  /// In en, this message translates to:
  /// **'Doorbell'**
  String get doorbell;

  /// No description provided for @smartcard.
  ///
  /// In en, this message translates to:
  /// **'Smartcard'**
  String get smartcard;

  /// No description provided for @lost_and_found.
  ///
  /// In en, this message translates to:
  /// **'Lost & Found'**
  String get lost_and_found;

  /// No description provided for @kind_of_emergency_situation.
  ///
  /// In en, this message translates to:
  /// **'Kind Of Emergency Situation?'**
  String get kind_of_emergency_situation;

  /// No description provided for @get_instant_help_in_emergencies.
  ///
  /// In en, this message translates to:
  /// **'Get instant help in emergencies'**
  String get get_instant_help_in_emergencies;

  /// No description provided for @experience_the_best_without_limits.
  ///
  /// In en, this message translates to:
  /// **'Experience the Best, Without Limits'**
  String get experience_the_best_without_limits;

  /// No description provided for @join_premium.
  ///
  /// In en, this message translates to:
  /// **'Join Premium'**
  String get join_premium;

  /// No description provided for @unlock_the_full_potential.
  ///
  /// In en, this message translates to:
  /// **'— Unlock the Full Potential'**
  String get unlock_the_full_potential;

  /// No description provided for @get_a_subscription.
  ///
  /// In en, this message translates to:
  /// **'Get a Subscription'**
  String get get_a_subscription;

  /// No description provided for @document_vault.
  ///
  /// In en, this message translates to:
  /// **'Document Vault'**
  String get document_vault;

  /// No description provided for @uploaded.
  ///
  /// In en, this message translates to:
  /// **'uploaded'**
  String get uploaded;

  /// No description provided for @rc.
  ///
  /// In en, this message translates to:
  /// **'RC'**
  String get rc;

  /// No description provided for @insurance.
  ///
  /// In en, this message translates to:
  /// **'Insurance'**
  String get insurance;

  /// No description provided for @driving_license.
  ///
  /// In en, this message translates to:
  /// **'Driving license'**
  String get driving_license;

  /// No description provided for @link_digiLocker.
  ///
  /// In en, this message translates to:
  /// **'Link DigiLocker'**
  String get link_digiLocker;

  /// No description provided for @add_document.
  ///
  /// In en, this message translates to:
  /// **'Add document'**
  String get add_document;

  /// No description provided for @pan_card.
  ///
  /// In en, this message translates to:
  /// **'PAN Card'**
  String get pan_card;

  /// No description provided for @aadhar_card.
  ///
  /// In en, this message translates to:
  /// **'Aadhar Card'**
  String get aadhar_card;

  /// No description provided for @health_insurance.
  ///
  /// In en, this message translates to:
  /// **'Health Insurance'**
  String get health_insurance;

  /// No description provided for @search_location.
  ///
  /// In en, this message translates to:
  /// **'Search location'**
  String get search_location;

  /// No description provided for @no_location_found.
  ///
  /// In en, this message translates to:
  /// **'No location found'**
  String get no_location_found;

  /// No description provided for @pollution.
  ///
  /// In en, this message translates to:
  /// **'Pollution'**
  String get pollution;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @current_address_not_available.
  ///
  /// In en, this message translates to:
  /// **'current address not available'**
  String get current_address_not_available;

  /// No description provided for @house_flat_block_no.
  ///
  /// In en, this message translates to:
  /// **'house flat block no'**
  String get house_flat_block_no;

  /// No description provided for @apartment_road_area_optional.
  ///
  /// In en, this message translates to:
  /// **'apartment road area optional'**
  String get apartment_road_area_optional;

  /// No description provided for @please_enter_house_number.
  ///
  /// In en, this message translates to:
  /// **'please enter house number'**
  String get please_enter_house_number;

  /// No description provided for @confirm_location.
  ///
  /// In en, this message translates to:
  /// **'confirm location'**
  String get confirm_location;

  /// No description provided for @please_enter_house_name.
  ///
  /// In en, this message translates to:
  /// **'please enter house_name'**
  String get please_enter_house_name;

  /// No description provided for @add_family_member.
  ///
  /// In en, this message translates to:
  /// **'Add Family Member'**
  String get add_family_member;

  /// No description provided for @mobile_no.
  ///
  /// In en, this message translates to:
  /// **'Mobile No.'**
  String get mobile_no;

  /// No description provided for @write_your_mobile_no.
  ///
  /// In en, this message translates to:
  /// **'Write your mobile no'**
  String get write_your_mobile_no;

  /// No description provided for @no_data_found.
  ///
  /// In en, this message translates to:
  /// **'No Data Found'**
  String get no_data_found;

  /// No description provided for @add_driver.
  ///
  /// In en, this message translates to:
  /// **'Add Driver'**
  String get add_driver;

  /// No description provided for @upload_file.
  ///
  /// In en, this message translates to:
  /// **'Upload file'**
  String get upload_file;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'empty'**
  String get empty;

  /// No description provided for @small.
  ///
  /// In en, this message translates to:
  /// **'small'**
  String get small;

  /// No description provided for @driving_license_upload.
  ///
  /// In en, this message translates to:
  /// **'Driving Upload License'**
  String get driving_license_upload;

  /// No description provided for @no_driver_data.
  ///
  /// In en, this message translates to:
  /// **'No driver\'s data available'**
  String get no_driver_data;

  /// No description provided for @no_family_data.
  ///
  /// In en, this message translates to:
  /// **'No family\'s data available'**
  String get no_family_data;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @upload_profile_image.
  ///
  /// In en, this message translates to:
  /// **'Upload Profile Image'**
  String get upload_profile_image;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
