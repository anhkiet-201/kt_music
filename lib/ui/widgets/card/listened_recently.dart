import 'package:flutter/widgets.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/ui/widgets/bouncing_tap_wrapper/bouncing_tap_wrapper.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:kt_course/ui/widgets/image/s_image.dart';

class ListenedRecentlyCard extends StatelessWidget {
  const ListenedRecentlyCard({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return BouncingTapWaraper(
      child: GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 60,
            color: SColors.cardContainer,
            constraints: const BoxConstraints(minWidth: 150, maxWidth: 300),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AspectRatio(
                  aspectRatio: 1,
                  child: SImage(
                    url:
                        'https://static.scientificamerican.com/sciam/cache/file/2AE14CDD-1265-470C-9B15F49024186C10_source.jpg?w=1200',
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: context.textTheme.labelMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
