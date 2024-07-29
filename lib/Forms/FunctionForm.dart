import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';

@RoutePage()
class FunctionsForm extends StatefulWidget {
  final Organisation org;
  FunctionsForm({required this.org});

  @override
  _FunctionsFormState createState() => _FunctionsFormState(org);
}

class _FunctionsFormState extends State<FunctionsForm> {
  final Organisation org;
  _FunctionsFormState(this.org);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _validFromController = TextEditingController();
  final TextEditingController _validToController = TextEditingController();
  final TextEditingController _wfStatusController = TextEditingController();
  final TextEditingController _applicationStatusController =
      TextEditingController();

  Functions functions = new Functions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Functions Form"),
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
                onChanged: (value) => functions.type = value,
              ),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter category';
                  }
                  return null;
                },
                onChanged: (value) => functions.category = value,
              ),
              TextFormField(
                controller: _classController,
                decoration: InputDecoration(labelText: 'Class'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter class';
                  }
                  return null;
                },
                onChanged: (value) => functions.className = value,
              ),
              TextFormField(
                controller: _validFromController,
                decoration: InputDecoration(labelText: 'Valid From'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid from date';
                  }
                  return null;
                },
                onChanged: (value) => functions.validFrom = int.parse(value),
              ),
              TextFormField(
                controller: _validToController,
                decoration: InputDecoration(labelText: 'Valid To'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid to date';
                  }
                  return null;
                },
                onChanged: (value) => functions.validTo = int.parse(value),
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
                onChanged: (value) => functions.applicationStatus = value,
              ),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(FunctionDocumentsForm(
                          functionIndex: (state.org.functions?.length)!,
                          function: functions));
                    },
                    child: Text('Add Function Documents'),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context
                          .read<OrganisationBloc>()
                          .add(addOrganisationFunctionEvent(functions));
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
