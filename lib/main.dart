import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:kt_course/app/app.dart';
import 'package:kt_course/core/di/Injector.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await injector.initialize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await JustAudioBackground.init(
    androidNotificationChannelName: 'kt_app',
    androidNotificationOngoing: true,
    androidStopForegroundOnPause: true,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('vi', 'VN')
        ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const App()
    )
  );
}