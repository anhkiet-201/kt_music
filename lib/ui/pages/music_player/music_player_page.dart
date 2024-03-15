import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/common/extensions/hero_animation_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/global/player/controller/player_controller.dart';
import 'package:kt_course/ui/pages/music_player/controller/music_player_controller.dart';
import 'package:kt_course/ui/widgets/bouncing_tap_wrapper/bouncing_tap_wrapper.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MusicPlayerPage extends StatelessWidget
    with ControllerProvider<MusicPlayerController> {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primaryContainer,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [_player],
        ),
      ),
    );
  }

  Widget get _player => Builder(builder: (context) {
        return SizedBox(
          height: context.height * 0.95,
          width: context.width,
          child: Stack(
            children: [
              Image.network(
                'https://www.forbes.com/advisor/wp-content/uploads/2023/09/how-much-does-a-cat-cost.jpeg-900x510.jpg',
                fit: BoxFit.cover,
                height: (context.height * 0.95) - 1,
                width: context.width,
              ),
              Container(
                height: context.height * 0.95,
                width: context.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black45,
                      Colors.black54,
                      context.color.primaryContainer
                    ])),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox.square(
                            dimension: context.width * 0.7,
                            child: Image.network(
                              'https://www.forbes.com/advisor/wp-content/uploads/2023/09/how-much-does-a-cat-cost.jpeg-900x510.jpg',
                              fit: BoxFit.cover,
                            ).heroTag('avt'),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        _songDescription,
                        _controlBar,
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });

  Widget get _songDescription => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Song name',
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ).heroTag('title'),
                  Text(
                    'Artist',
                    style: context.textTheme.titleSmall?.copyWith(
                        color: context.color.onBackground.withOpacity(0.5)),
                  ).heroTag('artist')
                ],
              ),
              Icon(
                Icons.add_circle_outline_rounded,
                color: context.color.onBackground,
                size: 30,
              )
            ],
          ),
        );
      });

  Widget get _controlBar => Builder(builder: (context) {
        final ctrl = controller(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              StreamBuilder<Duration?>(
                  stream: ctrl.playDuration,
                  builder: (context, snapshot) {
                    final duration =
                        snapshot.data?.inMilliseconds.toDouble() ?? 0.0;
                    return Observer(builder: (context) {
                      final position =
                          ctrl.playPosition?.inMilliseconds.toDouble() ?? 0.0;
                      final parsePosition =
                          position > duration ? duration : position;
                      return Column(
                        children: [
                          Slider(
                            value: parsePosition,
                            onChangeStart: ctrl.onStartSeek,
                            onChanged: ctrl.onSeeking,
                            onChangeEnd: ctrl.onEndSeek,
                            max: duration,
                            inactiveColor: context.color.onPrimaryContainer,
                          ),
                        ],
                      );
                    });
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<bool>(
                    stream: ctrl.playerController.shuffle,
                    builder: (context, snapshot) {
                      final isShuffle = snapshot.data ?? false;
                      return BouncingTapWaraper(
                        child: GestureDetector(
                          onTap: () => ctrl.playerController.setShuffle(!isShuffle),
                          child: Icon(
                            CupertinoIcons.shuffle,
                            color: context.color.onPrimaryContainer.withOpacity(isShuffle ? 1.0 : 0.5),
                          ),
                        ),
                      );
                    }
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SButton(
                          expand: false,
                          style: SButtonStyle.text,
                          child: Icon(
                            Icons.skip_previous_rounded,
                            color: context.color.onPrimaryContainer,
                            size: 40,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Observer(
                              builder: (context) {
                                final state = ctrl.playerController.playState;
                                return SButton(
                                  expand: false,
                                  style: SButtonStyle.text,
                                  onPressed: () {
                                    switch (state) {
                                      case PlayState.playing:
                                        ctrl.playerController.pause();
                                        break;
                                      case PlayState.pause:
                                        ctrl.playerController.play();
                                        break;
                                      default:
                                        break;
                                    }
                                  },
                                  child: Observer(builder: (context) {
                                    switch (state) {
                                      case PlayState.loading:
                                        return LoadingAnimationWidget
                                            .prograssiveDots(
                                                color: context
                                                    .color.onPrimaryContainer,
                                                size: 50);
                                      case PlayState.playing:
                                      case PlayState.pause:
                                        return Icon(
                                          state == PlayState.playing
                                              ? Icons
                                                  .pause_circle_filled_rounded
                                              : Icons.play_circle_fill_rounded,
                                          color:
                                              context.color.onPrimaryContainer,
                                          size: 50,
                                        );
                                      case PlayState.finish:
                                        if (ctrl.playerController.hasNext) {
                                          return LoadingAnimationWidget
                                              .prograssiveDots(
                                                  color: context
                                                      .color.onPrimaryContainer,
                                                  size: 50);
                                        }
                                        return Icon(
                                          Icons.replay_circle_filled_rounded,
                                          color:
                                              context.color.onPrimaryContainer,
                                          size: 50,
                                        );
                                    }
                                  }),
                                );
                              },
                            ),
                          ),
                        ),
                        SButton(
                          expand: false,
                          style: SButtonStyle.text,
                          child: Icon(
                            Icons.skip_next_rounded,
                            color: context.color.onPrimaryContainer,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SButton(
                    expand: false,
                    style: SButtonStyle.text,
                    child: Icon(
                      Icons.loop_rounded,
                      color: context.color.onPrimaryContainer,

                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });

  Widget get _artistInfoCard => Builder(builder: (context) {
        return Container(
          width: context.width * 0.8,
          height: context.width * 0.8,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   image: const DecorationImage(
          //     repeat: ImageRepeat.repeatX,
          //     image: NetworkImage(
          //         'https://images2.thanhnien.vn/528068263637045248/2024/2/22/edit-4286150679644639517026652285924899731173475n-17086083806942052869551.jpeg'),
          //   ),
          // ),
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.black45),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Artist info',
                        style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Artist name',
                                style: context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text('Artist short description',
                                style: context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.7)))
                          ],
                        ),
                        IconButton.outlined(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {},
                            icon: Text(
                              'Follow',
                              style: context.textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ]),
            ),
          ),
        );
      });
}
