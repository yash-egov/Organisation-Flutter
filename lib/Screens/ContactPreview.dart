import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/ContactDetails.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';

class ContactPreview extends StatefulWidget {
  int index;
  List<ContactDetail>? contacts;
  ContactPreview(this.index, this.contacts, {super.key});

  @override
  State<ContactPreview> createState() => _ContactPreviewState(index);
}

class _ContactPreviewState extends State<ContactPreview> {
  int index;
  _ContactPreviewState(this.index);
  @override
  Widget build(BuildContext context) {
    final contact = widget.contacts?[widget.index];
    return BlocBuilder<OrganisationBloc, OrganisationState>(
      builder: (context, state) {
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
                    "Contact Details : ${index + 1}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Name : "),
                      Text('${contact?.contactName}')
                    ],
                  ),
                  Row(
                    children: [
                      Text("Email : "),
                      Text('${contact?.contactEmail}')
                    ],
                  ),
                  Row(
                    children: [
                      Text("Mobile Number : "),
                      Text('${contact?.contactMobileNumber}')
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
