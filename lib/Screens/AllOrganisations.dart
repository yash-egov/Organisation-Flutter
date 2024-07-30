import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/bloc/allOrganisations/all_organisations_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';

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
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Text(
          "All Organisations",
          style: DigitTheme.instance.mobileTypography.headingL,
        ),
        actions: [
          // SearchAnchor(),
        ],
      ),
      body: BlocBuilder<AllOrganisationsBloc, AllOrganisationsState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.allOrganisations.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    AutoRouter.of(context)
                        .push(SingleOrganisation(index: index));
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${state.allOrganisations[index].name}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${state.allOrganisations[index].tenantId}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
