// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';

class AddressPreview extends StatefulWidget {
  int index;
  List<Address>? addresses;
  AddressPreview(this.index, this.addresses, {super.key});

  @override
  State<AddressPreview> createState() => _AddressPreviewState(index);
}

class _AddressPreviewState extends State<AddressPreview> {
  int index;
  _AddressPreviewState(this.index);
  @override
  Widget build(BuildContext context) {
    final address = widget.addresses?[widget.index];
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
                  "Address : ${index + 1}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [Text("TenantId : "), Text('${address?.tenantId}')],
                ),
                Row(
                  children: [Text("City : "), Text('${address?.city}')],
                ),
                Row(
                  children: [Text("Pincode : "), Text('${address?.pincode}')],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
