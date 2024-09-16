import 'package:flutter/material.dart';

enum MediaType { image, video }

class Story {
  final MediaType mediaType;
  final String url;
  final String date;
  final double duration;
  final Color colour;

  Story(
      {required this.mediaType,
      required this.url,
      required this.date,
      this.duration = 5.0,
      this.colour = Colors.grey});
}
