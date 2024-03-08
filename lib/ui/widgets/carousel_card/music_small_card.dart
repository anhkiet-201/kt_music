import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kt_course/common/color/color.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';

class MusicSmallCard extends StatelessWidget {
  const MusicSmallCard({super.key, this.image, this.title, this.description});

  final String? image;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: context.color.background.withOpacity(0.5)),
              alignment: Alignment.center,
              child: Text(
                title ?? '',
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          if (image != null && title != null)
            Text(
              title ?? '',
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          const SizedBox(
            height: 5,
          ),
          Text(
            description ?? '',
            maxLines: title == null || image == null ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
