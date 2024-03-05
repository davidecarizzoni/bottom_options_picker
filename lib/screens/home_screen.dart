import 'package:bottom_options_picker/models/list_item.dart';
import 'package:bottom_options_picker/services/picker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<ListItem> genderOptions = [
  ListItem(
    value: 'M',
    label: 'Male',
    text: 'Male description',
  ),
  ListItem(
    value: 'F',
    label: 'Female',
    text: 'Female description',
  ),
  ListItem(
    value: 'O',
    label: 'Other',
    text: 'Other description',
  ),
];

class _HomeScreenState extends State<HomeScreen> {
  String? age = '18';
  String? gender;

  @override
  void initState() {
    super.initState();
  }

  void openNumberPicker(BuildContext context) {
    openPicker(
      title: 'Select your age',
      context: context,
      options: List.generate(
        91,
        (index) => ListItem(
          value: (index + 10).toString(),
          label: (index + 10).toString(),
        ),
        growable: false,
      ).toList(),
      value: '20',
      onSelected: (opt) {
        setState(() {
          age = opt.label;
        });
      },
    );
  }

  void openGenderPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: genderOptions,
      onSelected: (value) => setState(() => gender = value),
      initialValue: gender,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Picker Options'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.shade50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: const Text('Your age'),
                trailing: Text(
                  age ?? ' - ',
                  style: const TextStyle(fontSize: 16),
                ),
                onTap: () {
                  openNumberPicker(context);
                },
              ),
              Divider(
                color: Colors.blue.shade100,
                height: 1,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                title: const Text('Your gender'),
                trailing: Text(
                  gender != null
                      ? genderOptions
                          .firstWhere(
                            (e) => e.value == gender,
                          )
                          .label
                      : ' - ',
                  style: const TextStyle(fontSize: 16),
                ),
                onTap: () {
                  openGenderPicker(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
