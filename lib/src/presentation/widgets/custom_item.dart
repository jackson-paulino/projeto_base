import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/event.dart';
import '../../shared/data_struct/event_data_struct.dart';
import '../../shared/theme/app_colors.dart';
import 'button_expanded.dart';

class CustomItem extends StatelessWidget {
  final Event event;
  const CustomItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final struct = EventDataStruct.fromDataStruct(event);
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), side: const BorderSide(width: 0.2)),
      child: ExpansionTile(
        textColor: AppColors.typeCard,
        title: Padding(
          padding: const EdgeInsets.only(left: 12, top: 2, bottom: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(struct.eventName,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800), maxLines: 3),
              const SizedBox(height: 5),
              AutoSizeText(struct.eventLocal,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textfieldblack),
                  maxLines: 2),
              const SizedBox(height: 3),
              Text(struct.eventDate,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textfieldblack)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textfieldblack),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.local_movies, size: 15.0, color: AppColors.primary),
                        Icon(Icons.attach_money_outlined, size: 21.0, color: AppColors.primary),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(struct.quantitySoldToday,
                              style: const TextStyle(color: AppColors.textfieldblack)),
                          Text(struct.totalSoldToday,
                              style: const TextStyle(color: AppColors.textfieldblack)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(struct.quantitySoldAll,
                              style: const TextStyle(color: AppColors.textfieldblack)),
                          Text(struct.totalSoldAll,
                              style: const TextStyle(color: AppColors.textfieldblack)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        expandedAlignment: Alignment.center,
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
            primary: false,
            padding: const EdgeInsets.all(8),
            children: [
              CustomNavButton('Vendas por Ingresso', routeName: '/ticket/sales', event: struct),
              CustomNavButton('Ponto De Venda', routeName: '/pdvs', event: struct),
              CustomNavButton('Vendas por PDV', routeName: '/sales/pdvs', event: struct),
              CustomNavButton('Vendas diaria PDV', routeName: '/pdv/dates', event: struct),
              CustomNavButton('Vendas por Data', routeName: '/sales/dates', event: struct),
              CustomNavButton('Retiradas PDV', routeName: '/withdrawals/pdvs', event: struct),
              CustomNavButton('Lotes a Venda', routeName: '/lotes/sale', event: struct),
            ],
          )
        ],
      ),
    );
  }
}
