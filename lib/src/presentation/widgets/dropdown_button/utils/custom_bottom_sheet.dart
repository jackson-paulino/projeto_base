import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final bool iconButtonClose;
  final bool keyboardOption;
  final List<Widget> contents;

  const CustomBottomSheet({
    Key? key,
    this.iconButtonClose = true,
    this.keyboardOption = false,
    required this.contents,
  }) : super(key: key);

  Future<void> show(BuildContext context) async {
    return showModalBottomSheet(
      backgroundColor: const Color(0x00000000),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => _contentsBottomSheet(context),
    );
  }

  Widget _contentsBottomSheet(BuildContext context) {
    return Theme(
      data: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0x00000000),
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color(0x00000000),
        bottomSheet: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Wrap(
            children: [
              if (iconButtonClose)
                IconButton(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 10, top: 12),
                  key: const Key('icon_button_modal'),
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF2047E0),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    if (!iconButtonClose) const SizedBox(height: 30),
                    ...contents,
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
