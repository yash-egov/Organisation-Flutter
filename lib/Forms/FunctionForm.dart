import 'package:digit_flutter_components/digit_components.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Functions.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class FunctionsForm extends StatefulWidget {
  final Organisation org;
  FunctionsForm({required this.org});

  @override
  _FunctionsFormState createState() => _FunctionsFormState(org);
}

class _FunctionsFormState extends State<FunctionsForm> {
  final Organisation org;

  _FunctionsFormState(this.org);

  // Define the form group and its controls
  final form = FormGroup({
    'type': FormControl<String>(
      validators: [Validators.required],
    ),
    'category': FormControl<String>(
      validators: [Validators.required],
    ),
    'className': FormControl<String>(
      validators: [Validators.required],
    ),
    'validFrom': FormControl<int>(),
    'validTo': FormControl<int>(),
  });

  bool isFunctionValid(FormGroup form) {
    return form.valid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Text(
          "Functions Form",
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
                formControlName: 'category',
                decoration: InputDecoration(
                    labelText: 'Category', border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) => 'Category is required',
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'className',
                decoration: InputDecoration(
                    labelText: 'Class', border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) => 'Class is required',
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'validFrom',
                decoration: InputDecoration(
                    labelText: 'Valid From', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'Valid From is required',
                },
                // onChanged: (value) {
                //   form.control('validFrom').value =
                //       int.tryParse(value ?? '');
                // },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'validTo',
                decoration: InputDecoration(
                    labelText: 'Valid To', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validationMessages: {
                  ValidationMessage.required: (error) => 'Valid To is required',
                },
                // onChanged: (value) {
                //   form.control('validTo').value = int.tryParse(value ?? '');
                // },
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return DigitButton(
                    onPressed: () {
                      if (form.valid) {
                        final functions = Functions(
                          type: form.control('type').value,
                          category: form.control('category').value,
                          className: form.control('className').value,
                          validFrom: form.control('validFrom').value,
                          validTo: form.control('validTo').value,
                        );
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationFunctionEvent(functions));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content:
                                Text('Function Details Added Successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        form.markAllAsTouched();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Invalid Function Details'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    label: 'Add Function',
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
                AutoRouter.of(context).push(DocumentsForm(org: org));
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
  }
}
