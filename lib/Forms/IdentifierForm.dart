import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc.dart';

@RoutePage()
class IdentifierForm extends StatefulWidget {
  final Organisation org;
  IdentifierForm({required this.org});

  @override
  _IdentifierFormState createState() => _IdentifierFormState(org);
}

class _IdentifierFormState extends State<IdentifierForm> {
  final Organisation org;
  _IdentifierFormState(this.org);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  bool _isActive = true;
  Identifier identifier = new Identifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Identifier Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter type';
                  }
                  return null;
                },
                onChanged: (value) => identifier.type = value,
              ),
              TextFormField(
                controller: _valueController,
                decoration: InputDecoration(labelText: 'Value'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
                onChanged: (value) => identifier.value = value,
              ),
              SwitchListTile(
                title: Text("Is Active"),
                value: _isActive,
                onChanged: (value) {
                  setState(() {
                    _isActive = value;
                    identifier.isActive = value;
                  });
                },
              ),
              // Add more fields if needed
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context
                          .read<OrganisationBloc>()
                          .add(addOrganisationIdentifierEvent(identifier));
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
