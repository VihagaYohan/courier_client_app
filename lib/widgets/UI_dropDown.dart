import 'package:flutter/material.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';
import 'package:flutter/widgets.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class UIDropDown extends StatefulWidget {
  final String placeholderText;
  final List<String> optionList;

  const UIDropDown(
      {super.key, required this.placeholderText, required this.optionList});

  @override
  State<UIDropDown> createState() => _UIDropDownState();
}

class _UIDropDownState extends State<UIDropDown> {
  static const List<String> list = <String>["Express", "Standard"];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    Color backgroundColor =
        Brightness.dark == brightness ? AppColors.dark : AppColors.white;

    return DropdownButtonFormField(
      value: dropdownValue,
      hint: UITextView(
        text: widget.placeholderText,
        textStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.optionList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: UITextView(
              text: value,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 12),
            ));
      }).toList(),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      icon: const Icon(Icons.expand_more),
      dropdownColor: backgroundColor,
      elevation: 1,
      padding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
