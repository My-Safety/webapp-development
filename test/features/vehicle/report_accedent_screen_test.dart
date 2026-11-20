import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mysafety_web/core/model/profile/state/profile_state.dart';
import 'package:mysafety_web/core/model/resolve_qr/resolve_qr_response_model.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/screens/report_accedent_screen.dart';

class _FakeProfileNotifier extends ProfileNotifierProvider {
  _FakeProfileNotifier(super.ref, ProfileState initialState) {
    state = initialState;
  }
}

void main() {
  testWidgets('shows typed emergency contacts with masked numbers', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    const profileState = ProfileState(
      qrId: 'vehicle-qr-id',
      resolveQrResponse: ResolveQrResponseModel(
        vehicle: Vehicle(
          insurance: Insurance(
            companyName: 'Acko General Insurance Limited',
            policyNo: 'POLICY1234',
          ),
          emergencyContacts: [
            EmergencyContact(
              id: 'contact-1',
              name: 'Bhavana',
              mobile: '7674062780',
            ),
            EmergencyContact(
              id: 'contact-2',
              name: 'Prajwl',
              mobile: '9743041358',
            ),
          ],
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          profileProvider.overrideWith(
            (ref) => _FakeProfileNotifier(ref, profileState),
          ),
        ],
        child: const MaterialApp(
          home: ReportAccedentScreen(qrId: 'vehicle-qr-id'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Bhavana'), findsOneWidget);
    expect(find.text('Prajwl'), findsOneWidget);
    expect(find.text('+91-******2780'), findsOneWidget);
    expect(find.text('+91-******1358'), findsOneWidget);
    expect(find.text('7674062780'), findsNothing);
    expect(find.text('9743041358'), findsNothing);
    expect(find.text('Police (100)'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
