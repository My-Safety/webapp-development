import 'package:flutter_test/flutter_test.dart';
import 'package:mysafety_web/core/model/resolve_qr/resolve_qr_response_model.dart';

void main() {
  test('parses typed vehicle emergency contacts', () {
    final response = ResolveQrResponseModel.fromJson({
      'vehicle': {
        '_id': 'vehicle-id',
        'emergencyContacts': [
          {'_id': 'contact-id', 'name': 'Bhavana', 'mobile': '7674062780'},
        ],
      },
    });

    final contacts = response.vehicle?.emergencyContacts;

    expect(contacts, hasLength(1));
    expect(contacts?.first.id, 'contact-id');
    expect(contacts?.first.name, 'Bhavana');
    expect(contacts?.first.mobile, '7674062780');
  });
}
