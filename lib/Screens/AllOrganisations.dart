import 'package:digit_flutter_components/models/DropdownModels.dart';
import 'package:digit_flutter_components/models/toggleButtonModel.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_multiselect_dropdown.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_toggle_list.dart';
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
    String query = "";
    bool name = false;
    bool tenant = false;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Text(
          "Organisations",
          style: DigitTheme.instance.mobileTypography.headingL,
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(22, 20, 20, 20),
              // margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Row(
                children: [
                  Text(
                    "Search  Basis  : ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: MultiSelectDropDown<int>(
                      onOptionSelected:
                          (List<DropdownItem> selectedOptions) async {
                        print("Hi");
                        selectedOptions.forEach((e) {
                          if (e.code == '1') {
                            print("hey 1");

                            context
                                .read<AllOrganisationsBloc>()
                                .add(toggleNameEvent());
                          }
                          if (e.code == '2') {
                            print("hey 2");
                            context
                                .read<AllOrganisationsBloc>()
                                .add(toggleTenantEvent());
                          }
                        });
                        print(context.read<AllOrganisationsBloc>().state.name);
                        print(
                            context.read<AllOrganisationsBloc>().state.tenant);
                        // context.read<AllOrganisationsBloc>().add(
                        //     getQueryOrganisationsEvent(query, name, tenant));
                      },
                      options: const [
                        DropdownItem(code: '1', name: 'name'),
                        DropdownItem(code: '2', name: 'tenant'),
                      ],
                    ),
                  )
                ],
              ),
            )),
        actions: [
          Container(
              width: MediaQuery.of(context).size.width / 3,
              child: BlocBuilder<AllOrganisationsBloc, AllOrganisationsState>(
                builder: (context, state) {
                  return SearchBar(
                    onChanged: (value) {
                      query = value;
                      print(query);
                      print(name);
                      print(tenant);
                      context
                          .read<AllOrganisationsBloc>()
                          .add(getQueryOrganisationsEvent(query));
                    },
                    //  onSubmitted: context.read<AllOrganisationsBloc>().add(getQueryOrganisationsEvent(name)),
                  );
                },
              ))
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
