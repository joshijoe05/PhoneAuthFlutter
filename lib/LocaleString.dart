import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'lang': "English",
          'select_lang': "Please select your Language",
          "anytime_change": "You can change the language",
          'anytime': "at any time.",
          'next': "NEXT",
        },
        'hi_IN': {
          'lang': "हिंदी",
          'select_lang': "कृपया अपनी भाषा चुनें",
          "anytime_change": "आप भाषा बदल सकते हैं",
          'anytime': "किसी भी समय ।",
          'next': "अगला",
        },
        'te_IN': {
          'lang': "తెలుగు",
          'select_lang': "దయచేసి మీ భాషను ఎంచుకోండి",
          "anytime_change": "మీరు భాషను మార్చుకోవచ్చు",
          'anytime': "ఎప్పుడైనా",
          'next': "తరువాత",
        }
      };
}
