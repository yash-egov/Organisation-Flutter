import 'package:digit_flutter_components/digit_components.dart';
import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
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
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Text(
          "Functions Form",
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
                label: "Type",
                initialValue: '',
                controller: _typeController,
                innerLabel: '',
                helpText: '',
                charCount: true,
                onChange: (value) => functions.type = value,
              ),
              // TextFormField(
              //   controller: _typeController,
              //   decoration: InputDecoration(labelText: 'Type'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter type';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) => functions.type = value,
              // ),
              DigitTextFormInput(
                label: "Category",
                initialValue: '',
                controller: _categoryController,
                innerLabel: '',
                helpText: '',
                charCount: true,
                onChange: (value) => functions.category = value,
              ),
              // TextFormField(
              //   controller: _categoryController,
              //   decoration: InputDecoration(labelText: 'Category'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter category';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) => functions.category = value,
              // ),
              // TextFormField(
              //   controller: _classController,
              //   decoration: InputDecoration(labelText: 'Class'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter class';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) => functions.className = value,
              // ),
              DigitTextFormInput(
                label: "Class",
                initialValue: '',
                controller: _classController,
                innerLabel: '',
                helpText: '',
                charCount: true,
                onChange: (value) => functions.className = value,
              ),
              // TextFormField(
              //   controller: _validFromController,
              //   decoration: InputDecoration(labelText: 'Valid From'),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter valid from date';
              //     }
              //     return null;
              //   },
              //   onChanged: (value) => functions.validFrom = int.parse(value),
              // ),
              DigitDateFormInput(
                label: "Valid From",
                controller: _validFromController,
                innerLabel: '',
                helpText: '',
                onChange: (value) => functions.validFrom = value as int?,
              ),
              DigitDateFormInput(
                label: "Valid To",
                controller: _validToController,
                innerLabel: '',
                helpText: '',
                onChange: (value) => functions.validTo = value as int?,
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
                    },
                    child: Text('Add Function'),
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
                AutoRouter.of(context).push(DocumentsForm(org: org));
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
  }
}
