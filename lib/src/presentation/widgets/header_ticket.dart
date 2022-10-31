import 'package:flutter/material.dart';

import '../../shared/data_struct/tickets_data_struct.dart';
import '../../shared/theme/app_colors.dart';

class HeaderTicket extends StatelessWidget {
  final TicketsDataStruct swing;
  const HeaderTicket({Key? key, required this.swing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(swing.name),
                  Text(
                    swing.type,
                    style: const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.typeTicket,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Text(
                swing.payment,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
        const Divider(thickness: 1)
      ],
    );
  }
}
