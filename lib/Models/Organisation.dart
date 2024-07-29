class Organisation {
  String? tenantId;
  String? name;
  String? applicationStatus;
  String? externalRefNumber;
  int? dateOfIncorporation;
  List<Address>? orgAddress;
  List<ContactDetail>? contactDetails;
  List<Identifier>? identifiers;
  List<Functions>? functions;
  List<Jurisdiction>? jurisdiction;
  bool? isActive;
  List<Document>? documents;
  Map<String, dynamic>? additionalDetails;

  Organisation({
    this.tenantId,
    this.name,
    this.applicationStatus,
    this.externalRefNumber,
    this.dateOfIncorporation,
    this.orgAddress,
    this.contactDetails,
    this.identifiers,
    this.functions,
    this.jurisdiction,
    this.isActive,
    this.documents,
    this.additionalDetails,
  });

  copyWith({required List orgAddress}) {}
}

class Address {
  String? tenantId;
  String? doorNo;
  double? latitude;
  double? longitude;
  String? addressNumber;
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? city;
  String? pincode;
  String? detail;
  String? buildingName;
  String? street;
  Boundary? boundary;
  String? boundaryType;
}

class Boundary {
  String code;
  String name;
  String label;
  double latitude;
  double longitude;

  Boundary(
    this.code,
    this.name,
    this.label,
    this.latitude,
    this.longitude,
  );
}

class ContactDetail {
  String? contactName;
  String? contactMobileNumber;
  String? contactEmail;

  // ContactDetail(this.contactName, this.contactMobileNumber, this.contactEmail);
}

class Identifier {
  String? type;
  String? value;
  bool? isActive;
  Map<String, dynamic>? additionalDetails;

  // Identifier(
  //   this.type,
  //   this.value,
  //   this.isActive,
  //   this.additionalDetails,
  // );
}

class Functions {
  String? type;
  String? category;
  String? className;
  int? validFrom;
  int? validTo;
  String? wfStatus;
  bool? isActive;
  String? applicationStatus;
  List<Document>? documents;
  Map<String, dynamic>? additionalDetails;

  Functions({
    this.type,
    this.category,
    this.className,
    this.validFrom,
    this.validTo,
    this.wfStatus,
    this.isActive,
    this.applicationStatus,
    this.documents,
    this.additionalDetails,
  });
}

class Jurisdiction {
  String code;
  String jurisdictionId;
  Map<String, dynamic> additionalDetails;

  Jurisdiction(
    this.code,
    this.jurisdictionId,
    this.additionalDetails,
  );
}

class Document {
  String? id;
  String? documentType;
  String? fileStore;
  String? documentUid;
  Map<String, dynamic>? additionalDetails;

  // Document(
  //   this.id,
  //   this.documentType,
  //   this.fileStore,
  //   this.documentUid,
  //   this.additionalDetails,
  // );
}
