import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/global/player/controller/player_controller.dart';
import 'package:kt_course/global/player/player_controller_provider.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:text_scroll/text_scroll.dart';

class MiniPlayerControl extends StatelessWidget with PlayerControllerProvider {
  const MiniPlayerControl({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int?>(
        stream: playerController.currentIndexAudio,
        builder: (context, snapshot) {
          final index = snapshot.data;
          return AnimatedOpacity(
            opacity: index == null ? 0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: IgnorePointer(
              ignoring: index == null,
              child: SafeArea(
                child: SButton(
                  style: SButtonStyle.normal,
                  onPressed: () {
                    nav.toMusicPlayer();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    height: 62,
                    width: context.width,
                    decoration: BoxDecoration(
                      color: context.color.inversePrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              _buildAudioCover(),
                              _buildSongInfo(context),
                              _buildAddButton(context),
                              _buildPlayButton(),
                            ],
                          ),
                        ),
                        _buildSliderBar()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Expanded _buildSongInfo(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextScroll(
              'To use this package, add text_scroll asd.     ',
              mode: TextScrollMode.endless,
              pauseBetween: const Duration(seconds: 3),
              style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.color.onBackground),
              textAlign: TextAlign.right,
              fadedBorder: true,
              fadedBorderWidth: 0.05,
            ).heroTag('title'),
            TextScroll(
              'To use this package, add text_scroll asd.     ',
              mode: TextScrollMode.endless,
              pauseBetween: const Duration(seconds: 3),
              style: context.textTheme.labelMedium?.copyWith(
                  color: context.color.onBackground.withOpacity(0.5)),
              textAlign: TextAlign.right,
              fadedBorder: true,
              fadedBorderWidth: 0.05,
            ).heroTag('artist')
          ],
        ),
      ),
    );
  }

  GestureDetector _buildAddButton(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.add_circle_outline_rounded,
          color: context.color.onBackground,
        ),
      ),
    );
  }

  Observer _buildPlayButton() {
    return Observer(builder: (context) {
      final state = playerController.playState;
      return GestureDetector(
        onTap: () {
          switch (state) {
            case PlayState.playing:
              playerController.pause();
              break;
            case PlayState.pause:
              playerController.play();
              break;
            default:
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (_) {
            switch (state) {
              case PlayState.loading:
                return LoadingAnimationWidget.prograssiveDots(
                    color: context.color.onBackground, size: 24);
              case PlayState.playing:
              case PlayState.pause:
                return Icon(
                  state == PlayState.playing
                      ? Icons.pause_circle_filled_rounded
                      : Icons.play_circle_fill_rounded,
                  color: context.color.onBackground,
                  size: 24,
                );
              case PlayState.finish:
                if (playerController.hasNext) {
                  return LoadingAnimationWidget.prograssiveDots(
                      color: context.color.onBackground, size: 24);
                }
                return Icon(
                  Icons.replay_circle_filled_rounded,
                  color: context.color.onBackground,
                  size: 24,
                );
            }
          }),
        ),
      );
    });
  }

  ClipRRect _buildAudioCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox.square(
        dimension: 44,
        child: Image.network(
          'https://www.forbes.com/advisor/wp-content/uploads/2023/09/how-much-does-a-cat-cost.jpeg-900x510.jpg',
          fit: BoxFit.cover,
        ).heroTag('avt'),
      ),
    );
  }

  Padding _buildSliderBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: StreamBuilder<Duration?>(
          stream: playerController.duration,
          builder: (context, snapshot) {
            final duration = snapshot.data?.inMilliseconds.toDouble() ?? 0.0;
            return StreamBuilder<Duration>(
                stream: playerController.position,
                builder: (context, snapshot) {
                  final position =
                      snapshot.data?.inMilliseconds.toDouble() ?? 0.0;
                  final parsePosition =
                      position > duration ? duration : position;
                  final progress =
                      duration == 0.0 ? 0.0 : parsePosition / duration;
                  return SizedBox(
                    height: 2,
                    width: (context.width - 50) * progress,
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(color: context.color.onBackground),
                    ),
                  );
                });
          }),
    );
  }
}
