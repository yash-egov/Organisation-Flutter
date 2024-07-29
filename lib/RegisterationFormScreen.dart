import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:organisations/Constants/text.dart';

@RoutePage()
class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String orgName = "";
  List<String> TextField = [
    "Organisation Name",
    "Tenant Id",
    "applicationStatus",
    "externalRefNumber",
    "dateOfIncorporation"
  ];
  List<String> TextVariables = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            "Register",
            style: TextStyle(
              fontSize: MyFontStyle.fontsize,
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: DigitTextFormInput(
                  label: "Organisation Name : ",
                  // initialValue: 'organisation Name',
                  controller: _textController,
                  // innerLabel: 'label',
                  helpText: 'Egov',
                  charCount: true,
                  onChange: (value) {
                    orgName = value;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form is valid, value: $orgName')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
