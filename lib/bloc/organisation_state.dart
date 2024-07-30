part of 'organisation_bloc.dart';

@immutable
abstract class OrganisationState {
  final Organisation org;

  OrganisationState(this.org);
}

class OrganisationInitial extends OrganisationState {
  OrganisationInitial()
      : super(Organisation(
          tenantId: '',
          name: '',
          applicationStatus: '',
          externalRefNumber: '',
          dateOfIncorporation: 0,
          orgAddress: [],
          contactDetails: [],
          identifiers: [],
          functions: [],
          jurisdiction: [],
          isActive: true,
          documents: [],
          additionalDetails: {},
        ));
}

class OrganisationUpdated extends OrganisationState {
  OrganisationUpdated(Organisation org) : super(org);
}

class OrganisationSubmittedSuccess extends OrganisationState {
  OrganisationSubmittedSuccess() : super(new Organisation());
}

class OrganisationSubmissionFailed extends OrganisationState {
  final String error;

  OrganisationSubmissionFailed(Organisation org, this.error) : super(org);
}
