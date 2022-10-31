import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

import '../../shared/utils/extension.dart';
import '../../shared/theme/app_colors.dart';
import '../bloc/home/home_event.dart';
import '../bloc/storage/storage_event.dart';

class FloatingBubble extends StatefulWidget {
  final void Function(bool) onPress;
  const FloatingBubble({Key? key, required this.onPress}) : super(key: key);

  @override
  State<FloatingBubble> createState() => _FloatingBubbleState();
}

class _FloatingBubbleState extends State<FloatingBubble>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool isOpened = false;
  bool boolevent = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var storageBloc = context.storageBloc();
    return FloatingActionBubble(
      items: <Bubble>[
        Bubble(
          title: boolevent ? 'Eventos Ativos' : 'Eventos Passados',
          iconColor: Colors.white,
          bubbleColor: AppColors.primary,
          icon: Icons.low_priority,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
            setState(() {
              if (boolevent == true) {
                boolevent = false;
                widget.onPress(boolevent);
              } else {
                boolevent = true;
                widget.onPress(boolevent);
              }
            });
            isOpened = !isOpened;
          },
        ),
        Bubble(
          title: 'Logout',
          iconColor: Colors.white,
          bubbleColor: AppColors.primary,
          icon: Icons.highlight_off,
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
            storageBloc.add(ClearUserStorageEvent());
            var homeBloc = context.homeBloc();
            homeBloc.add(InitializeHomeEvent());
          },
        ),
      ],
      animation: _animation,
      onPress: () {
        if (!isOpened) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
        isOpened = !isOpened;
      },
      iconColor: Colors.white,
      animatedIconData: AnimatedIcons.menu_arrow,
      backGroundColor: AppColors.primary,
    );
  }
}
