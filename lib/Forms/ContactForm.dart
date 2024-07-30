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
                // TextFormField(
                //   controller: _contactNameController,
                //   decoration: InputDecoration(labelText: 'Contact Name'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter contact name';
                //     }
                //     return null;
                //   },
                //   onChanged: (value) {
                //     contact.contactName = value;
                //   },
                // ),
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
                ),
                // TextFormField(
                //   controller: _contactMobileNumberController,
                //   decoration: InputDecoration(labelText: 'Contact Mobile Number'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter contact mobile number';
                //     }
                //     return null;
                //   },
                //   onChanged: (value) {
                //     contact.contactMobileNumber = value;
                //   },
                // ),
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
                ),
                // TextFormField(
                //   controller: _contactEmailController,
                //   decoration: InputDecoration(labelText: 'Contact Email'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter contact email';
                //     }
                //     return null;
                //   },
                //   onChanged: (value) {
                //     contact.contactEmail = value;
                //   },
                // ),
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
                ),
                // BlocBuilder<OrganisationBloc, OrganisationState>(
                //   builder: (context, state) {
                //     return ElevatedButton(
                //       onPressed: () {
                //         if (_formKey.currentState?.validate() ?? false) {
                //           org.contactDetails?.add(contact);
                //           context
                //               .read<OrganisationBloc>()
                //               .add(addOrganisationContactDetailEvent(contact));
                //           // Pop the current route
                //           AutoRouter.of(context).pop();
                //         }
                //       },
                //       child: Text('Submit'),
                //     );
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
                  context
                      .read<OrganisationBloc>()
                      .add(addOrganisationContactDetailEvent(contact));
                  // Pop the current route
                  AutoRouter.of(context).push(IdentifierForm(org: org));
                },
                type: ButtonType.primary,
              );
            },
          ),
        ));
  }
}
