import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Address.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class AddressForm extends StatelessWidget {
  final Organisation org;

  AddressForm({required this.org});

  // Define the form group and its controls
  final form = FormGroup({
    'tenantId': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'city': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'pincode': FormControl<String>(
      validators: [
        Validators.required,
        Validators.pattern(r'^\d{6}$'),
      ],
    ),
    'doorNo': FormControl<String>(),
    'addressLine1': FormControl<String>(),
    'addressLine2': FormControl<String>(),
  });

  bool isAddressValid(FormGroup form) {
    return form.valid;
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
        child: ReactiveForm(
          formGroup: form,
          child: ListView(
            children: [
              ReactiveTextField<String>(
                formControlName: 'tenantId',
                decoration: InputDecoration(
                    labelText: 'Tenant ID',
                    hintText: 'e.g pb.amritsar',
                    border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      "Tenant ID is required",
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField<String>(
                formControlName: 'city',
                decoration: InputDecoration(
                    labelText: 'City', border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) => "City is required",
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField<String>(
                formControlName: 'pincode',
                decoration: InputDecoration(
                    labelText: 'Pin code', border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) => "Pin code is required",
                  ValidationMessage.pattern: (error) =>
                      "Invalid Pin code format. It should be of length 6",
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField<String>(
                formControlName: 'doorNo',
                decoration: InputDecoration(
                    labelText: 'Door No', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField<String>(
                formControlName: 'addressLine1',
                decoration: InputDecoration(
                    labelText: 'Address Line 1', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField<String>(
                formControlName: 'addressLine2',
                decoration: InputDecoration(
                    labelText: 'Address Line 2', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return DigitButton(
                    label: 'Add Address',
                    onPressed: () {
                      if (form.valid) {
                        final address = Address(
                          tenantId: form.control('tenantId').value,
                          city: form.control('city').value,
                          pincode: form.control('pincode').value,
                          doorNo: form.control('doorNo').value,
                          addressLine1: form.control('addressLine1').value,
                          addressLine2: form.control('addressLine2').value,
                        );
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationAddressEvent(address));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Address Added Successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        form.markAllAsTouched();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Invalid Address Details'),
                            duration: Duration(seconds: 2),
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
                AutoRouter.of(context).push(ContactForm(org: org));
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
  }
}
