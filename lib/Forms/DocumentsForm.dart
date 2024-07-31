// ignore_for_file: dead_code

import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Document.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
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

  bool IsDocumentValid(Document doc) {
    if (doc.id == null || doc.documentType == null) return false;
    if (doc.id?.length == 0 || doc.documentType?.length == 0) return false;
    return true;
  }

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
                DigitTextFormInput(
                  label: "Document Id",
                  initialValue: '',
                  controller: _idController,
                  innerLabel: '',
                  helpText: 'unique id',
                  charCount: true,
                  isRequired: true,
                  onChange: (value) => document.id = value,
                ),
                DigitTextFormInput(
                  label: "Document Type",
                  initialValue: '',
                  controller: _documentTypeController,
                  innerLabel: '',
                  helpText: 'e.g pdf , doc',
                  charCount: true,
                  isRequired: true,
                  onChange: (value) => document.documentType = value,
                ),

                DigitTextFormInput(
                  label: "File Store",
                  initialValue: '',
                  controller: _fileStoreController,
                  innerLabel: '',
                  helpText: '',
                  charCount: true,
                  // isRequired: true,
                  onChange: (value) => document.fileStore = value,
                ),

                // Add more fields if needed
                BlocBuilder<OrganisationBloc, OrganisationState>(
                  builder: (context, state) {
                    return DigitButton(
                      onPressed: () {
                        if (IsDocumentValid(document)) {
                          context
                              .read<OrganisationBloc>()
                              .add(addOrganisationDocumentEvent(document));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Document Added SuccessFully'),
                              duration: Duration(
                                  seconds:
                                      2), // The duration for which the snackbar is displayed
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid Document'),
                              duration: Duration(
                                  seconds:
                                      2), // The duration for which the snackbar is displayed
                            ),
                          );
                        }
                      },
                      label: 'Add Document',
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
                  AutoRouter.of(context).push(PreviewOrganisation(
                      screen: "Preview Page", org: state.org, preview: true));
                },
                type: ButtonType.primary,
              );
            },
          ),
        ));
  }
}
