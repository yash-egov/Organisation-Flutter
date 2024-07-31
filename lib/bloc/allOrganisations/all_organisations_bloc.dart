import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:organisations/Models/Organisation.dart';

part 'all_organisations_event.dart';
part 'all_organisations_state.dart';

class AllOrganisationsBloc
    extends Bloc<AllOrganisationsEvent, AllOrganisationsState> {
  AllOrganisationsBloc() : super(AllOrganisationsInitial()) {
    on<toggleNameEvent>((event, emit) {
      print("toggling name event");
      state.name = event.value;
    });
    on<toggleTenantEvent>((event, emit) {
      print("toggling tenant event");
      state.tenant = event.value;
    });
    on<AllOrganisationsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<getAllOrganisationsEvent>((event, emit) async {
      // Fetch the current organisation state

      // Here, you would typically make an API call to submit the organisation
      try {
        // Assume postOrganisation is a function that posts the data to the server
        await getAllOrganisations("");
        // print("back here");
        // print(state.allOrganisations);
        // On success, emit a success state or handle accordingly
        // emit();
      } catch (error) {
        // On failure, emit a failure state or handle errors
      }
    });
    on<getQueryOrganisationsEvent>((event, emit) async {
      try {
        await getAllOrganisations(event.query);
      } catch (error) {
        // On failure, emit a failure state or handle errors
      }
    });
  }

  Dio dio = Dio();

  Future<void> getAllOrganisations(String query) async {
    // Implement the actual API call or database submission here
    // For example, using an HTTP client to POST the data
    print("Hitting get req");
    // name = true;
    try {
      // Define the request data, if needed
      var data = {};
      if (state.name) {
        data = {
          "name": query,
        };
      }
      if (state.tenant) {
        data = {
          "tenantId": query,
        };
      }
      if (state.name && state.tenant) {
        data = {
          "name": query,
          "tenantId": query,
        };
      }
      print(data);
      // Make the HTTP POST request
      dynamic response = await dio.post(
        'http://localhost:8081/Backend_assignment/org-services/organisation/v1/_search',
        data: data, // Convert Organisation object to JSON if needed
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // Check if the response contains valid data and is of the correct type
      if (response.data != null && response.data is Map) {
        var responseData = response.data as Map<String, dynamic>;
        var dynamicOrgList = responseData['organisations'];

        // Ensure dynamicOrgList is not null and is a list
        if (dynamicOrgList != null && dynamicOrgList is List) {
          // Convert the list of dynamic maps to a list of Organisation objects
          List<Organisation> organisations = dynamicOrgList
              .map((org) => Organisation.fromJson(org as Map<String, dynamic>))
              .toList();

          // Now you can work with the 'organisations' data
          print(organisations);
          emit(AllOrganisationsUpdated(
              organisations)); // Emit the new state with the list of organisations
        } else {
          print("The 'organisations' list is null or not a list");
        }
      } else {
        print("Unexpected response structure: ${response.data}");
      }

      // Log the response status code
      print('Response status: ${response.statusCode}');
    } catch (error) {
      print('Error occurred: $error');
      throw error; // Optionally rethrow the error if further handling is needed
    }
  }
}
