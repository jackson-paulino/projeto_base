import 'package:flutter/material.dart';

import '../../domain/entities/pdv.dart';
import '../../shared/data_struct/pdvs_data_struct.dart';

class ContentPdvs extends StatelessWidget {
  final List<Pdv> pdvs;
  final Future<void> Function() onRefresh;
  const ContentPdvs({Key? key, required this.pdvs, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: pdvs.isEmpty
          ? const Center(child: Text('Relatorio sem Dados'))
          : ListView(
              padding: const EdgeInsets.all(15),
              children: [
                const Text(
                  'Pontos de Vendas',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: pdvs.length,
                  itemBuilder: (context, index) {
                    final pdv = PdvDataStruct.fromDataStruct(pdvs[index]);
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pdv.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            const Divider(thickness: 1),
                            Text('Logradouro: ${pdv.street}, Nº ${pdv.number}'),
                            const SizedBox(height: 5),
                            Text('Bairro: ${pdv.neighborhood}'),
                            const SizedBox(height: 5),
                            Text('Email: ${pdv.email}'),
                            const SizedBox(height: 5),
                            Text('Contato: ${pdv.phone}'),
                            const SizedBox(height: 5),
                            Text('Responsável: ${pdv.responsable}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
