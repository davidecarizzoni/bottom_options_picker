import 'package:bottom_options_picker/models/list_item.dart';
import 'package:bottom_options_picker/widgets/bottom_picker.dart';
import 'package:bottom_options_picker/widgets/bottom_picker_radio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void openPicker({
  required BuildContext context,
  required List<ListItem> options,
  required String value,
  required Function(ListItem) onSelected,
  String? title,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => BottomPicker(
      options: options,
      value: value,
      onSelected: onSelected,
      title: title,
    ),
  );
}

Future openRadioPicker({
  required BuildContext context,
  required List<ListItem> options,
  String? initialValue,
  required Function(String?) onSelected,
}) async {
  var selectedGender = await showModalBottomSheet<String>(
    context: context,
    isDismissible: true,
    barrierColor: Colors.black.withOpacity(0.3),
    constraints: const BoxConstraints(
      maxHeight: 350,
    ),
    builder: (BuildContext context) {
      return BottomPickerRadio(
        title: 'Select your gender',
        initialValue: initialValue,
        options: options,
      );
    },
  );
  onSelected(selectedGender);
}
