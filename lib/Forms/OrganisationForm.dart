import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_date_form_input.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
// import 'package:organisations/Forms/AddressForm.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';

import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
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
              DigitDateFormInput(
                label: "Date of Incorporation",
                controller: _dateOfIncorporationController,
                innerLabel: '',
                helpText: 'e.g Date',
                onChange: (value) {
                  org.dateOfIncorporation = value as int;
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
                context.read<OrganisationBloc>().add(
                    addOrganisationBasicDetailsEvent(
                        org.tenantId,
                        org.name,
                        org.applicationStatus,
                        org.externalRefNumber,
                        org.dateOfIncorporation));
                AutoRouter.of(context).push(AddressForm(org: org));
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
  }
}
