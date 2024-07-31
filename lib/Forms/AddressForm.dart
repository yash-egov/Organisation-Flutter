import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/utils/validators/validator.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Address.dart';
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
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _doorNoController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  Address address = Address();

  bool IsAddressValid(Address add) {
    if (add.tenantId == null ||
        (add.tenantId?.length == 0) ||
        add.city == null ||
        add.city?.length == 0 ||
        add?.pincode == null ||
        (add?.pincode?.length != 6)) return false;
    return true;
  }

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
                isRequired: true,
                validations: [
                  Validator(ValidatorType.required, null,
                      errorMessage: 'Tenant ID is required'),
                  // Validator(ValidatorType.pattern, r'^[a-zA-Z]+\.[a-zA-Z]+$',
                  // errorMessage: 'Invalid Tenant ID format'),
                ],
              ),
              DigitTextFormInput(
                label: "City",
                initialValue: '',
                controller: _cityController,
                innerLabel: '',
                helpText: '',
                charCount: true,
                onChange: (value) => address.city = value,
                isRequired: true,
                validations: [
                  Validator(ValidatorType.required, null,
                      errorMessage: 'City is required'),
                ],
              ),
              DigitTextFormInput(
                label: "Pin code",
                initialValue: '',
                controller: _pincodeController,
                innerLabel: '',
                helpText: '',
                charCount: true,
                onChange: (value) => address.pincode = value,
                isRequired: true,
                validations: [
                  Validator(ValidatorType.required, null,
                      errorMessage: 'Pin code is required'),
                  Validator(ValidatorType.pattern, r'^\d{6}$',
                      errorMessage:
                          'Invalid Pin code format .. it should be of length 6'),
                ],
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
              SizedBox(height: 20),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return DigitButton(
                    label: 'Add Address',
                    onPressed: () {
                      // Validate the form
                      if (IsAddressValid(address)) {
                        // Add to bloc only if the form is valid
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationAddressEvent(address));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(' Address Added SuccessFully'),
                            duration: Duration(
                                seconds:
                                    2), // The duration for which the snackbar is displayed
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Invalid Address Details'),
                            duration: Duration(
                                seconds:
                                    2), // The duration for which the snackbar is displayed
                          ),
                        );
                      }
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
                // Validate the form before proceeding to the next screen
                if (_formKey.currentState?.validate() ?? false) {
                  AutoRouter.of(context).push(ContactForm(org: org));
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
