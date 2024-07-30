import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';

@RoutePage()
class FunctionDocumentsForm extends StatefulWidget {
  final int functionIndex;
  final Functions function;

  FunctionDocumentsForm({required this.functionIndex, required this.function});

  @override
  _FunctionDocumentsFormState createState() =>
      _FunctionDocumentsFormState(functionIndex, function);
}

class _FunctionDocumentsFormState extends State<FunctionDocumentsForm> {
  final int functionIndex;
  final Functions function;
  _FunctionDocumentsFormState(this.functionIndex, this.function);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _documentTypeController = TextEditingController();
  final TextEditingController _fileStoreIdController = TextEditingController();
  final TextEditingController _documentUidController = TextEditingController();
  final TextEditingController _fileNameController = TextEditingController();

  Document document = Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Function Document Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _documentTypeController,
                decoration: InputDecoration(labelText: 'Document Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter document type';
                  }
                  return null;
                },
                onChanged: (value) => document.documentType = value,
              ),
              TextFormField(
                controller: _fileStoreIdController,
                decoration: InputDecoration(labelText: 'File Store ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter file store ID';
                  }
                  return null;
                },
                onChanged: (value) => document.id = value,
              ),
              TextFormField(
                controller: _documentUidController,
                decoration: InputDecoration(labelText: 'Document UID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter document UID';
                  }
                  return null;
                },
                onChanged: (value) => document.documentUid = value,
              ),
              TextFormField(
                controller: _fileNameController,
                decoration: InputDecoration(labelText: 'File Store'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter file name';
                  }
                  return null;
                },
                onChanged: (value) => document.fileStore = value,
              ),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<OrganisationBloc>().add(
                            addOrganisationFunctionDocumentEvent(
                              document,
                              functionIndex,
                            ),
                          );
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
