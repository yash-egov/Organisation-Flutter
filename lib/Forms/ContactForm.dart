import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/utils/validators/validator.dart';
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

@RoutePage()
class ContactForm extends StatefulWidget {
  final Organisation org;

  ContactForm(this.org);

  @override
  _ContactFormState createState() => _ContactFormState(org);
}

class _ContactFormState extends State<ContactForm> {
  Organisation org;
  _ContactFormState(this.org);
  final _formKey = GlobalKey<FormState>();

  // Controllers for Contact Details fields
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactMobileNumberController =
      TextEditingController();
  final TextEditingController _contactEmailController = TextEditingController();

  @override
  void dispose() {
    _contactNameController.dispose();
    _contactMobileNumberController.dispose();
    _contactEmailController.dispose();
    super.dispose();
  }

  bool IsContactValid(ContactDetail contact) {
    // if (contact?.contactName == null || contact?.contactMobileNumber == null)
    //   return false;
    if (contact.contactName?.length == 0 ||
        contact.contactMobileNumber?.length != 10) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ContactDetail contact = new ContactDetail();
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DigitTextFormInput(
                label: "Contact Name",
                initialValue: '',
                controller: _contactNameController,
                innerLabel: '',
                helpText: '',
                charCount: true,
                onChange: (value) {
                  contact.contactName = value;
                },
                isRequired: true,
                validations: [
                  Validator(ValidatorType.required, null,
                      errorMessage: 'Contact name is required'),
                ],
              ),
              DigitTextFormInput(
                label: "Contact Mobile Number",
                initialValue: '',
                controller: _contactMobileNumberController,
                innerLabel: '',
                helpText: '',
                charCount: true,
                onChange: (value) {
                  contact.contactMobileNumber = value;
                },
                isRequired: true,
                validations: [
                  Validator(ValidatorType.required, null,
                      errorMessage: 'Mobile number is required'),
                  Validator(ValidatorType.mobileNumber, 10,
                      errorMessage:
                          'Invalid mobile number : Length should be 10'),
                ],
              ),
              DigitTextFormInput(
                label: "Contact Email",
                initialValue: '',
                controller: _contactEmailController,
                innerLabel: '',
                helpText: '',
                charCount: true,
                onChange: (value) {
                  contact.contactEmail = value;
                },
                validations: [
                  // Validator(ValidatorType.required, null,
                  //     errorMessage: 'Email is required'),
                  Validator(ValidatorType.email, null,
                      errorMessage: 'Invalid email address'),
                ],
              ),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return DigitButton(
                    onPressed: () {
                      if (IsContactValid(contact)) {
                        // org.contactDetails?.add(contact);
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationContactDetailEvent(contact));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text(' Contact Details Added SuccessFully'),
                            duration: Duration(
                                seconds:
                                    2), // The duration for which the snackbar is displayed
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Invalid Contact Details'),
                            duration: Duration(
                                seconds:
                                    2), // The duration for which the snackbar is displayed
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
        child: BlocBuilder<OrganisationBloc, OrganisationState>(
          builder: (context, state) {
            return DigitButton(
              label: 'Next',
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  AutoRouter.of(context).push(IdentifierForm(org: org));
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
