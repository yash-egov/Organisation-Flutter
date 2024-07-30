import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';

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
          toolbarHeight: MyFontStyle.appbarHeight,
          backgroundColor: DigitTheme.instance.colorScheme.secondary,
          title: Text(
            "Documents Form",
            style: DigitTheme.instance.mobileTypography.headingL,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // TextFormField(
                //   controller: _documentTypeController,
                //   decoration: InputDecoration(labelText: 'Document Type'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter document type';
                //     }
                //     return null;
                //   },
                //   onChanged: (value) => document.documentType = value,
                // ),
                DigitTextFormInput(
                  label: "Document Type",
                  initialValue: '',
                  controller: _documentTypeController,
                  innerLabel: '',
                  helpText: 'e.g pdf , doc',
                  charCount: true,
                  onChange: (value) => document.documentType = value,
                ),
                // TextFormField(
                //   controller: _fileStoreController,
                //   decoration: InputDecoration(labelText: 'File Store'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter file store';
                //     }
                //     return null;
                //   },
                //   onChanged: (value) => document.fileStore = value,
                // ),
                DigitTextFormInput(
                  label: "File Store",
                  initialValue: '',
                  controller: _fileStoreController,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  onChange: (value) => document.fileStore = value,
                ),

                // Add more fields if needed
                // BlocBuilder<OrganisationBloc, OrganisationState>(
                //   builder: (context, state) {
                //     return ElevatedButton(
                //       onPressed: () {
                //         context
                //             .read<OrganisationBloc>()
                //             .add(addOrganisationDocumentEvent(document));
                //         AutoRouter.of(context).pop();
                //       },
                //       child: Text('Submit'),
                //     );
                //   },
                // ),
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
                  context
                      .read<OrganisationBloc>()
                      .add(addOrganisationDocumentEvent(document));
                  // Pop the current route
                  AutoRouter.of(context).push(PreviewOrganisation());
                },
                type: ButtonType.primary,
              );
            },
          ),
        ));
  }
}
