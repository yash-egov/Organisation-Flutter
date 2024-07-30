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

  // Convert JSON to Organisation instance
  factory Organisation.fromJson(Map<String, dynamic> json) {
    return Organisation(
      tenantId: json['tenantId'],
      name: json['name'],
      applicationStatus: json['applicationStatus'],
      externalRefNumber: json['externalRefNumber'],
      dateOfIncorporation: json['dateOfIncorporation'],
      orgAddress: (json['orgAddress'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactDetails: (json['contactDetails'] as List<dynamic>?)
          ?.map((e) => ContactDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      identifiers: (json['identifiers'] as List<dynamic>?)
          ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      functions: (json['functions'] as List<dynamic>?)
          ?.map((e) => Functions.fromJson(e as Map<String, dynamic>))
          .toList(),
      jurisdiction: (json['jurisdiction'] as List<dynamic>?)
          ?.map((e) => Jurisdiction.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'],
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalDetails: json['additionalDetails'] ?? {},
    );
  }

  // Convert Organisation instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'tenantId': tenantId,
      'name': name,
      'applicationStatus': applicationStatus,
      'externalRefNumber': externalRefNumber,
      'dateOfIncorporation': dateOfIncorporation,
      'orgAddress': orgAddress?.map((e) => e.toJson()).toList(),
      'contactDetails': contactDetails?.map((e) => e.toJson()).toList(),
      'identifiers': identifiers?.map((e) => e.toJson()).toList(),
      'functions': functions?.map((e) => e.toJson()).toList(),
      'jurisdiction': jurisdiction?.map((e) => e.toJson()).toList(),
      'isActive': isActive,
      'documents': documents?.map((e) => e.toJson()).toList(),
      'additionalDetails': additionalDetails ?? {},
    };
  }
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

  Address({
    this.tenantId,
    this.doorNo,
    this.latitude,
    this.longitude,
    this.addressNumber,
    this.addressLine1,
    this.addressLine2,
    this.landmark,
    this.city,
    this.pincode,
    this.detail,
    this.buildingName,
    this.street,
    this.boundary,
    this.boundaryType,
  });

  // Convert JSON to Address instance
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      tenantId: json['tenantId'],
      doorNo: json['doorNo'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      addressNumber: json['addressNumber'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      landmark: json['landmark'],
      city: json['city'],
      pincode: json['pincode'],
      detail: json['detail'],
      buildingName: json['buildingName'],
      street: json['street'],
      boundary: json['boundary'] != null
          ? Boundary.fromJson(json['boundary'] as Map<String, dynamic>)
          : null,
      boundaryType: json['boundaryType'],
    );
  }

  // Convert Address instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'tenantId': tenantId,
      'doorNo': doorNo,
      'latitude': latitude,
      'longitude': longitude,
      'addressNumber': addressNumber,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'landmark': landmark,
      'city': city,
      'pincode': pincode,
      'detail': detail,
      'buildingName': buildingName,
      'street': street,
      'boundary': boundary?.toJson(),
      'boundaryType': boundaryType,
    };
  }
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

  // Convert JSON to Boundary instance
  factory Boundary.fromJson(Map<String, dynamic> json) {
    return Boundary(
      json['code'],
      json['name'],
      json['label'],
      json['latitude'],
      json['longitude'],
    );
  }

  // Convert Boundary instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'label': label,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class ContactDetail {
  String? contactName;
  String? contactMobileNumber;
  String? contactEmail;

  ContactDetail({
    this.contactName,
    this.contactMobileNumber,
    this.contactEmail,
  });

  // Convert JSON to ContactDetail instance
  factory ContactDetail.fromJson(Map<String, dynamic> json) {
    return ContactDetail(
      contactName: json['contactName'],
      contactMobileNumber: json['contactMobileNumber'],
      contactEmail: json['contactEmail'],
    );
  }

  // Convert ContactDetail instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'contactName': contactName,
      'contactMobileNumber': contactMobileNumber,
      'contactEmail': contactEmail,
    };
  }
}

class Identifier {
  String? type;
  String? value;
  bool? isActive;
  Map<String, dynamic>? additionalDetails;

  Identifier({
    this.type,
    this.value,
    this.isActive,
    this.additionalDetails,
  });

  // Convert JSON to Identifier instance
  factory Identifier.fromJson(Map<String, dynamic> json) {
    return Identifier(
      type: json['type'],
      value: json['value'],
      isActive: json['isActive'],
      additionalDetails: json['additionalDetails'] ?? {},
    );
  }

  // Convert Identifier instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
      'isActive': isActive,
      'additionalDetails': additionalDetails ?? {},
    };
  }
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

  // Convert JSON to Functions instance
  factory Functions.fromJson(Map<String, dynamic> json) {
    return Functions(
      type: json['type'],
      category: json['category'],
      className: json['class'],
      validFrom: json['validFrom'],
      validTo: json['validTo'],
      wfStatus: json['wfStatus'],
      isActive: json['isActive'],
      applicationStatus: json['applicationStatus'],
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalDetails: json['additionalDetails'] ?? {},
    );
  }

  // Convert Functions instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'category': category,
      'class': className,
      'validFrom': validFrom,
      'validTo': validTo,
      'wfStatus': wfStatus,
      'isActive': isActive,
      'applicationStatus': applicationStatus,
      'documents': documents?.map((e) => e.toJson()).toList(),
      'additionalDetails': additionalDetails ?? {},
    };
  }
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

  // Convert JSON to Jurisdiction instance
  factory Jurisdiction.fromJson(Map<String, dynamic> json) {
    return Jurisdiction(
      json['code'],
      json['jurisdictionId'],
      json['additionalDetails'] ?? {},
    );
  }

  // Convert Jurisdiction instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'jurisdictionId': jurisdictionId,
      'additionalDetails': additionalDetails ?? {},
    };
  }
}

class Document {
  String? id;
  String? documentType;
  String? fileStore;
  String? documentUid;
  Map<String, dynamic>? additionalDetails;

  Document({
    this.id,
    this.documentType,
    this.fileStore,
    this.documentUid,
    this.additionalDetails,
  });

  // Convert JSON to Document instance
  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      documentType: json['documentType'],
      fileStore: json['fileStore'],
      documentUid: json['documentUid'],
      additionalDetails: json['additionalDetails'] ?? {},
    );
  }

  // Convert Document instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentType': documentType,
      'fileStore': fileStore,
      'documentUid': documentUid,
      'additionalDetails': additionalDetails ?? {},
    };
  }
}

class responseSearch {
  String? ResponseInfo;
  List<Organisation>? organisations;
}
