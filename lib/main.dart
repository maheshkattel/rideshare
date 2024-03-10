import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ridesharingapp/resources/localizations/getx_Localization.dart';
import 'package:ridesharingapp/resources/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBxGYWdaSWKwQi9A1EX3Fxr9yYpxodrfps',
          appId: '1:194573601609:android:f73f2766bf508618f9a898',
          messagingSenderId: '194573601609',
          projectId: 'rideshare-f288a',
          storageBucket: 'rideshare-f288a.appspot.com'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ride Share by Mahesh Kattel',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en_US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
