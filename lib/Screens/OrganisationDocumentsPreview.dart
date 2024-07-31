import 'package:flutter/material.dart';
import 'package:organisations/Models/Document.dart';
import 'package:organisations/Models/Organisation.dart';

class OrganisationDocumentsPreview extends StatefulWidget {
  final int index;
  final List<Document> documents;

  OrganisationDocumentsPreview(this.index, this.documents, {Key? key})
      : super(key: key);

  @override
  _OrganisationDocumentsPreviewState createState() =>
      _OrganisationDocumentsPreviewState();
}

class _OrganisationDocumentsPreviewState
    extends State<OrganisationDocumentsPreview> {
  @override
  Widget build(BuildContext context) {
    final document = widget.documents[widget.index];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 10,
        color: const Color.fromARGB(255, 230, 224, 224),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Organisation Document : ${widget.index + 1}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Document Type: "),
                  Text(document.documentType ?? 'N/A'),
                ],
              ),
              Row(
                children: [
                  Text("Filestore Type: "),
                  Text(document.fileStore ?? 'N/A'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
