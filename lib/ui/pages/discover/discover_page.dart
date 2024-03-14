import 'package:flutter/material.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/discover/controller/discover_controller.dart';
import 'package:kt_course/ui/widgets/bouncing_tap_wrapper/bouncing_tap_wrapper.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:kt_course/ui/widgets/carousel_card/artist_card.dart';
import 'package:kt_course/ui/widgets/carousel_card/music_small_card.dart';

class DiscoverPage extends StatelessWidget
    with ControllerProvider<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // padding: EdgeInsets.only(top: context.mediaQueryViewPadding.top),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: context.mediaQueryViewPadding.top + 84,
            flexibleSpace: SafeArea(child: _topBar),
          ),
          SliverToBoxAdapter(
            child: SButton(child: Text('Palyer'), onPressed: () => nav.toMusicPlayer(),),
          )
        ]
      ),
    );
  }

  Widget get _topBar => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: context.color.primary,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      'A',
                      style: context.textTheme.headlineSmall?.copyWith(
                          color: context.color.background,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...TopbarOption.values.map((item) {
                            return _buildTopbarButton(item);
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });

  Widget _buildTopbarButton(TopbarOption option) => Builder(builder: (context) {
        final ctr = controller(context);
        return BouncingTapWaraper(
          child: GestureDetector(
            onTap: () {
              ctr.selectOption(option);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: ctr.selectedOption == option
                      ? context.color.primary
                      : null,
                  borderRadius: BorderRadius.circular(25),
                  border: ctr.selectedOption != option
                      ? Border.all(
                          color: context.color.outline.withOpacity(0.5),
                          width: 2,
                        )
                      : null),
              child: Text(
                option.title,
                style: context.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ctr.selectedOption == option
                      ? context.color.background
                      : context.color.onBackground,
                ),
              ),
            ),
          ),
        );
      });

  ///

  Widget get _horizontalList => Builder(builder: (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (int i = 0; i < 10; i++)
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () => nav.toMusicPlayer(),
                  child: MusicSmallCard(
                    image:
                        'https://www.awarenessdays.com/wp-content/uploads/2022/10/iStock-1319479588-1.jpg',
                    title: 'Title',
                    description:
                        'Tận hưởng âm nhạc chất lượng cao 320kbps miễn phí với hàng triệu bài hát mới, playlist nhạc HOT, bảng xếp hạng',
                  ),
                ),
              )
          ]),
        );
      });

  Widget get _favoriteArtist => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            for (int i = 0; i < 10; i++)
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: ArtistCard(),
              )
          ],
        ),
      );

  Widget get _categories => Builder(builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [for (int i = 0; i < 10; i++) _categoryItem],
          ),
        );
      });

  Widget get _categoryItem => Builder(builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: context.color.background.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: const Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      });

  /// Mark the special text by %/text%
  Widget _label(String text) => Builder(builder: (context) {
        final buildText = text.split('%');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text.rich(
            TextSpan(
                children: buildText
                    .map((e) => TextSpan(
                        text: e.replaceFirst('/', ''),
                        style: e.startsWith('/')
                            ? TextStyle(color: context.color.primary)
                            : null))
                    .toList()),
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        );
      });

  Widget get _recommendedCard => Builder(builder: (context) {
        return Container(
            height: context.height -
                (kBottomNavigationBarHeight +
                    context.mediaQueryViewPadding.top +
                    18),
            width: context.width,
            color: Colors.amber);
      });
}
