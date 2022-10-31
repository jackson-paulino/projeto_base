import 'package:flutter/material.dart';

import '../../shared/data_struct/pdv_dates_data_struct.dart';

class ContentPdvDates extends StatelessWidget {
  final PdvDatesDataStruct pdvDates;
  const ContentPdvDates({Key? key, required this.pdvDates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return pdvDates.items.isEmpty
        ? Padding(
            padding: EdgeInsets.only(top: size.height * 0.35),
            child: const Center(child: Text('Relatorio sem Dados')))
        : Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: pdvDates.items.length,
                itemBuilder: (context, index) {
                  final data = pdvDates.items[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(data.selledDate,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          const Text('  -  '),
                          Expanded(
                              child: Text(data.ticketType,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))),
                        ],
                      ),
                      const Divider(thickness: 1),
                      Row(
                        children: [
                          const Expanded(
                              child:
                                  Text('Dinheiro', textAlign: TextAlign.left)),
                          Expanded(
                              child: Text(data.dinheiroQuantity,
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child: Text(data.dinheiro,
                                  textAlign: TextAlign.right)),
                        ],
                      ),
                      const Divider(thickness: 1),
                      Row(
                        children: [
                          const Expanded(
                              child: Text('Débito', textAlign: TextAlign.left)),
                          Expanded(
                              child: Text(data.debitoQuantity,
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child: Text(data.debito,
                                  textAlign: TextAlign.right)),
                        ],
                      ),
                      const Divider(thickness: 1),
                      Row(
                        children: [
                          const Expanded(
                              child:
                                  Text('Crédito', textAlign: TextAlign.left)),
                          Expanded(
                              child: Text(data.creditoQuantity,
                                  textAlign: TextAlign.center)),
                          Expanded(
                              child: Text(data.credito,
                                  textAlign: TextAlign.right)),
                        ],
                      ),
                      const Divider(thickness: 1),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'Total',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                              child: Text(
                            data.quantity,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                              child: Text(
                            data.total,
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                      const SizedBox(height: 25)
                    ],
                  );
                },
              ),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Total Geral',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w800))),
              const Divider(thickness: 1),
              Row(
                children: [
                  const Expanded(
                      child: Text('Dinheiro', textAlign: TextAlign.left)),
                  Expanded(
                      child: Text(pdvDates.dinheiroQuantityGeral,
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text(pdvDates.dinheiroGeral,
                          textAlign: TextAlign.right)),
                ],
              ),
              const Divider(thickness: 1),
              Row(
                children: [
                  const Expanded(
                      child: Text('Débito', textAlign: TextAlign.left)),
                  Expanded(
                      child: Text(pdvDates.debitoQuantityGeral,
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text(pdvDates.debitoGeral,
                          textAlign: TextAlign.right)),
                ],
              ),
              const Divider(thickness: 1),
              Row(
                children: [
                  const Expanded(
                      child: Text('Crédito', textAlign: TextAlign.left)),
                  Expanded(
                      child: Text(pdvDates.creditoQuantityGeral,
                          textAlign: TextAlign.center)),
                  Expanded(
                      child: Text(pdvDates.creditoGeral,
                          textAlign: TextAlign.right)),
                ],
              ),
              const Divider(thickness: 1),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    'Total',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    pdvDates.quantityGeral,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    pdvDates.valueGeral,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              const SizedBox(height: 25)
            ],
          );
  }
}
