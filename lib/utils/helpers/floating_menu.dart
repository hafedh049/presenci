import 'package:floating_action_bubble_custom/floating_action_bubble_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../shared.dart';

class FloatingMenu extends StatefulWidget {
  const FloatingMenu({super.key});

  @override
  State<FloatingMenu> createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu> with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: 300.ms);
    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      animation: _animation,
      onPressed: () => _animationController.isCompleted ? _animationController.reverse() : _animationController.forward(),
      iconColor: blue,
      iconData: FontAwesome.gears_solid,
      backgroundColor: white,
      items: <Widget>[
        BubbleMenu(
          title: 'Add Student',
          iconColor: white,
          bubbleColor: blue,
          icon: Icons.settings,
          onPressed: () => _animationController.reverse(),
          style: GoogleFonts.abel(fontSize: 16, color: white, fontWeight: FontWeight.w500),
        ),
        // Floating action menu item
        BubbleMenu(
          title: 'Confirm',
          iconColor: white,
          bubbleColor: blue,
          icon: Icons.people,
          style: GoogleFonts.abel(fontSize: 16, color: white, fontWeight: FontWeight.w500),
          onPressed: () {
            _animationController.reverse();
          },
        ),
      ],
    );
  }
}
