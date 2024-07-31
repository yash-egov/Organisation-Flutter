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
