import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kt_course/common/firebase_options.dart';
import 'package:kt_course/core/data/local/hive_storage/local_storage.dart';
import 'package:kt_course/core/data/local/impl/local_starage_impl.dart';
import 'package:kt_course/core/firebase/fire_auth/fire_auth.dart';
import 'package:kt_course/core/firebase/fire_storage/fire_storage_query.dart';
import 'package:kt_course/core/firebase/fire_store/fire_store_query.dart';
import 'package:kt_course/core/navigation/navigator.dart';
import 'package:kt_course/app/navigation/navigator_impl.dart';
import 'package:kt_course/core/reactive/setting_value/repository/setting_value_repository.dart';
import 'package:kt_course/core/reactive/setting_value/repository/setting_value_repository_impl.dart';
import 'package:kt_course/global/app/controller/app_controller.dart';
import 'package:kt_course/global/app/repository/app_repository.dart';
import 'package:kt_course/global/app/repository/app_repository_impl.dart';
import 'package:kt_course/global/app_links/controller/app_links_controller.dart';
import 'package:kt_course/global/auth/controller/auth_controller.dart';
import 'package:kt_course/global/auth/repository/auth_repository.dart';
import 'package:kt_course/global/auth/repository/auth_repository_impl.dart';
import 'package:kt_course/global/player/controller/player_controller.dart';
import 'package:kt_course/global/settings/controller/settings_controller.dart';
import 'package:kt_course/global/settings/repository/settings_repository.dart';
import 'package:kt_course/global/settings/repository/settings_repository_impl.dart';
import 'package:kt_course/global/tabbar/controller/tab_bar_controller.dart';

final injector = Injector();

class Injector {
  final _getIt = GetIt.I;

  initialize() async {
    await _initializeEnv();
    await _initializeFirebase();
    _injectRepository();
    _injectNavigator();
    _injectGlobalController();
    await _injectLocalStorage();
    await _injectServices();
  }

  _initializeEnv() async {
    await dotenv.load(fileName: ".env");
  }

  _initializeFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  _injectServices() async {
    _getIt.registerLazySingleton<FirebaseFireAuth>(() => FirebaseFireAuth());
    _getIt.registerLazySingleton<FirebaseFireStoreQuery>(
        () => FirebaseFireStoreQuery());
    _getIt.registerLazySingleton<FirebaseFireStorageQuery>(
        () => FirebaseFireStorageQuery());
  }

  _injectRepository() {
    _getIt.registerLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
    _getIt.registerLazySingleton<AppRepository>(AppRepositoryImpl.new);
    _getIt.registerLazySingleton<SettingValueRepository>(
        SettingValueRepositoryImpl.new);
    _getIt
        .registerLazySingleton<SettingsRepository>(SettingsRepositoryImpl.new);
  }

  _injectNavigator() {
    _getIt.registerLazySingleton<Navigator>(NavigatorImpl.new);
  }

  _injectGlobalController() {
    _getIt.registerLazySingleton<AppController>(AppController.new);
    _getIt.registerLazySingleton<AuthController>(AuthController.new);
    _getIt.registerLazySingleton<TabBarController>(TabBarController.new);
    _getIt.registerLazySingleton<SettingsController>(SettingsController.new);
    _getIt.registerSingleton<PlayerController>(PlayerController());
    _getIt.registerSingleton<AppLinksController>(AppLinksController());
  }

  _injectLocalStorage() async {
    // Initialize hive storage, an implementation of LocalStogare
    await Hive.initFlutter();

    // Register adapter
    // Hive.registerAdapter(UserAdapter());

    // Open boxes
    await Hive.openBox(LocalStorage.defaultBox);
    await Hive.openBox(LocalStorage.settingsBox);
    // Todo: implement secure encryption by storing a random to keychain/keystore
    String encryptedKey = 'Wr1fM3XHtIefLX8JKGJfPNiHdaWiNZspbml6NJeJkTk=';
    await Hive.openBox(LocalStorage.secureBox,
        encryptionCipher: HiveAesCipher(base64Decode(encryptedKey)));

    await Hive.openBox<String>(LocalStorage.tokenBox,
        encryptionCipher: HiveAesCipher(base64Decode(encryptedKey)));

    // Inject an implementation of LocalStogare
    _getIt.registerSingleton<LocalStorage>(LocalStorageImpl());
  }

  T get<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }
}
