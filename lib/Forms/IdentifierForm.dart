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
import 'package:reactive_forms/reactive_forms.dart';

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

  // Define the form group and its controls
  final form = FormGroup({
    'type': FormControl<String>(
      validators: [Validators.required],
    ),
    'value': FormControl<String>(
      validators: [Validators.required],
    ),
    'isActive': FormControl<bool>(value: true),
  });

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
        child: ReactiveForm(
          formGroup: form,
          child: ListView(
            children: [
              ReactiveTextField(
                formControlName: 'type',
                decoration: InputDecoration(
                    labelText: 'Type', border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) => 'Type is required',
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'value',
                decoration: InputDecoration(
                    labelText: 'Value', border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) => 'Value is required',
                },
              ),
              SizedBox(
                height: 20,
              ),
              // ReactiveSwitch(
              //   formControlName: 'isActive',
              //   title: Text("Is Active"),
              // ),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return DigitButton(
                    onPressed: () {
                      if (form.valid) {
                        final identifier = Identifier(
                          type: form.control('type').value,
                          value: form.control('value').value,
                          isActive: form.control('isActive').value,
                        );
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationIdentifierEvent(identifier));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content:
                                Text('Identifier Details Added Successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        form.markAllAsTouched();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Empty Identifier Details'),
                            duration: Duration(seconds: 2),
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
                // Navigate to the next form
                AutoRouter.of(context).push(FunctionsForm(org: org));
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
  }
}
