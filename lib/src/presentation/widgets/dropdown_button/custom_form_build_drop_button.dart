import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'custom_dropdown_button.dart';
import 'custom_dropdown_button_item.dart';

class CustomFormDropButton<T> extends FormBuilderField<T> {
  final EdgeInsets? padding;
  final double? height;
  final String hint;
  final TextStyle? hintTextStyle;
  final String label;
  final TextStyle? labelTextStyle;
  final TextStyle? valueTextStyle;
  final IconData icon;
  final String? value;
  final String hintSearch;
  final Function(String?)? onPress;
  final List<CustomDropDownButtonItem> items;

  CustomFormDropButton({
    required this.label,
    this.labelTextStyle,
    Key? key,
    required String name,
    this.value = '',
    this.onPress,
    FormFieldValidator<T>? validator,
    this.padding,
    this.height,
    required this.hint,
    this.hintTextStyle,
    this.valueTextStyle,
    required this.icon,
    required this.hintSearch,
    required this.items,
  }) : super(
          key: key,
          name: name,
          validator: validator,
          builder: (FormFieldState<T?> field) {
            final state = field as _FormBuilderDropdownState<T>;

            void changeValue(T? value) {
              state.requestFocus();
              state.didChange(value);
            }

            return Column(
              children: [
                CustomDropDownButton(
                  padding: padding,
                  height: height,
                  hint: hint,
                  label: label,
                  labelTextStyle: labelTextStyle,
                  value: value,
                  hintTextStyle: hintTextStyle,
                  valueTextStyle: valueTextStyle,
                  icon: icon,
                  hintSearch: hintSearch,
                  items: items,
                  onChanged: state.enabled
                      ? (value) {
                          changeValue(value as T);
                          onPress!(value);
                        }
                      : null,
                ),
                if (field.errorText != null)
                  Container(
                    margin: const EdgeInsets.only(
                      left: 16.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${field.errorText}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 20),
              ],
            );
          },
        );
  @override
  // ignore: library_private_types_in_public_api
  _FormBuilderDropdownState<T> createState() => _FormBuilderDropdownState<T>();
}

class _FormBuilderDropdownState<T> extends FormBuilderFieldState<CustomFormDropButton<T>, T> {}
