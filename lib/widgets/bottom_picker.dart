import 'package:bottom_options_picker/models/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPicker extends StatelessWidget {
  const BottomPicker({
    super.key,
    required this.options,
    required this.value,
    required this.onSelected,
    this.title,
  });

  final List<ListItem> options;
  final String value;
  final Function(ListItem) onSelected;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
          ),
          child: Text(
            title ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 350,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 40,
            scrollController: FixedExtentScrollController(
              initialItem: options.indexOf(
                options.firstWhere(
                  (element) => element.value == value,
                ),
              ),
            ),
            onSelectedItemChanged: (int index) {
              onSelected(
                options[index],
              );
            },
            children: options
                .map(
                  (option) => Center(
                    child: Text(
                      option.label,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
