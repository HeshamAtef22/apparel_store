
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class AdsManager {

  static bool testmode = true;
  //اعلان البانر
  static String get bannerAdUnitId {
    if (testmode == true) {
      return  'ca-app-pub-3940256099942544/6300978111'; //test id
    }else if (Platform.isAndroid) {
      return 'ca-app-pub-4436938000995718/5501751846';  //android ads id
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';  // test ios ads id
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  //اعلان فيديو بمكافأة
  static String get rewardedAdUnitId {
    if (testmode == true) {
      return 'ca-app-pub-3940256099942544/5224354917'; //test id
    }else if (Platform.isAndroid) {
      return 'ca-app-pub-4436938000995718/2584261690';  //android ads id
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';  // test ios ads id
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  }

