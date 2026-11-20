import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/navigation_service.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/provider/vehicle_provider.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/widgets/insurence_card.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/widgets/sos_item_widget.dart';
import 'package:mysafety_web/util/assets/assets.dart';

class ReportAccedentScreen extends ConsumerStatefulWidget {
  final String? qrId;
  const ReportAccedentScreen({super.key, this.qrId});

  @override
  ConsumerState<ReportAccedentScreen> createState() =>
      _ReportAccedentScreenState();
}

class _ReportAccedentScreenState extends ConsumerState<ReportAccedentScreen> {
  late VehicleNotifier provider;
  String? _callingContactKey;

  Future<void> _makeSosCall(String phoneNumber) async {
    await provider.makePhoneCall(phoneNumber);
  }

  Future<void> _handleEmergencyCall(String contactKey) async {
    if (_callingContactKey != null) return;

    final profile = ref.read(profileProvider);
    final qrId = widget.qrId ?? profile.qrId;

    if (qrId == null || qrId.isEmpty) {
      NavigationService.showErrorSnackbar(
        message: 'Unable to identify this vehicle QR.',
      );
      return;
    }

    setState(() => _callingContactKey = contactKey);

    final isSuccess = await ref
        .read(vehicleProvider.notifier)
        .initiateAutoCall(qrId: qrId, audioCode: null);

    if (!mounted) return;
    setState(() => _callingContactKey = null);

    if (isSuccess) {
      NavigationService.showSuccessSnackbar(
        message: 'Emergency call initiated successfully',
      );
    } else {
      NavigationService.showErrorSnackbar(
        message: 'Unable to initiate the emergency call. Please try again.',
      );
    }
  }

  String _maskedMobile(String? value) {
    final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
    if (digits.isEmpty) return 'Number unavailable';

    final localNumber = digits.length > 10
        ? digits.substring(digits.length - 10)
        : digits;
    final visibleCount = localNumber.length >= 4 ? 4 : 0;
    final maskCount = localNumber.length - visibleCount;
    final maskedPart = List.filled(maskCount, '*').join();
    final visiblePart = localNumber.substring(maskCount);
    final countryCode = localNumber.length == 10 ? '+91-' : '';

    return '$countryCode$maskedPart$visiblePart';
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: BrandText.white(data: title, fontWeight: FontWeight.w600),
    );
  }

  Widget _emptyContacts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: BrandRoundedContainer(
        borderColor: AppColors.white.withAlpha(38),
        borderRadius: 8,
        color: AppColors.darkBlue,
        child: const Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            children: [
              Image(image: AssetImage(Assets.user), width: 28, height: 28),
              SizedBox(width: 12),
              Expanded(
                child: BrandText.white(data: 'No emergency contacts available'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(vehicleProvider);
    provider = ref.read(vehicleProvider.notifier);
    final profile = ref.watch(profileProvider);
    final vehicle = profile.resolveQrResponse?.vehicle;
    final emergencyContacts = vehicle?.emergencyContacts ?? const [];

    return BaseLayout(
      showBgImage: false,
      appBar: const BrandAppBar(title: 'Report Accident'),
      floatingActionButton: BrandIconButton.next(
        width: 58,
        height: 58,
        onTap: () => Navigator.of(context).maybePop(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      child: Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 96),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InsurenceCard(
                title: 'Policies',
                insuranceName: vehicle?.insurance?.companyName ?? '',
                policyNumber: vehicle?.insurance?.policyNo ?? '',
              ),
              _sectionTitle('Contacts'),
              if (emergencyContacts.isEmpty)
                _emptyContacts()
              else
                ...emergencyContacts.asMap().entries.map((entry) {
                  final contact = entry.value;
                  final contactKey = contact.id ?? entry.key.toString();

                  return SosItemWidget(
                    imageUrl: Assets.user,
                    imageSize: 28,
                    title: contact.name,
                    subTitle: _maskedMobile(contact.mobile),
                    isLoading: _callingContactKey == contactKey,
                    onTap: () => _handleEmergencyCall(contactKey),
                  );
                }),
              _sectionTitle('Sos'),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.sosList.length,
                itemBuilder: (context, index) {
                  final item = provider.sosList[index];
                  return SosItemWidget(
                    imageUrl: item.icon,
                    title: item.title,
                    onTap: item.number == null
                        ? null
                        : () => _makeSosCall(item.number!),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
