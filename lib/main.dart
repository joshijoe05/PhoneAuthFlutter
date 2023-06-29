import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phoneauth/LocaleString.dart';
import 'package:phoneauth/pages/language.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      home: Language(),
    );
  }
}
