import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';

@RoutePage()
class AddressForm extends StatefulWidget {
  final Organisation org;
  AddressForm({required this.org});
  @override
  _AddressFormState createState() => _AddressFormState(org);
}

class _AddressFormState extends State<AddressForm> {
  final Organisation org;
  _AddressFormState(this.org);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tenantIdController = TextEditingController();
  final TextEditingController _doorNoController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _addressNumberController =
      TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _boundaryCodeController = TextEditingController();
  final TextEditingController _boundaryNameController = TextEditingController();
  final TextEditingController _boundaryLabelController =
      TextEditingController();
  final TextEditingController _boundaryLatitudeController =
      TextEditingController();
  final TextEditingController _boundaryLongitudeController =
      TextEditingController();
  final TextEditingController _boundaryTypeController = TextEditingController();
  Address address = new Address();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MyFontStyle.appbarHeight,
          backgroundColor: DigitTheme.instance.colorScheme.secondary,
          title: Text(
            "Address Form",
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
                  label: "Tenant ID",
                  initialValue: '',
                  controller: _tenantIdController,
                  innerLabel: '',
                  helpText: 'e.g pb.amritsar',
                  charCount: true,
                  onChange: (value) => address.tenantId = value,
                ),
                DigitTextFormInput(
                  label: "City",
                  initialValue: '',
                  controller: _cityController,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  onChange: (value) => address.city = value,
                ),
                DigitTextFormInput(
                  label: "Pin code",
                  initialValue: '',
                  controller: _pincodeController,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  onChange: (value) => address.pincode = value,
                ),
                DigitTextFormInput(
                  label: "Door No",
                  initialValue: '',
                  controller: _doorNoController,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  onChange: (value) => address.doorNo = value,
                ),
                DigitTextFormInput(
                  label: "Address Line 1",
                  initialValue: '',
                  controller: _addressLine1Controller,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  onChange: (value) => address.addressLine1 = value,
                ),
                DigitTextFormInput(
                  label: "Address Line 2",
                  initialValue: '',
                  controller: _addressLine2Controller,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  onChange: (value) => address.addressLine2 = value,
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<OrganisationBloc, OrganisationState>(
                  builder: (context, state) {
                    return DigitButton(
                      label: 'add Address',
                      onPressed: () {
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationAddressEvent(address));
                      },
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
                  AutoRouter.of(context).push(ContactForm(org: org));
                },
                type: ButtonType.primary,
              );
            },
          ),
        ));
  }
}
