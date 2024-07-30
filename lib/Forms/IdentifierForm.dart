import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc.dart';
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
                  onChange: (value) => identifier.type = value,
                ),

                DigitTextFormInput(
                  label: "Value",
                  initialValue: '',
                  controller: _valueController,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
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
                    return ElevatedButton(
                      onPressed: () {
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationIdentifierEvent(identifier));
                      },
                      child: Text('Add Identifier'),
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
                  AutoRouter.of(context).push(FunctionsForm(org: org));
                },
                type: ButtonType.primary,
              );
            },
          ),
        ));
  }
}
