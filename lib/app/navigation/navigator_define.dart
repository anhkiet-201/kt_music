import 'package:kt_course/core/di/Injector.dart';
import 'package:kt_course/core/navigation/navigator.dart';
import 'package:kt_course/core/reactive/setting_value/controller/setting_value.dart';
import 'package:kt_course/global/auth/auth_controller_provider.dart';
import 'package:kt_course/ui/pages/artist_access/artist_access_page.dart';
import 'package:kt_course/ui/pages/artist_access/controller/artist_access_controller.dart';
import 'package:kt_course/ui/pages/home/controller/home_controller.dart';
import 'package:kt_course/ui/pages/home/home_page.dart';
import 'package:kt_course/ui/pages/music_player/controller/music_player_controller.dart';
import 'package:kt_course/ui/pages/music_player/music_player_page.dart';
import 'package:kt_course/ui/pages/onboarding/controller/onboarding_controller.dart';
import 'package:kt_course/ui/pages/onboarding/onboarding_page.dart';
import 'package:kt_course/ui/pages/profile/controller/profile_controller.dart';
import 'package:kt_course/ui/pages/profile/profile_page.dart';
import 'package:kt_course/ui/pages/settings/settings_page.dart';
import 'package:kt_course/ui/widgets/artist_register/artist_register.dart';
import 'package:kt_course/ui/widgets/artist_register/controller/artist_register_controller.dart';
import 'package:kt_course/ui/widgets/custom_video_player/controller/custom_video_player_controller.dart';
import 'package:kt_course/ui/widgets/custom_video_player/custom_video_player_full_screen.dart';
import 'package:kt_course/ui/widgets/input_email_reset/controller/input_email_reset_controller.dart';
import 'package:kt_course/ui/widgets/input_email_reset/input_email_reset.dart';
import 'package:kt_course/ui/widgets/reset_password/controller/reset_password_controller.dart';
import 'package:kt_course/ui/widgets/reset_password/reset_password.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/controller/setting_options_sheet_controller.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/setting_options_sheet.dart';
import 'package:kt_course/ui/widgets/settings/bottom_sheet/settings_options_sheet_item.dart';
import 'package:kt_course/ui/widgets/sign_in/controller/sign_in_controller.dart';
import 'package:kt_course/ui/widgets/sign_in/sign_in.dart';
import 'package:kt_course/ui/widgets/sign_up/controller/sign_up_controller.dart';
import 'package:kt_course/ui/widgets/sign_up/sign_up.dart';
import 'package:provider/provider.dart';

// Creating an instance of the NavigationDefine class and assigning it to the variable nav
final nav = NavigationDefine();

// Defining the NavigationDefine class
class NavigationDefine with AuthControllerProvider {
  // Creating a final variable to hold the Navigator instance obtained from the dependency injector
  final _navigator = injector.get<Navigator>();

  // Method to show a snack bar, with optional message and error parameters
  showSnackBar({String? message, dynamic error}) =>
      _navigator.showSnackBar(message: message, error: error);

  pop({Object? result}) {
    return _navigator.pop(result: result);
  }

  toOnBoading() {
    _navigator.push(
      Provider(
        create: (_) => OnboardingController(),
        child: const OnboardingPage(),
      ),
      type: PushType.replaceAll,
    );
  }

  toHome() {
    _navigator.push(
      Provider(
        create: (_) => HomeController(),
        child: const HomePage(),
      ),
      type: PushType.replaceAll,
    );
  }

  toSignUp() {
    _navigator.push(
      Provider(
        create: (_) => SignUpController(),
        child: const SignUp(),
      ),
    );
  }

  toSignIn() {
    _navigator.showBottomSheet(
        Provider(
          create: (_) => SignInController(),
          child: const SignIn(),
        ),
        title: 'Đăng nhập');
  }

  toResetPassword({
    required String oobCode,
    required String apiKey,
    String? lang,
  }) {
    _navigator.showBottomSheet(
      Provider(
        create: (_) => ResetPasswordController(
          oobCode: oobCode,
          apiKey: apiKey,
        ),
        child: const ResetPassword(),
      ),
    );
  }

  toSendEmailReset() {
    _navigator.showBottomSheet(
        Provider(
          create: (_) => InputEmailResetController(),
          child: const InputEmailReset(),
        ),
        title: 'Quên mật khẩu');
  }

  toArtistRegister() {
    _navigator.showBottomSheet(
      Provider(
        create: (_) => ArtistRegisterController(),
        child: ArtistRegister(),
      ),
      title: 'Artist Register',
    );
  }

  toArtistAccess() {
    _navigator.push(
      Provider(
        create: (_) => ArtistAccessController(),
        child: const ArtistAccessPage(),
      ),
    );
  }

  toSettings() {
    _navigator.push(const SettingsPage(),
        animationType: NavigatorAnimationType.fade);
  }

  toSettingOptionsSelectSheet<T>(
      {required SettingValue<T> settingValue,
      required List<SettingOptionsSelectSheetItem> items,
      Function(T)? onChangeCallBack,
      String? title}) {
    _navigator.showBottomSheet(
        Provider(
          create: (_) => SettingOptionsSheetController<T>(
              settingValue: settingValue,
              items: items,
              onChangeCallBack: onChangeCallBack),
          child: SettingOptionsSelectSheet<T>(),
        ),
        title: title,
        initialChildSize: 0.5,
        maxChildSize: 0.5);
  }

  enterVideoPlayerFullScreenMode(CustomVideoPlayerController controller) {
    _navigator.push(CustomVideoPlayerFullScreen(controller));
  }

  toMusicPlayer() {
    _navigator.push(Provider(
      create: (_) => MusicPlayerController(),
      child: const MusicPlayerPage(),
    ));
  }

  toProfile() {
    _navigator.push(
      Provider(
        create: (_) => ProfileController(),
        child: const ProfilePage(),
      )
    );
  }
}
