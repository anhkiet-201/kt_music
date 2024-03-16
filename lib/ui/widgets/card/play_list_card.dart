import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';
import 'package:kt_course/ui/widgets/button/s_button.dart';
import 'package:kt_course/ui/widgets/image/s_image.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SButton(
      style: SButtonStyle.wrapItem,
      child: Stack(
        children: [
          const SizedBox.square(
            dimension: 170,
            child: SImage(
              url: 'https://static.scientificamerican.com/sciam/cache/file/2AE14CDD-1265-470C-9B15F49024186C10_source.jpg?w=1200',
            ),
          ),
          SizedBox(
            width: 170,
            height: 170,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.black38,
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.primaries[
                                Random.secure().nextInt(Colors.primaries.length)]),
                        child: const SizedBox(
                          height: 20,
                          width: 5,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tuyển tập nhạc',
                            style: context.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Mùa xuân',
                            style: context.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.primaries[
                            Random.secure().nextInt(Colors.primaries.length)]),
                    child: const SizedBox(
                      height: 5,
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
