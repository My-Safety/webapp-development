import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysafety_design_system/design_system/theme/_theme.dart';
import 'package:mysafety_web/core/model/resolve_qr/resolve_qr_response_model.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/src/features/smartcard/presentation/widgets/profile_card.dart';
import 'package:mysafety_web/src/features/smartcard/presentation/widgets/social_link_item.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/location/location_manager.dart';
import 'package:web/web.dart' as web;
import 'package:share_plus/share_plus.dart';

class SmartCardScreen extends ConsumerStatefulWidget {
  final String? qrId;
  const SmartCardScreen({super.key, this.qrId});

  @override
  ConsumerState<SmartCardScreen> createState() => _SmartCardScreenState();
}

class _SmartCardScreenState extends ConsumerState<SmartCardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSmartcardData();
    });
  }

  Future<void> _loadSmartcardData() async {
    final provider = ref.read(profileProvider.notifier);
    final qrId = widget.qrId ?? _getQrIdFromUrl();

    if (qrId.isNotEmpty) {
      provider.setQrId = qrId;

      // Call API immediately without waiting for location
      provider.resolveQr(qrId: qrId, location: null);

      // Get location in background (optional)
      LocationManager.getCurrentLocation().then((location) {
        if (location != null) {
          // Location can be used for analytics or future calls
        }
      });
    }
  }

  String _getQrIdFromUrl() {
    final uri = Uri.parse(web.window.location.href);
    return uri.queryParameters['qrId'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    final isLoading = profile.isHandleDoorBellLoading;
    final smartcard = profile.resolveQrResponse?.smartcard;
    final activeSocialLinks =
        smartcard?.activeSocialLinks
            ?.where((link) => link.isActive == true)
            .toList() ??
        [];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF151515), AppColors.primary],
          stops: [0.39, 0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.share, color: Colors.white),
              onPressed: () => _shareProfile(smartcard),
            ),
          ],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      _buildLogo(),
                      ProfileCard(
                        displayName: smartcard?.displayName ?? 'User',
                        bio: smartcard?.bio ?? '',
                        avatarUrl:
                            profile.resolveQrResponse?.qr?.ownerId?.avatarUrl
                                ?.toString() ??
                            '',
                      ),
                      const SizedBox(height: 40),
                      if (activeSocialLinks.isNotEmpty)
                        _buildSocialLinks(activeSocialLinks),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(Assets.logoprimery, height: 200, fit: BoxFit.contain);
  }

  Widget _buildSocialLinks(List activeSocialLinks) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 24,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: activeSocialLinks
            .map((link) => SocialLinkItem(socialLink: link))
            .toList(),
      ),
    );
  }

  void _shareProfile(Smartcard? smartcard) {
    final url = smartcard?.siteUrl ?? '';

    final shareText =
        '''Hey
Let's connect and grow together
Check out my TapOnn profile

$url

Build your Networ(k)th with TapOnn''';

    Share.share(shareText);
  }
}
