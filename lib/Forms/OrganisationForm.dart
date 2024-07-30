import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
// import 'package:organisations/Forms/AddressForm.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';

import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';
import 'package:organisations/router/app_router.gr.dart';

@RoutePage()
class OrganisationForm extends StatefulWidget {
  @override
  _OrganisationFormState createState() => _OrganisationFormState();
}

class _OrganisationFormState extends State<OrganisationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tenantIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _applicationStatusController =
      TextEditingController();
  final TextEditingController _externalRefNumberController =
      TextEditingController();
  final TextEditingController _dateOfIncorporationController =
      TextEditingController();

  // Add more controllers for other fields

  @override
  Widget build(BuildContext context) {
    Organisation org = new Organisation();

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
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              // TextFormField(
              //   controller: _tenantIdController,
              //   decoration: InputDecoration(labelText: 'Tenant ID'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter tenant ID';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) {
              //     org.tenantId = value;
              //   },
              // ),
              DigitTextFormInput(
                label: "Tenant ID",
                initialValue: '',
                controller: _tenantIdController,
                innerLabel: '',
                helpText: 'e.g pb.amritsar',
                charCount: true,
                onChange: (value) {
                  org.tenantId = value;
                },
              ),
              // TextFormField(
              //   controller: _nameController,
              //   decoration: InputDecoration(labelText: 'Name'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter name';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) {
              //     org.name = value;
              //   },
              // ),
              DigitTextFormInput(
                label: "Name",
                initialValue: '',
                controller: _nameController,
                innerLabel: '',
                helpText: 'e.g EGov',
                charCount: true,
                onChange: (value) {
                  org.name = value;
                },
              ),
              // TextFormField(
              //   controller: _applicationStatusController,
              //   decoration: InputDecoration(labelText: 'Application Status'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter application status';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) {
              //     org.applicationStatus = value;
              //   },
              // ),
              DigitTextFormInput(
                label: "Application Status",
                initialValue: '',
                controller: _applicationStatusController,
                innerLabel: '',
                helpText: 'e.g apply',
                charCount: true,
                onChange: (value) {
                  org.applicationStatus = value;
                },
              ),
              // TextFormField(
              //   controller: _externalRefNumberController,
              //   decoration: InputDecoration(labelText: 'External Ref Number'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter external ref number';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) {
              //     org.externalRefNumber = value;
              //   },
              // ),
              DigitTextFormInput(
                label: "External Ref Number",
                initialValue: '',
                controller: _externalRefNumberController,
                innerLabel: '',
                helpText: 'e.g ref',
                charCount: true,
                onChange: (value) {
                  org.externalRefNumber = value;
                },
              ),
              // TextFormField(
              //   controller: _dateOfIncorporationController,
              //   decoration: InputDecoration(labelText: 'Date of Incorporation'),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter date of incorporation';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) {
              //     org.dateOfIncorporation = value as int;
              //   },
              // ),
              DigitTextFormInput(
                label: "Date of Incorporation",
                initialValue: '',
                controller: _dateOfIncorporationController,
                innerLabel: '',
                helpText: 'e.g Date',
                charCount: true,
                onChange: (value) {
                  org.dateOfIncorporation = value as int;
                },
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // DigitButton(
              //   // width: 90,
              //   suffixIcon: Icons.add,
              //   label: 'add Address',
              //   onPressed: () {
              //     AutoRouter.of(context).push(AddressForm(org: org));
              //   },
              //   type: ButtonType.primary,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // DigitButton(
              //   suffixIcon: Icons.add,
              //   label: 'add Contact Details',
              //   onPressed: () {
              //     AutoRouter.of(context).push(ContactForm(org: org));
              //   },
              //   type: ButtonType.primary,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // DigitButton(
              //   suffixIcon: Icons.add,
              //   label: 'add Identifiers Details',
              //   onPressed: () {
              //     AutoRouter.of(context).push(IdentifierForm(org: org));
              //   },
              //   type: ButtonType.primary,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // DigitButton(
              //   suffixIcon: Icons.add,
              //   label: 'add Org Documents',
              //   onPressed: () {
              //     AutoRouter.of(context).push(DocumentsForm(org: org));
              //   },
              //   type: ButtonType.primary,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // DigitButton(
              //   suffixIcon: Icons.add,
              //   label: 'add Functions',
              //   onPressed: () {
              //     AutoRouter.of(context).push(FunctionsForm(org: org));
              //   },
              //   type: ButtonType.primary,
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // BlocBuilder<OrganisationBloc, OrganisationState>(
              //   builder: (context, state) {
              //     return DigitButton(
              //       // suffixIcon: Icons.add,
              //       label: 'Submit',
              //       onPressed: () {
              // context
              //     .read<OrganisationBloc>()
              //     .add(SubmitOrganisationEvent());
              //         AutoRouter.of(context).push(Home());
              //       },
              //       type: ButtonType.primary,
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: DigitButton(
          // width: 90,
          // suffixIcon: Icons.next_plan,
          label: 'Next',
          onPressed: () {
            AutoRouter.of(context).push(AddressForm(org: org));
          },
          type: ButtonType.primary,
        ),
      ),
    );
  }
}
