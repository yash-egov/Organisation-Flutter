import 'dart:typed_data';

import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/utils/validators/validator.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_date_form_input.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class OrganisationForm extends StatefulWidget {
  @override
  _OrganisationFormState createState() => _OrganisationFormState();
}

class _OrganisationFormState extends State<OrganisationForm> {
  // Define the form group and its controls
  final form = FormGroup({
    'tenantId': FormControl<String>(
      validators: [Validators.required, Validators.minLength(2)],
    ),
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'applicationStatus': FormControl<String>(),
    'externalRefNumber': FormControl<String>(),
    'dateOfIncorporation': FormControl<int>(),
  });

  bool isDataValid(FormGroup form) {
    return form.valid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Text(
          "Organisation Form",
          style: DigitTheme.instance.mobileTypography.headingL,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: form,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              ReactiveTextField(
                formControlName: 'tenantId',
                decoration: InputDecoration(
                    labelText: 'Tenant ID',
                    hintText: 'e.g pb.amritsar',
                    border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'Tenant ID is required',
                  ValidationMessage.minLength: (error) => 'Minimum length is 2',
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'name',
                decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'e.g EGov',
                    border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) => 'Name is required',
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'applicationStatus',
                decoration: InputDecoration(
                    labelText: 'Application Status',
                    hintText: 'e.g apply',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'externalRefNumber',
                decoration: InputDecoration(
                    labelText: 'External Ref Number',
                    hintText: 'e.g ref',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              // ReactiveDatePicker(
              //   formControlName: 'dateOfIncorporation',
              //   firstDate: DateTime(1900),
              //   lastDate: DateTime.now(),
              //   decoration: InputDecoration(
              //     labelText: 'Date of Incorporation',
              //     hintText: 'e.g Date',
              //   ),
              //   onDateSelected: (date) {
              //     form.control('dateOfIncorporation').value = date?.millisecondsSinceEpoch;
              //   },
              // ),
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
                if (isDataValid(form)) {
                  final org = Organisation(
                    tenantId: form.control('tenantId').value,
                    name: form.control('name').value,
                    applicationStatus: form.control('applicationStatus').value,
                    externalRefNumber: form.control('externalRefNumber').value,
                    dateOfIncorporation:
                        form.control('dateOfIncorporation').value,
                  );
                  context.read<OrganisationBloc>().add(
                        addOrganisationBasicDetailsEvent(
                          org.tenantId,
                          org.name,
                          org.applicationStatus,
                          org.externalRefNumber,
                          org.dateOfIncorporation,
                        ),
                      );
                  AutoRouter.of(context).push(AddressForm(org: org));
                } else {
                  form.markAllAsTouched();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid Tenant ID or Name'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
  }
}
