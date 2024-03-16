import 'package:kt_course/common/utils/scroll_physics/snap_scroll_physics.dart';
import 'package:kt_course/core/navigation/navigator.dart' as navigator;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kt_course/app/navigation/navigator_define.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/core/base/controller/controller_provider.dart';
import 'package:kt_course/ui/pages/discover/controller/discover_controller.dart';
import 'package:kt_course/ui/widgets/bouncing_tap_wrapper/bouncing_tap_wrapper.dart';
import 'package:kt_course/ui/widgets/card/listened_recently.dart';
import 'package:kt_course/ui/widgets/card/play_list_card.dart';
import 'package:kt_course/ui/widgets/staggered_list/staggered_list.dart';

class DiscoverPage extends StatelessWidget
    with ControllerProvider<DiscoverController> {
  const DiscoverPage({super.key});

  static final maxPageHeight =
      (navigator.Navigator.globalContext?.height ?? 100) * 0.8;
  static final pageSnapPoint = maxPageHeight * 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            // padding: EdgeInsets.only(top: context.mediaQueryViewPadding.top),
            children: [
              _topBar,
              Expanded(
                child: Observer(builder: (context) {
                  final ctrl = controller(context);
                  return SingleChildScrollView(
                    // physics: ScrollSnappingPhysics(),
                    child: Column(
                      children: [
                        _listenedRecentlyList,
                        _recommendedSection(),
                        _recommendedSection(),
                        _recommendedSection(),
                      ],
                    ),
                  );
                }),
              )
            ]),
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

  Widget get _listenedRecentlyList => Builder(builder: (context) {
        final list = [
          'SG - DJ Snake, Ozuna, Megan Thee Stallion, LISA of BLACKPINK',
          'Love Letter ',
          'Original Sin - Sofi Tukker, Felix Jaehn ',
          'Peru - Fireboy DML',
          'No Choice - Tame Impala',
          'When you feel like this - Hermitude ft. The Jungle Giants',
          'jealousy - FKA twigs ft. Rema',
          'Sweetest Pie - Megan The Stallion, Dua Lipa',
        ];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: StaggeredList(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            length: list.length,
            builder: (index) => ListenedRecentlyCard(title: list[index]),
          ),
        );
      });

  Widget _recommendedSection() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Tuyển tập hàng đầu của bạn',
                style: context.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 10; i++)
                    Padding(
                      padding: EdgeInsets.only(right: i < 9 ? 8 : 0),
                      child: PlayListCard(),
                    )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget get _recommendedCard => Observer(builder: (context) {
        return SizedBox(
          height: DiscoverPage.maxPageHeight,
          child: PageView(
            children: [
              for (int i = 0; i < 10; i++)
                Container(
                  color: Colors.primaries[i],
                  alignment: Alignment.topCenter,
                  child: const Text('da'),
                )
            ],
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
                  child: ListenedRecentlyCard(
                    title: '',
                  ),
                ),
              )
          ]),
        );
      });

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
}
