import 'package:digit_flutter_components/enum/app_enums.dart';
import 'package:digit_flutter_components/theme/digit_theme.dart';
import 'package:digit_flutter_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organisations/Constants/text.dart';

import 'package:auto_route/auto_route.dart';
import 'package:organisations/Models/Organisation.dart';
import 'package:organisations/Screens/AddressPreview.dart';
import 'package:organisations/Screens/ContactPreview.dart';
import 'package:organisations/Screens/FunctionPreview.dart';
import 'package:organisations/Screens/OrganisationDocumentsPreview.dart';
import 'package:organisations/bloc/organisation_bloc/organisation_bloc.dart';
import 'package:organisations/router/app_router.gr.dart';

@RoutePage()
class PreviewOrganisation extends StatefulWidget {
  Organisation org;
  String screen;
  bool preview;
  PreviewOrganisation(this.screen, this.org, this.preview, {super.key});

  @override
  State<PreviewOrganisation> createState() =>
      _PreviewOrganisationState(screen, org, preview);
}

class _PreviewOrganisationState extends State<PreviewOrganisation> {
  String screen;
  Organisation org;
  bool preview;
  _PreviewOrganisationState(this.screen, this.org, this.preview);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MyFontStyle.appbarHeight,
        backgroundColor: DigitTheme.instance.colorScheme.secondary,
        title: Center(
          child: Text(
            screen,
            style: DigitTheme.instance.mobileTypography.headingL.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildInfoTile(
              context,
              label: 'Tenant ID',
              value: org.tenantId,
            ),
            _buildInfoTile(
              context,
              label: 'Name',
              value: org.name,
            ),
            _buildInfoTile(
              context,
              label: 'Application Status',
              value: org.applicationStatus,
            ),
            _buildInfoTile(
              context,
              label: 'External Reference Number',
              value: org.externalRefNumber,
            ),
            _buildSectionHeader(context, 'Organisation Address'),
            if (org.orgAddress != null)
              _buildListSection(
                context,
                org.orgAddress!.length,
                (index) => AddressPreview(index, org.orgAddress!),
              ),
            _buildSectionHeader(context, 'Contact Details'),
            if (org.contactDetails != null)
              _buildListSection(
                context,
                org.contactDetails!.length,
                (index) => ContactPreview(index, org.contactDetails!),
              ),
            _buildSectionHeader(context, 'Functions'),
            if (org.functions != null)
              _buildListSection(
                context,
                org.functions!.length,
                (index) => FunctionPreview(index, org.functions!),
              ),
            _buildSectionHeader(context, 'Organisation Documents'),
            if (org.documents != null)
              _buildListSection(
                context,
                org.documents!.length,
                (index) => OrganisationDocumentsPreview(index, org.documents!),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<OrganisationBloc, OrganisationState>(
          builder: (context, state) {
            return DigitButton(
              label: 'Submit',
              onPressed: () {
                context.read<OrganisationBloc>().add(SubmitOrganisationEvent());
                AutoRouter.of(context).push(Home());
              },
              type: ButtonType.primary,
            );
          },
        ),
      ),
    );
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
      // height: 200, // Set the height to limit the space
      width: double.infinity, // Takes the full width available
      child: Column(
        children: List.generate(
          itemCount,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0), // Adjust vertical padding as needed
            child: itemBuilder(index),
          ),
        ),
      ),
    );
  }
}
