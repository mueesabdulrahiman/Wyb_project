import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wyb_project/data/data.dart';
import 'package:wyb_project/model/user.dart';
import 'package:wyb_project/ui/widgets/story_widget.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, required this.user});
  final User user;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  PageController _avatarPageController = PageController(viewportFraction: 0.2);
  int currentIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    currentIndex = users.indexOf(widget.user);
    _pageController = PageController(initialPage: currentIndex);
    _avatarPageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.2,
    );

    // Initialize animation controller for avatar animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Trigger the animation for the current avatar when the story screen starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _avatarPageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    _avatarPageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return AlignTransition(
                alignment: _animationController.drive(AlignmentTween(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: child,
              );
            },
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: users.map((user2) {
                return StoryWidget(
                    user2: user2, pageController: _pageController!);
              }).toList(),
            ),
          ),

          // Blur and gradient effect
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBlurEffect(),
          ),

          // Avatar bar at the bottom center
          Positioned(
            bottom: MediaQuery.of(context).size.height / 10,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildAvatarBar(),
            ),
          ),
        ],
      ),
    );
  }

  // Function to create the blur effect and gradient
  Widget _buildBlurEffect() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.0, 0.6],
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.0),
            // Colors.transparent,
          ],
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.black.withOpacity(0),
          ),
        ),
      ),
    );
  }

  // Avatar Bar
  Widget _buildAvatarBar() {
    return SizedBox(
      height: 120,
      child: PageView.builder(
        controller: _avatarPageController,
        itemCount: users.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final user = users[index];
          final isCurrentUser = currentIndex == index;

          return Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                // Calculate the scale based on whether it's the current avatar
                double scale =
                    isCurrentUser ? 1 + _animationController.value * 0.2 : 1.0;
                double textScale = isCurrentUser ? scale : 1.0;

                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.scale(
                        scale: scale,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: isCurrentUser ? 80 : 60,
                          height: isCurrentUser ? 80 : 60,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: isCurrentUser
                                ? const LinearGradient(
                                    colors: [
                                      Colors.pink,
                                      Colors.purple,
                                      Colors.blue,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            border: Border.all(
                              color: isCurrentUser
                                  ? Colors.transparent
                                  : Colors.transparent,
                              width: 4,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: isCurrentUser ? 40 : 30,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                CachedNetworkImageProvider(user.imgUrl),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                          fontSize: isCurrentUser ? 14 * textScale : 12,
                          color: Colors.white,
                        )),
                        child: Text(
                          user.name,
                          style: GoogleFonts.getFont('Lato'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
