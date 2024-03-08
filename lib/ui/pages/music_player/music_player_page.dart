import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/global/player/player_controller_provider.dart';
import 'package:kt_course/ui/pages/music_player/controller/music_player_controller.dart';

class MusicPlayerPage extends StatelessWidget
    with ControllerProvider<MusicPlayerController>,
    PlayerControllerProvider{
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primaryContainer,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [_player, _artistInfoCard],
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
                            ),
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
                  ),
                  Text(
                    'Artist',
                    style: context.textTheme.titleSmall?.copyWith(
                        color: context.color.onBackground.withOpacity(0.5)),
                  )
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Slider(value: 0.5, onChanged: (_) {}),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shuffle_rounded,
                    color: context.color.onPrimaryContainer,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.skip_previous_rounded,
                        color: context.color.onPrimaryContainer,
                        size: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          playerController.play(playlist: [
                            ClippingAudioSource(
                              start: const Duration(seconds: 60),
                              end: const Duration(seconds: 90),
                              child: AudioSource.uri(Uri.parse(
                                  "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")
                                ),
                                tag: MediaItem(
                                    // Specify a unique ID for each media item:
                                    id: '2',
                                    // Metadata to display in the notification:
                                    album: "Album name",
                                    title: "Song name",
                                    artUri: Uri.parse(
                                        'https://www.forbes.com/advisor/wp-content/uploads/2023/09/how-much-does-a-cat-cost.jpeg-900x510.jpg')
                                  ),
                            ),
                            ClippingAudioSource(
                              start: const Duration(seconds: 60),
                              end: const Duration(seconds: 90),
                              child: AudioSource.uri(Uri.parse(
                                  "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")),
                              tag: MediaItem(
                                  // Specify a unique ID for each media item:
                                  id: '1',
                                  // Metadata to display in the notification:
                                  album: "Album name",
                                  title: "Song name",
                                  artUri: Uri.parse(
                                      'https://www.forbes.com/advisor/wp-content/uploads/2023/09/how-much-does-a-cat-cost.jpeg-900x510.jpg')),
                            ),
                          ]);
                        },
                        child: Icon(
                          Icons.play_circle_fill_rounded,
                          color: context.color.onPrimaryContainer,
                          size: 50,
                        ),
                      ),
                      Icon(
                        Icons.skip_next_rounded,
                        color: context.color.onPrimaryContainer,
                        size: 40,
                      )
                    ],
                  )),
                  Icon(
                    Icons.timer_outlined,
                    color: context.color.onBackground,
                  )
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              repeat: ImageRepeat.repeatX,
              image: NetworkImage(
                  'https://images2.thanhnien.vn/528068263637045248/2024/2/22/edit-4286150679644639517026652285924899731173475n-17086083806942052869551.jpeg'),
            ),
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.black45),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
