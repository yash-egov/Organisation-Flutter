// ignore_for_file: dead_code

import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Identifier.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';

@RoutePage()
class IdentifierForm extends StatefulWidget {
  final Organisation org;
  IdentifierForm({required this.org});

  @override
  _IdentifierFormState createState() => _IdentifierFormState(org);
}

class _IdentifierFormState extends State<IdentifierForm> {
  final Organisation org;
  _IdentifierFormState(this.org);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  bool _isActive = true;
  Identifier identifier = new Identifier();

  bool IsIdentifierValid(Identifier idf) {
    if (idf.type == null || idf.value == null) return false;
    if (idf.type?.length == 0 || idf.value?.length == 0) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MyFontStyle.appbarHeight,
          backgroundColor: DigitTheme.instance.colorScheme.secondary,
          title: Text(
            "Identifier Form",
            style: DigitTheme.instance.mobileTypography.headingL,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                DigitTextFormInput(
                  label: "Type",
                  initialValue: '',
                  controller: _typeController,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  isRequired: true,
                  onChange: (value) => identifier.type = value,
                ),

                DigitTextFormInput(
                  label: "Value",
                  initialValue: '',
                  controller: _valueController,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  isRequired: true,
                  onChange: (value) => identifier.value = value,
                ),

                SwitchListTile(
                  title: Text("Is Active"),
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                      identifier.isActive = value;
                    });
                  },
                ),
                // Add more fields if needed
                BlocBuilder<OrganisationBloc, OrganisationState>(
                  builder: (context, state) {
                    return DigitButton(
                      onPressed: () {
                        if (IsIdentifierValid(identifier)) {
                          context
                              .read<OrganisationBloc>()
                              .add(addOrganisationIdentifierEvent(identifier));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                  ' Identifier Details Added SuccessFully'),
                              duration: Duration(
                                  seconds:
                                      2), // The duration for which the snackbar is displayed
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Empty Identifier Details '),
                              duration: Duration(
                                  seconds:
                                      2), // The duration for which the snackbar is displayed
                            ),
                          );
                        }
                      },
                      label: 'Add Identifier',
                      type: ButtonType.secondary,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: BlocBuilder<OrganisationBloc, OrganisationState>(
            builder: (context, state) {
              return DigitButton(
                label: 'Next',
                onPressed: () {
                  context
                      .read<OrganisationBloc>()
                      .add(addOrganisationIdentifierEvent(identifier));

                  // Pop the current route
                  AutoRouter.of(context).push(FunctionsForm(org: org));
                },
                type: ButtonType.primary,
              );
            },
          ),
        ));
  }
}
