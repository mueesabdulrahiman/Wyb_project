import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isHighlighted;

  const StoryAvatar({
    super.key,
    required this.imageUrl,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundImage: NetworkImage(imageUrl),
      backgroundColor: isHighlighted ? Colors.blue : Colors.transparent,
    );
  }
}
