import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
