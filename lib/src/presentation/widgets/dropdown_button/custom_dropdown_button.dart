import 'package:flutter/material.dart';

import 'custom_dropdown_button_item.dart';
import 'utils/custom_bottom_sheet.dart';

class CustomDropDownButton extends StatefulWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;
  final String hint;
  final String label;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final String? value;
  final TextStyle? valueTextStyle;
  final IconData icon;
  final String hintSearch;
  final bool filter;
  final List<CustomDropDownButtonItem> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropDownButton({
    Key? key,
    this.padding,
    this.margin,
    this.height,
    this.filter = true,
    required this.hint,
    this.hintTextStyle,
    this.value = '',
    this.valueTextStyle,
    required this.icon,
    required this.hintSearch,
    required this.items,
    this.onChanged,
    required this.label,
    this.labelTextStyle,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  void _setSelectedItem(String? value) {
    setState(() => _selectedValue = value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    for (var element in widget.items) {
      element.callback = (value) {
        setState(() {
          _setSelectedItem(value);
          Navigator.pop(context);
        });
      };
    }

    final bottomSheet = CustomBottomSheet(
      iconButtonClose: false,
      contents: [
        _CustomSearchComponent(
          items: widget.items,
          hintSearch: widget.hintSearch,
        ),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC6C7CD)),
      ),
      width: width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_selectedValue != '') _showItemSelected() else _showHint(),
            Icon(widget.icon, color: const Color(0xFF57595F), size: 30),
          ],
        ),
        onTap: () {
          bottomSheet.show(context);
        },
      ),
    );
  }

  Widget _showHint() {
    return Text(
      widget.hint,
      style: widget.hintTextStyle,
    );
  }

  Widget _showItemSelected() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: Color(0xFF57595F),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            _selectedValue!,
            style: widget.valueTextStyle,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _CustomSearchComponent extends StatefulWidget {
  final List<CustomDropDownButtonItem> items;
  final String hintSearch;
  late String? filter;

  _CustomSearchComponent({
    Key? key,
    required this.items,
    required this.hintSearch,
    // ignore: unused_element
    this.filter = '',
  }) : super(key: key);

  @override
  State<_CustomSearchComponent> createState() => _CustomSearchComponentState();
}

class _CustomSearchComponentState extends State<_CustomSearchComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFC6C7CD))),
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: const Color(0xFFC6C7CD)),
                    ),
                    padding: const EdgeInsets.only(left: 12, top: 5, bottom: 5),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(borderSide: BorderSide.none),
                        hintText: widget.hintSearch,
                        hintStyle: const TextStyle(fontSize: 20),
                      ),
                      style: const TextStyle(fontSize: 20),
                      onChanged: (value) {
                        setState(() {
                          widget.filter = value;
                        });
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    widget.filter = '';
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF57595F),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: widget.filter!.isEmpty
                    ? widget.items
                    : widget.items.where((element) {
                        return element.text.data!
                                .toUpperCase()
                                .contains(widget.filter!.toUpperCase()) ||
                            element.alwaysShowInSearch;
                      }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
