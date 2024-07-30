import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/Screens/AddressPreview.dart';
import 'package:organisations/Screens/ContactPreview.dart';
import 'package:organisations/Screens/FunctionPreview.dart';
import 'package:organisations/Screens/OrganisationDocumentsPreview.dart';
import 'package:organisations/bloc/allOrganisations/all_organisations_bloc.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class SingleOrganisation extends StatefulWidget {
  int index;
  SingleOrganisation(this.index, {super.key});

  @override
  State<SingleOrganisation> createState() => _SingleOrganisationState(index);
}

class _SingleOrganisationState extends State<SingleOrganisation> {
  int index;
  _SingleOrganisationState(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Text(
          "Preview Page",
          style: DigitTheme.instance.mobileTypography.headingL.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AllOrganisationsBloc, AllOrganisationsState>(
          builder: (context, state) {
            return ListView(
              children: [
                _buildInfoTile(
                  context,
                  label: 'Tenant ID',
                  value: state.allOrganisations[index].tenantId,
                ),
                _buildInfoTile(
                  context,
                  label: 'Name',
                  value: state.allOrganisations[index].name,
                ),
                _buildInfoTile(
                  context,
                  label: 'Application Status',
                  value: state.allOrganisations[index].applicationStatus,
                ),
                _buildInfoTile(
                  context,
                  label: 'External Reference Number',
                  value: state.allOrganisations[index].externalRefNumber,
                ),
                _buildSectionHeader(context, 'Organisation Address'),
                if (state.allOrganisations[index].orgAddress != null)
                  _buildListSection(
                    context,
                    state.allOrganisations[index].orgAddress!.length,
                    (addressindex) => AddressPreview(addressindex,
                        state.allOrganisations[index].orgAddress!),
                  ),
                _buildSectionHeader(context, 'Contact Details'),
                if (state.allOrganisations[index].contactDetails != null)
                  _buildListSection(
                    context,
                    state.allOrganisations[index].contactDetails!.length,
                    (contactindex) => ContactPreview(contactindex,
                        state.allOrganisations[index].contactDetails!),
                  ),
                _buildSectionHeader(context, 'Functions'),
                if (state.allOrganisations[index].functions != null)
                  _buildListSection(
                    context,
                    state.allOrganisations[index].functions!.length,
                    (funindex) => FunctionPreview(
                        funindex, state.allOrganisations[index].functions),
                  ),
                _buildSectionHeader(context, 'Organisation Documents'),
                if (state.allOrganisations[index].documents != null)
                  _buildListSection(
                    context,
                    state.allOrganisations[index].documents!.length,
                    (docIndex) => OrganisationDocumentsPreview(
                      docIndex,
                      state.allOrganisations[index].documents!,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildInfoTile(BuildContext context,
    {required String label, required String? value}) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
    title: Text(
      label,
      style: DigitTheme.instance.mobileTypography.headingM,
    ),
    subtitle: Text(
      value ?? 'N/A',
      style: DigitTheme.instance.mobileTypography.bodyL,
    ),
  );
}

Widget _buildSectionHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
    child: Text(
      title,
      style: DigitTheme.instance.mobileTypography.headingM.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildListSection(
    BuildContext context, int itemCount, Widget Function(int) itemBuilder) {
  return SizedBox(
    height: 200,
    width: double.infinity,
    // Set a height for the horizontal list
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: itemBuilder(index),
        );
      },
    ),
  );
}
