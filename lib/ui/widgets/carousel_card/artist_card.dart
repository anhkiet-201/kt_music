import 'package:flutter/material.dart';
import 'package:kt_course/common/extensions/context_extensions.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                'https://www.awarenessdays.com/wp-content/uploads/2022/10/iStock-1319479588-1.jpg',
                fit: BoxFit.cover,
                ),
            ),
          ),
          SizedBox(height: 5,),
          Text(
            'Artist name',
            style: context.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}