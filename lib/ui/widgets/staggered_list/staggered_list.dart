import 'package:flutter/material.dart';

class StaggeredList extends StatelessWidget {
  const StaggeredList({
    super.key,
    required this.length,
    this.spacing = 8,
    required this.builder,
    this.padding = const EdgeInsets.all(8),
  });

  final int length;
  final double spacing;
  final Widget Function(int index) builder;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final totalColumn = (length ~/ 3) + (length % 3 > 0 ? 1 : 0);
    final staggeredMap = List.generate(totalColumn, (columnIndex) {
      final countRow = columnIndex < (length ~/ 3) ? 3 : (length % 3);
      return List.generate(countRow, (rowIndex) {
        final index = rowIndex * 3 + columnIndex;
        return builder(index);
      });
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: length == 0 ? EdgeInsets.zero : padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < staggeredMap.length; i++)
            Padding(
              padding: EdgeInsets.only(
                  bottom: i < (staggeredMap.length - 1) ? 10 : 0),
              child: Row(
                children: [
                  for (int j = 0; j < staggeredMap[i].length; j++)
                    Padding(
                      padding: EdgeInsets.only(
                          right: j < (staggeredMap[i].length - 1) ? 10 : 0),
                      child: staggeredMap[i][j],
                    )
                ],
              ),
            )
        ],
      ),
    );
  }
}
