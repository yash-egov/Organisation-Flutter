import 'package:organisations/Models/Document.dart';

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
