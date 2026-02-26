import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/provider/vehicle_provider.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/widgets/insurence_card.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/widgets/sos_item_widget.dart';
import 'package:mysafety_web/util/extension/extension.dart';

class ReportAccedentScreen extends ConsumerStatefulWidget {
  final String? qrId;
  const ReportAccedentScreen({super.key, this.qrId});

  @override
  ConsumerState<ReportAccedentScreen> createState() =>
      _ReportAccedentScreenState();
}

class _ReportAccedentScreenState extends ConsumerState<ReportAccedentScreen> {
  late VehicleNotifier provider;

  void onTap(String phoneNumber) async {
    provider.makePhoneCall(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(vehicleProvider);
    provider = ref.read(vehicleProvider.notifier);
    final profile = ref.watch(profileProvider);
    return BaseLayout(
      showBgImage: false,
      // appBar: BrandAppBar(title: context.loc.report_accedent),
      appBar: BrandAppBar(title: "Report Accident"),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InsurenceCard(
                title: "Policies",
                insuranceName:profile.resolveQrResponse?.vehicle?.insurance?.companyName??"",
                policyNumber: profile.resolveQrResponse?.vehicle?.insurance?.policyNo??"",
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BrandText.white(data: "Contacts"),
              ),
              SosItemWidget(
                title: "Emergency contact",
                onTap: () async {
                  if (widget.qrId != null) {
                    await ref
                        .read(vehicleProvider.notifier)
                        .initiateAutoCall(qrId: widget.qrId!, audioCode: "");
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BrandText.white(data: "Sos Contacts"),
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: provider.sosList.length,
                itemBuilder: (context, index) {
                  var item = provider.sosList[index];
                  return SosItemWidget(
                    imageUrl: item.icon,
                    title: item.title,
                    subTitle: item.number,
                    onTap: () {
                      onTap(item.number!);
                    },
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
