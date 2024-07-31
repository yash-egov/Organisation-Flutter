// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Models/Address.dart';
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
                    "Address : ${index + 1}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("TenantId : "),
                      Text('${address?.tenantId}')
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("City : "), Text('${address?.city}')],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Pincode : "), Text('${address?.pincode}')],
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
