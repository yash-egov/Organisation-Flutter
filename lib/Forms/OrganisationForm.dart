import 'package:flutter/material.dart';
// import 'package:organisations/Forms/AddressForm.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: Text("Organisation Form"),
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
                onChanged: (value) {
                  org.tenantId = value;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                onChanged: (value) {
                  org.name = value;
                },
              ),
              TextFormField(
                controller: _applicationStatusController,
                decoration: InputDecoration(labelText: 'Application Status'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter application status';
                  }
                  return null;
                },
                onChanged: (value) {
                  org.applicationStatus = value;
                },
              ),
              TextFormField(
                controller: _externalRefNumberController,
                decoration: InputDecoration(labelText: 'External Ref Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter external ref number';
                  }
                  return null;
                },
                onChanged: (value) {
                  org.externalRefNumber = value;
                },
              ),
              TextFormField(
                controller: _dateOfIncorporationController,
                decoration: InputDecoration(labelText: 'Date of Incorporation'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter date of incorporation';
                  }
                  return null;
                },
                onChanged: (value) {
                  org.dateOfIncorporation = value as int;
                },
              ),
              // Add more fields for other parts of the JSON structure
              // ..._addressForms.map((addressForm) => addressForm).toList(),
              // AddressForm(),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(AddressForm(org: org));
                },
                child: Text('add Address'),
              ),

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(ContactForm(org: org));
                  // print(org.contactDetails?[0].contactName);
                },
                child: Text('add Contact Details'),
              ),

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(IdentifierForm(org: org));
                  // print(org.identifiers?[0].value);
                },
                child: Text('add Identifiers Details'),
              ),
              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(DocumentsForm(org: org));
                  // print(org.identifiers?[0].value);
                },
                child: Text('add Org Documents'),
              ),

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(FunctionsForm(org: org));
                  // print(org.identifiers?[0].value);
                },
                child: Text('add Functions'),
              ),

              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      print("Org Address : ");

                      for (int i = 0; i < state.org.orgAddress!.length; i++) {
                        print(state.org.orgAddress?[i].tenantId);
                        print(state.org.orgAddress?[i].doorNo);
                      }
                      print("Contact-Details");

                      for (int i = 0;
                          i < state.org.contactDetails!.length;
                          i++) {
                        print(state.org.contactDetails?[i].contactName);
                        print(state.org.contactDetails?[i].contactMobileNumber);
                        print(state.org.contactDetails?[i].contactEmail);
                      }

                      print("Identifiers : ");

                      for (int i = 0; i < state.org.identifiers!.length; i++) {
                        print(state.org.identifiers?[i].type);
                        print(state.org.identifiers?[i].value);
                      }

                      print("Documents org : ");

                      for (int i = 0; i < state.org.documents!.length; i++) {
                        print(state.org.documents?[i].documentType);
                        print(state.org.documents?[i].fileStore);
                      }
                      print(" org Functions : ");

                      for (int i = 0; i < state.org.functions!.length; i++) {
                        print(state.org.functions?[i].category);
                        print(state.org.functions?[i].className);
                        print(" org Functions Documents : ");

                        for (int j = 0;
                            j < (state.org.functions?[i]?.documents?.length)!;
                            j++) {
                          print(state
                              .org.functions?[i].documents?[j].documentType);
                          print(
                              state.org.functions?[i].documents?[j]?.fileStore);
                        }
                      }
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

void main() {
  runApp(MaterialApp(
    home: OrganisationForm(),
  ));
}
