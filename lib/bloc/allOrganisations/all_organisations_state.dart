part of 'all_organisations_bloc.dart';

@immutable
class AllOrganisationsState {
  List<Organisation> allOrganisations;
  AllOrganisationsState(this.allOrganisations);
}

final class AllOrganisationsInitial extends AllOrganisationsState {
  AllOrganisationsInitial() : super([]);
}

class AllOrganisationsUpdated extends AllOrganisationsState {
  AllOrganisationsUpdated(List<Organisation> allorg) : super(allorg);
}
