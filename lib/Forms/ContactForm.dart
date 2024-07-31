import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/ContactDetails.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class ContactForm extends StatelessWidget {
  final Organisation org;

  ContactForm(this.org);

  // Define the form group and its controls
  final form = FormGroup({
    'contactName': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'contactMobileNumber': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(10),
        Validators.maxLength(10),
      ],
    ),
    'contactEmail': FormControl<String>(
      validators: [
        Validators.email,
      ],
    ),
  });

  bool isContactValid(FormGroup form) {
    return form.valid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Text(
          "Contact Form",
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
                formControlName: 'contactName',
                decoration: InputDecoration(
                    labelText: 'Contact Name', border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      "Contact name is required",
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'contactMobileNumber',
                decoration: InputDecoration(
                    labelText: 'Contact Mobile Number',
                    border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'Mobile number is required',
                  ValidationMessage.minLength: (error) =>
                      'Invalid mobile number: Length should be 10',
                  ValidationMessage.maxLength: (error) =>
                      'Invalid mobile number: Length should be 10',
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'contactEmail',
                decoration: InputDecoration(
                    labelText: 'Contact Email', border: OutlineInputBorder()),
                validationMessages: {
                  // ValidationMessage.email: 'Invalid email address',
                },
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return DigitButton(
                    onPressed: () {
                      if (form.valid) {
                        final contact = ContactDetail(
                          contactName: form.control('contactName').value,
                          contactMobileNumber:
                              form.control('contactMobileNumber').value,
                          contactEmail: form.control('contactEmail').value,
                        );
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationContactDetailEvent(contact));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Contact Added Successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        form.markAllAsTouched();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Invalid Contact Details'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    label: 'Add Contact',
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
        child: DigitButton(
          label: 'Next',
          onPressed: () {
            AutoRouter.of(context).push(IdentifierForm(org: org));
          },
          type: ButtonType.primary,
        ),
      ),
    );
  }
}
