import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:wyb_project/data/data.dart';
import 'package:wyb_project/model/story.dart';
import 'package:wyb_project/model/user.dart';
import 'package:wyb_project/ui/widgets/profile_widget.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget(
      {super.key, required this.user2, required this.pageController});
  final User user2;
  final PageController pageController;

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  String date = '';
  List<StoryItem> storyItems = [];
  StoryController? _storyController;

  @override
  void initState() {
    super.initState();
    _storyController = StoryController();
    addStoryItems();
    date = widget.user2.stories[0].date;
  }

  @override
  void dispose() {
    _storyController?.dispose();
    super.dispose();
  }

  void handleCompleted() {
    widget.pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    final currentIndex = users.indexOf(widget.user2);
    final isLastPage = users.length - 1 == currentIndex;
    if (isLastPage) {
      Navigator.pop(context);
    }
  }

  void addStoryItems() {
    for (final story in widget.user2.stories) {
      switch (story.mediaType) {
        case MediaType.image:
          storyItems.add(StoryItem.pageImage(
              url: story.url,
              controller: _storyController!,
              imageFit: BoxFit.cover,
              duration:
                  Duration(milliseconds: (story.duration * 1000).toInt())));
          break;
        case MediaType.video:
          storyItems.add(StoryItem.pageVideo(story.url,
              controller: _storyController!,
              imageFit: BoxFit.cover,
              duration:
                  Duration(milliseconds: (story.duration * 1000).toInt())));
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          type: MaterialType.transparency,
          child: StoryView(
            storyItems: storyItems,
            controller: _storyController!,
            onComplete: handleCompleted,
            onStoryShow: (storyItem, index) {
              if (index > 0) {
                setState(() {
                  date = widget.user2.stories[index].date;
                });
              }
            },
          ),
        ),
        ProfileWidget(user: widget.user2, date: date),
      ],
    );
  }
}
