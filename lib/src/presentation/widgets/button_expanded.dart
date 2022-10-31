import 'package:flutter/material.dart';

import '../../shared/data_struct/event_data_struct.dart';
import '../../shared/theme/app_colors.dart';

class CustomNavButton extends StatelessWidget {
  final String name;
  final String routeName;
  final EventDataStruct event;
  const CustomNavButton(this.name, {Key? key, required this.routeName, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, routeName, arguments: event),
      style: ElevatedButton.styleFrom(
        primary: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(name),
    );
  }
}
