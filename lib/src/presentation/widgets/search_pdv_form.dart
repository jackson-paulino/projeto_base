import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../shared/data_struct/event_data_struct.dart';
import '../../shared/data_struct/pdvs_data_struct.dart';
import '../../shared/utils/extension.dart';
import '../bloc/pdvs/pdvs_bloc.dart';
import '../bloc/pdvs/pdvs_event.dart';
import '../bloc/pdvs/pdvs_state.dart';
import 'dropdown_button/custom_dropdown_button_item.dart';
import 'dropdown_button/custom_form_build_drop_button.dart';
import 'form_text_field/form/custom_form.dart';

class SearchPdvForm extends StatefulWidget {
  final EventDataStruct event;
  final Function(String value) select;
  const SearchPdvForm({Key? key, required this.event, required this.select}) : super(key: key);

  @override
  State<SearchPdvForm> createState() => _SearchPdvFormState();
}

class _SearchPdvFormState extends State<SearchPdvForm> {
  bool isvalid = false;

  CustomDropDownButtonItem _itemRanger({
    required String name,
    required Function() callSelect,
  }) {
    return CustomDropDownButtonItem(
      text: Text(
        name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      callSelect: callSelect,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final bloc = context.pdvsBloc();
    return BlocBuilder<PdvsBloc, PdvsState>(
      bloc: bloc,
      builder: (context, pdvsState) {
        if (pdvsState is PdvsInitialState) {
          bloc.add(FeatchPdvsEvent(widget.event.eventId));
        } else if (pdvsState is PdvsFailureState) {
          return Center(child: Text(pdvsState.errorException.message));
        } else if (pdvsState is PdvsFinishedState) {
          if (pdvsState.eventId == widget.event.eventId) {
            return CustomForm(
              autovalidateMode: AutovalidateMode.disabled,
              builder: (
                BuildContext context,
                Map<String, dynamic> Function() getValidatedFormState,
              ) =>
                  CustomFormDropButton(
                name: 'DropDownButton',
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 56,
                hint: 'Selecione o Pdv',
                label: 'Pdv do Evento',
                validator: FormBuilderValidators.required(
                  errorText: 'Selecione o Pdv!',
                ),
                valueTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                onPress: (_) => setState(() => isvalid = getValidatedFormState()['isValid']),
                icon: Icons.keyboard_arrow_down_rounded,
                hintSearch: 'Pesquisar renda',
                items: pdvsState.pdvs.map((e) {
                  final pdv = PdvDataStruct.fromDataStruct(e);
                  return _itemRanger(
                    name: pdv.placeOfEstablishment,
                    callSelect: () => widget.select(pdv.id),
                  );
                }).toList(),
              ),
            );
          } else {
            bloc.add(FeatchPdvsEvent(widget.event.eventId));
            return Padding(
                padding: EdgeInsets.only(top: size.height * 0.35),
                child: const Center(child: CircularProgressIndicator()));
          }
        }
        return Padding(
            padding: EdgeInsets.only(top: size.height * 0.35),
            child: const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
