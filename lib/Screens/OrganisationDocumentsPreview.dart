import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/bloc/organisation_bloc.dart';

class OrganisationDocumentsPreview extends StatefulWidget {
  int index;
  OrganisationDocumentsPreview(this.index, {super.key});

  @override
  State<OrganisationDocumentsPreview> createState() =>
      _OrganisationDocumentsPreviewState(index);
}

class _OrganisationDocumentsPreviewState
    extends State<OrganisationDocumentsPreview> {
  int index;
  _OrganisationDocumentsPreviewState(this.index);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganisationBloc, OrganisationState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Organisation Document : ${index + 1}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Document Type : "),
                    Text('${state.org.documents?[index]?.documentType}')
                  ],
                ),
                Row(
                  children: [
                    Text("Filestore Type : "),
                    Text('${state.org.documents?[index].fileStore}')
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    ;
  }
}
