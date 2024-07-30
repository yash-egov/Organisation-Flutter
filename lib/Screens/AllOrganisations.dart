import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class AllOrganisations extends StatefulWidget {
  const AllOrganisations({super.key});

  @override
  State<AllOrganisations> createState() => _AllOrganisationsState();
}

class _AllOrganisationsState extends State<AllOrganisations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organisations"),
      ),
    );
  }
}
