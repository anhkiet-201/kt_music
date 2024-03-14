import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:kt_course/app/app.dart';
import 'package:kt_course/core/di/Injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await JustAudioBackground.init(
    androidNotificationChannelName: 'kt_app',
    androidNotificationOngoing: true,
    androidStopForegroundOnPause: true,
  );
  await injector.initialize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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