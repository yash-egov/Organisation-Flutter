import 'package:digit_flutter_components/digit_components.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Document.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

  // Define the form group and its controls
  final form = FormGroup({
    'id': FormControl<String>(
      validators: [Validators.required],
    ),
    'documentType': FormControl<String>(
      validators: [Validators.required],
    ),
    'fileStore': FormControl<String>(),
  });

  bool isDocumentValid(FormGroup form) {
    return form.valid;
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
        child: ReactiveForm(
          formGroup: form,
          child: ListView(
            children: [
              ReactiveTextField(
                formControlName: 'id',
                decoration: InputDecoration(
                    labelText: 'Document Id',
                    hintText: 'unique id',
                    border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'Document Id is required',
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'documentType',
                decoration: InputDecoration(
                    labelText: 'Document Type',
                    hintText: 'e.g pdf, doc',
                    border: OutlineInputBorder()),
                validationMessages: {
                  ValidationMessage.required: (error) =>
                      'Document Type is required',
                },
              ),
              SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'fileStore',
                decoration: InputDecoration(
                    labelText: 'File Store', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              BlocBuilder<OrganisationBloc, OrganisationState>(
                builder: (context, state) {
                  return DigitButton(
                    onPressed: () {
                      if (form.valid) {
                        final document = Document(
                          id: form.control('id').value,
                          documentType: form.control('documentType').value,
                          fileStore: form.control('fileStore').value,
                        );
                        context
                            .read<OrganisationBloc>()
                            .add(addOrganisationDocumentEvent(document));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Document Added Successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        form.markAllAsTouched();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Invalid Document'),
                            duration: Duration(seconds: 2),
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
                AutoRouter.of(context).push(
                  PreviewOrganisation(
                    screen: "Preview Page",
                    org: state.org,
                    preview: true,
                  ),
                );
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
  }
}
