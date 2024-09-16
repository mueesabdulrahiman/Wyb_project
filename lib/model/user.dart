import 'package:wyb_project/model/story.dart';

class User {
  final String name;
  final String imgUrl;
  final List<Story> stories;
  User({required this.name, required this.imgUrl, required this.stories});
}
