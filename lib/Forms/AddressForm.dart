import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc.dart';
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
        title: Text("Address Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _tenantIdController,
                decoration: InputDecoration(labelText: 'Tenant ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter tenant ID';
                  }
                  return null;
                },
                onChanged: (value) => address.tenantId = value,
              ),
              TextFormField(
                controller: _doorNoController,
                decoration: InputDecoration(labelText: 'Door No'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter door number';
                  }
                  return null;
                },
                onChanged: (value) => address.doorNo = value,
              ),
              // Add more fields for other address attributes
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      // print(address.doorNo);
                      // org.orgAddress?.add(address);
                      // context.read<CityWeatherBloc>().state.data
                      context
                          .read<OrganisationBloc>()
                          .add(addOrganisationAddressEvent(address));
                      AutoRouter.of(context).pop();
                    },
                    child: Text('Submit'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
