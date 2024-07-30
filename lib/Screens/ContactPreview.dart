import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/bloc/organisation_bloc.dart';

class ContactPreview extends StatefulWidget {
  int index;
  ContactPreview(this.index, {super.key});

  @override
  State<ContactPreview> createState() => _ContactPreviewState(index);
}

class _ContactPreviewState extends State<ContactPreview> {
  int index;
  _ContactPreviewState(this.index);
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
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Contact Details : ${index + 1}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Name : "),
                    Text('${state.org.contactDetails?[index]?.contactName}')
                  ],
                ),
                Row(
                  children: [
                    Text("Email : "),
                    Text('${state.org.contactDetails?[index].contactEmail}')
                  ],
                ),
                Row(
                  children: [
                    Text("Mobile Number : "),
                    Text(
                        '${state.org.contactDetails?[index].contactMobileNumber}')
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
