import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/bloc/allOrganisations/all_organisations_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';

@RoutePage()
class AllOrganisations extends StatefulWidget {
  const AllOrganisations({super.key});

  @override
  State<AllOrganisations> createState() => _AllOrganisationsState();
}

class _AllOrganisationsState extends State<AllOrganisations> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllOrganisationsBloc, AllOrganisationsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100.0, // Adjust according to your design
            backgroundColor: DigitTheme.instance.colorScheme.secondary,
            title: Text(
              "Organisations",
              style: DigitTheme.instance.mobileTypography.headingL,
            ),
            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(100.0),
            //   child: Container(
            //     padding: const EdgeInsets.fromLTRB(22, 20, 20, 20),
            //     child: Row(
            //       children: [
            //         Text(
            //           "Search Basis: ",
            //           style: TextStyle(fontSize: 20, color: Colors.white),
            //         ),
            //         SizedBox(
            //           width: MediaQuery.of(context).size.width / 1.8,
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: <Widget>[
            //               const SizedBox(width: 10),
            //               const Text(
            //                 'Name:',
            //                 style:
            //                     TextStyle(fontSize: 20.0, color: Colors.white),
            //               ),
            //               Checkbox(
            //                 checkColor: Colors.white,
            //                 activeColor: Colors.pink,
            //                 value: state.name,
            //                 onChanged: (bool? value) {
            //                   context
            //                       .read<AllOrganisationsBloc>()
            //                       .add(toggleNameEvent(value ?? false));
            //                 },
            //               ),
            //               const SizedBox(width: 10),
            //               const Text(
            //                 'TenantId:',
            //                 style:
            //                     TextStyle(fontSize: 20.0, color: Colors.white),
            //               ),
            //               Checkbox(
            //                 checkColor: Colors.white,
            //                 activeColor: Colors.pink,
            //                 value: state.tenant,
            //                 onChanged: (bool? value) {
            //                   context
            //                       .read<AllOrganisationsBloc>()
            //                       .add(toggleTenantEvent(value ?? false));
            //                 },
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            actions: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: SearchBar(
                  onChanged: (value) {
                    query = value;
                    print(query);
                    // print("name : ");
                    // print(context.read<AllOrganisationsBloc>().state.name);
                    // print("tenant : ");
                    // print(context.read<AllOrganisationsBloc>().state.tenant);
                    context
                        .read<AllOrganisationsBloc>()
                        .add(getQueryOrganisationsEvent(query));
                  },
                ),
              ),
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
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
