import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// *Please enter the correct email
  ///
  /// In en, this message translates to:
  /// **'*Please enter the correct email'**
  String get errorEmail;

  /// *Please enter the correct password
  ///
  /// In en, this message translates to:
  /// **'*Please enter the correct password'**
  String get errorPassword;

  /// * Please enter a valid name
  ///
  /// In en, this message translates to:
  /// **'*Please enter a valid name'**
  String get errorName;

  /// Please accept the terms and conditions.
  ///
  /// In en, this message translates to:
  /// **'Please accept the terms and conditions.'**
  String get errorCondition;

  /// Check your parameter
  ///
  /// In en, this message translates to:
  /// **'Check your parameter'**
  String get errorParameter;

  /// Payment session is still in progress
  ///
  /// In en, this message translates to:
  /// **'Payment session is still in progress'**
  String get snackBar_1;

  /// Payment pending ..
  ///
  /// In en, this message translates to:
  /// **'Payment pending ..'**
  String get snackBar_2;

  /// Payment approved.
  ///
  /// In en, this message translates to:
  /// **'Payment approved.'**
  String get snackBar_3;

  /// Text Total
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalText;

  /// Text Code
  ///
  /// In en, this message translates to:
  /// **'+  Add'**
  String get addPlusText;

  /// Text Code
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get codeText;

  /// Text SAR
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get sarText;

  /// Product Details
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetails;

  /// Shipping details and terms
  ///
  /// In en, this message translates to:
  /// **'Shipping details and terms'**
  String get commandDetails;

  /// We made it easy for you
  ///
  /// In en, this message translates to:
  /// **'Easier'**
  String get easyText;

  /// Delivery is now available
  ///
  /// In en, this message translates to:
  /// **'Delivery is now available'**
  String get deliveryText;

  /// Coffee
  ///
  /// In en, this message translates to:
  /// **'Coffee'**
  String get coffeeText;

  /// The finest coffee
  ///
  /// In en, this message translates to:
  /// **'The finest coffee'**
  String get coffeeType;

  /// text Chooses
  ///
  /// In en, this message translates to:
  /// **'Suggest'**
  String get chooses;

  /// text Popular
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// text Dessert And Drink
  ///
  /// In en, this message translates to:
  /// **'Dessert And Drink'**
  String get dessertAndDrink;

  /// text Food
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get foodText;

  /// Add New Address
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addAddressCommand;

  /// Address
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addressCommand;

  /// text Green Banner 1
  ///
  /// In en, this message translates to:
  /// **'Can we lure you?'**
  String get textGreenBanner_1;

  /// text Green Banner 2
  ///
  /// In en, this message translates to:
  /// **'Spend another 100.00 SAR to get free delivery'**
  String get textGreenBanner_2;

  /// Skip Text
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipText;

  /// I agree to the terms and conditions
  ///
  /// In en, this message translates to:
  /// **'I agree to the terms and conditions'**
  String get condition;

  /// Don't have an account? Create an account
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Create an account'**
  String get registerText;

  /// Register
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Login
  ///
  /// In en, this message translates to:
  /// **'You have an account? sign in'**
  String get loginText;

  /// Login
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get login;

  /// Welcome To
  ///
  /// In en, this message translates to:
  /// **'Stay Connected ?'**
  String get remember;

  /// Register At
  ///
  /// In en, this message translates to:
  /// **'Register At'**
  String get registerIn;

  /// Welcome To
  ///
  /// In en, this message translates to:
  /// **'Welcome To'**
  String get welcome;

  /// contains a character. contains a number. 8 characters minimum
  ///
  /// In en, this message translates to:
  /// **'Contains a character. contains a number. 8 characters minimum'**
  String get passwordText;

  /// Confirmed New Password
  ///
  /// In en, this message translates to:
  /// **'Confirmed New Password'**
  String get passwordNewConfirmed;

  /// New Password
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get passwordNew;

  /// Last Password
  ///
  /// In en, this message translates to:
  /// **'Last Password'**
  String get passwordOld;

  /// Password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Confirm Password
  ///
  /// In en, this message translates to:
  /// **'confirm Password'**
  String get confirmPassword;

  /// Card CVV
  ///
  /// In en, this message translates to:
  /// **'Card CVV'**
  String get cardCvv;

  /// Card Validation
  ///
  /// In en, this message translates to:
  /// **'Card Validation'**
  String get cardValidation;

  /// Card Number
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cartNumber;

  /// Name Cart Owner
  ///
  /// In en, this message translates to:
  /// **'Name Card Owner'**
  String get nameCardOwner;

  /// Complete Payment
  ///
  /// In en, this message translates to:
  /// **'Complete Payment'**
  String get paymentCt;

  /// Your request is being processed, please wait...
  ///
  /// In en, this message translates to:
  /// **'Your request is being processed, please wait...'**
  String get paymentPending;

  /// Country Text
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// Address Text
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Add Text
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addText;

  /// Update Text
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateText;

  /// Add To Cart Text
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get addToCart;

  /// Remove From Cart Text
  ///
  /// In en, this message translates to:
  /// **'Remove From Cart'**
  String get removeFromCart;

  /// Filter Text
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// Sort Text
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// Search Text Hint Field
  ///
  /// In en, this message translates to:
  /// **'  Find food and coffee...'**
  String get search;

  /// Button Text Send
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Full Name
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// Societe Name
  ///
  /// In en, this message translates to:
  /// **'Societe'**
  String get societe;

  /// First Name
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// First Name
  ///
  /// In en, this message translates to:
  /// **'Family Name'**
  String get familyName;

  /// Email Address
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Phone Number
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// Message
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// City
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Area
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// Item Menu More
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get itemMenuMore_1;

  /// Item Menu More
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get itemMenuMore_2;

  /// Item Menu More
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get itemMenuMore_3;

  /// Item List More
  ///
  /// In en, this message translates to:
  /// **'About Urth Caffe'**
  String get itemListMore_1;

  /// Item List More
  ///
  /// In en, this message translates to:
  /// **'Organic Coffee'**
  String get itemListMore_2;

  /// Item List More
  ///
  /// In en, this message translates to:
  /// **'Fine Teas'**
  String get itemListMore_3;

  /// Item List More
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get itemListMore_4;

  /// Item List More
  ///
  /// In en, this message translates to:
  /// **'Common Questions'**
  String get itemListMore_5;

  /// Item List More
  ///
  /// In en, this message translates to:
  /// **'Connect With Us'**
  String get itemListMore_6;

  /// Bottom Navigation Module Name
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Bottom Navigation Module Name
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// Bottom Navigation Module Name
  ///
  /// In en, this message translates to:
  /// **'Basket'**
  String get basket;

  /// Bottom Navigation Module Name
  ///
  /// In en, this message translates to:
  /// **'Gifts'**
  String get gifts;

  /// Bottom Navigation Module Name
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Select Store
  ///
  /// In en, this message translates to:
  /// **'Choose Store'**
  String get store;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
