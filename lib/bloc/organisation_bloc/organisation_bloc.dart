import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:organisations/Models/Address.dart';
import 'package:organisations/Models/ContactDetails.dart';
import 'package:organisations/Models/Document.dart';
import 'package:organisations/Models/Functions.dart';
import 'package:organisations/Models/Identifier.dart';
import 'package:organisations/Models/Organisation.dart';

part 'organisation_event.dart';
part 'organisation_state.dart';

class OrganisationBloc extends Bloc<OrganisationEvent, OrganisationState> {
  OrganisationBloc() : super(OrganisationInitial()) {
    on<addOrganisationBasicDetailsEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: event.tenantId,
        name: event.name,
        applicationStatus: event.applicationStatus,
        externalRefNumber: event.externalRefNumber,
        dateOfIncorporation: event.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });
    on<addOrganisationAddressEvent>((event, emit) {
      // print("Inside Add Address bloc -- ");

      // print(event.address.doorNo);

      // print(List.from(state.org.orgAddress as Iterable)..add(event.address));
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: List.from(state.org.orgAddress as Iterable)
          ..add(event.address),
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      // print("Updated Org --");
      // print(updatedOrg.orgAddress?[0].doorNo);

      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationContactDetailEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: List.from(state.org.contactDetails as Iterable)
          ..add(event.contactDetail),
        identifiers: state.org.identifiers,
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationIdentifierEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: List.from(state.org.identifiers as Iterable)
          ..add(event.identifier),
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationDocumentEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: state.org.functions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: List.from(state.org.documents as Iterable)
          ..add(event.document),
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationFunctionEvent>((event, emit) {
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: List.from(state.org.functions as Iterable)
          ..add(event.functions),
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      emit(OrganisationUpdated(updatedOrg));
    });

    on<addOrganisationFunctionDocumentEvent>((event, emit) {
      print(event.functionIndex);
      print("Inside addOrganisationFunctionDocumentEvent 1");
      // Retrieve the current list of functions
      final updatedFunctions =
          List<Functions>.from(state.org.functions as Iterable);

      print("Inside addOrganisationFunctionDocumentEvent 2");

      // // Get the function that needs to be updated
      final functionToUpdate = updatedFunctions[event.functionIndex];

      print("Inside addOrganisationFunctionDocumentEvent 3");

      // Create a new FunctionOrg object with updated documents list
      final updatedFunction = Functions(
        type: functionToUpdate.type,
        category: functionToUpdate.category,
        className: functionToUpdate.className,
        validFrom: functionToUpdate.validFrom,
        validTo: functionToUpdate.validTo,
        documents: List<Document>.from(functionToUpdate.documents as Iterable)
          ..add(event.document),
        additionalDetails: functionToUpdate.additionalDetails,
      );
      print("Inside addOrganisationFunctionDocumentEvent 4");

      // Replace the old function with the updated function in the list
      updatedFunctions[event.functionIndex] = updatedFunction;

      print("Inside addOrganisationFunctionDocumentEvent 5");
      // Create a new Organisation object with the updated functions list
      final updatedOrg = Organisation(
        tenantId: state.org.tenantId,
        name: state.org.name,
        applicationStatus: state.org.applicationStatus,
        externalRefNumber: state.org.externalRefNumber,
        dateOfIncorporation: state.org.dateOfIncorporation,
        orgAddress: state.org.orgAddress,
        contactDetails: state.org.contactDetails,
        identifiers: state.org.identifiers,
        functions: updatedFunctions,
        jurisdiction: state.org.jurisdiction,
        isActive: state.org.isActive,
        documents: state.org.documents,
        additionalDetails: state.org.additionalDetails,
      );
      print("Inside addOrganisationFunctionDocumentEvent 6");
      // Emit the new state with the updated organisation
      emit(OrganisationUpdated(updatedOrg));
    });

    on<SubmitOrganisationEvent>((event, emit) async {
      // Fetch the current organisation state
      final Organisation currentOrg = state.org;

      // Here, you would typically make an API call to submit the organisation
      try {
        // Assume postOrganisation is a function that posts the data to the server
        await postOrganisation(currentOrg);

        // On success, emit a success state or handle accordingly
        emit(OrganisationSubmittedSuccess());
      } catch (error) {
        // On failure, emit a failure state or handle errors
        emit(OrganisationSubmissionFailed(currentOrg, error.toString()));
      }
    });
  }
  Dio dio = Dio();

  Future<void> postOrganisation(Organisation org) async {
    // Implement the actual API call or database submission here
    // For example, using an HTTP client to POST the data
    print("Hitting Post req");
    print(org);
    try {
      final data = {
        "RequestInfo": {
          "apiId": "apiId",
          "ver": "ver",
          "ts": 0,
          "action": "action",
          "did": "did",
          "key": "key",
          "msgId": "msgId",
          "requesterId": "requesterId",
          "authToken": "authToken",
          "userInfo": {"uuid": "0477b319-7cd3-4b5e-98ec-dc7ed140b623"}
        },
        "organisations": org.toJson(), // Convert Organisation object to JSON
      };
      final response = await dio.post(
        'http://localhost:8081/Backend_assignment/org-services/organisation/v1/_create',
        data: data, // Convert Organisation object to JSON
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // Handle the response accordingly
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
    } catch (error) {
      print('Error occurred: $error');
      throw error; // Rethrow error if needed
    }
    print("Org Address : ");

    for (int i = 0; i < state.org.orgAddress!.length; i++) {
      print(state.org.orgAddress?[i].tenantId);
      print(state.org.orgAddress?[i].doorNo);
    }
    print("Contact-Details");

    for (int i = 0; i < state.org.contactDetails!.length; i++) {
      print(state.org.contactDetails?[i].contactName);
      print(state.org.contactDetails?[i].contactMobileNumber);
      print(state.org.contactDetails?[i].contactEmail);
    }

    print("Identifiers : ");

    for (int i = 0; i < state.org.identifiers!.length; i++) {
      print(state.org.identifiers?[i].type);
      print(state.org.identifiers?[i].value);
    }

    print("Documents org : ");

    for (int i = 0; i < state.org.documents!.length; i++) {
      print(state.org.documents?[i].documentType);
      print(state.org.documents?[i].fileStore);
    }
    print(" org Functions : ");

    for (int i = 0; i < state.org.functions!.length; i++) {
      print(state.org.functions?[i].category);
      print(state.org.functions?[i].className);
      print(" org Functions Documents : ");

      for (int j = 0; j < (state.org.functions?[i]?.documents?.length)!; j++) {
        print(state.org.functions?[i].documents?[j].documentType);
        print(state.org.functions?[i].documents?[j]?.fileStore);
      }
    }

    // Handle the response and errors
  }
}
