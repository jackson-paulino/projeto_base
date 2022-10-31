import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDownButtonItem extends StatelessWidget {
  final Text text;
  final bool alwaysShowInSearch;
  late Function() callSelect;
  late Function(String value)? callback;

  CustomDropDownButtonItem({
    Key? key,
    required this.text,
    this.alwaysShowInSearch = false,
    required this.callSelect,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE9EAEC),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        width: MediaQuery.of(context).size.width,
        child: text,
      ),
      onTap: () {
        callSelect();
        if (callback != null) callback!(text.data!);
      },
    );
  }
}
