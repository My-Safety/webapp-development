enum DocumentCategory {
  rc,
  insurance,
  drivingLicense,
  panCard,
  aadharCard,
  healthInsurance,
  pollution,
}

extension DocumentCategoryExtension on DocumentCategory {
  String get value {
    switch (this) {
      case DocumentCategory.rc:
        return 'RC';
      case DocumentCategory.insurance:
        return 'Insurance';
      case DocumentCategory.drivingLicense:
        return 'Driving_License';
      case DocumentCategory.panCard:
        return 'PAN_Card';
      case DocumentCategory.aadharCard:
        return 'Aadhar_Card';
      case DocumentCategory.healthInsurance:
        return 'Health_Insurance';
      case DocumentCategory.pollution:
        return 'Pollution';
    }
  }
}
