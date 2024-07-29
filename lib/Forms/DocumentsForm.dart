import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc.dart';

@RoutePage()
class DocumentsForm extends StatefulWidget {
  final Organisation org;
  DocumentsForm({required this.org});

  @override
  _DocumentsFormState createState() => _DocumentsFormState(org);
}

class _DocumentsFormState extends State<DocumentsForm> {
  final Organisation org;
  _DocumentsFormState(this.org);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _documentTypeController = TextEditingController();
  final TextEditingController _fileStoreController = TextEditingController();
  final TextEditingController _documentUidController = TextEditingController();
  Document document = new Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Documents Form"),
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
                controller: _fileStoreController,
                decoration: InputDecoration(labelText: 'File Store'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter file store';
                  }
                  return null;
                },
                onChanged: (value) => document.fileStore = value,
              ),

              // Add more fields if needed
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context
                          .read<OrganisationBloc>()
                          .add(addOrganisationDocumentEvent(document));
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
