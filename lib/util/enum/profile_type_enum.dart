enum ProfileType {
  doorbell,
  vehicle,
  lostfound,
  smartcard;

  static ProfileType? fromString(String? value) {
    if (value == null) return null;
    return ProfileType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ProfileType.doorbell,
    );
  }
}
