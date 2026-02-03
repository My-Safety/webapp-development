// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 15/11/2025

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/extension/extension.dart';

class FetchLocation extends ConsumerStatefulWidget {
  const FetchLocation({super.key});

  @override
  ConsumerState<FetchLocation> createState() => _FetchLocationState();
}

class _FetchLocationState extends ConsumerState<FetchLocation> {
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => fetchAddress());
  }

  // Future<void> fetchAddress() async {
  //   final provider = ref.read(profileProvider.notifier);
  //   final state = ref.read(profileProvider);

  //   // Step 2: Get location
  //   var location = await LocationManager.getCurrentLocation();
  //   if (location == null) {
  //     provider.setIsAddressLoading = false;
  //     setState(() => errorMessage = 'Unable to get location');
  //     return;
  //   }

  //   debugPrint('📍 Location: ${location.latitude}, ${location.longitude}');

  //   // // Step 3: Get address from lat/lng
  //   // await provider.getAddressFromLatLng(
  //   //   latlng: LatLng(location.latitude, location.longitude),
  //   // );

  //   // Step 4: Resolve QR
  //   await provider.resolveQr(
  //     qrId: state.qrId ?? '',
  //     latitude: location.latitude.toString(),
  //     longitude: location.longitude.toString(),
  //   );

  //   provider.setIsAddressLoading = false;

  //   // Step 5: Check if profile exists
  //   final resolveResponse = ref.read(profileProvider).resolveQrResponse;
  //   if (resolveResponse == null) {
  //   } else {
  //     if (mounted) {
  //     }
  //   }
  // }
  void moveToSelectLang() {
    context.pushReplacement(RouteName.selectLanguageScreen);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);
    final isLoading = state.isAddressLoading;
    final address = state.addressModel?.address;
    final hasAddress = address != null;

    return BaseLayout(
      child: Expanded(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: context.screenHeight * 0.3,
              bottom: 0,
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      Assets.fetchLocationIcon,
                      width: 40,
                      height: 76,
                    ),
                  ),
                  BrandVSpace.gap30(),
                  BrandText.white(
                    data: context.loc.address,
                    fontWeight: FontWeight.w600,
                  ),
                  BrandVSpace.gap10(),
                  if (address != null) ...[
                    BrandText.white(data: address, textAlign: TextAlign.center),
                  ] else if (!isLoading) ...[
                    BrandText.white(
                      data: 'Unable to get location',
                      textAlign: TextAlign.center,
                      fontColor: Colors.red,
                    ),
                    BrandVSpace.gap16(),
                    // ElevatedButton(
                    //   onPressed: fetchAddress,
                    //   child: const Text('Retry'),
                    // ),
                  ] else
                    BrandText.white(data: context.loc.fetching_your_location),
                  if (isLoading) BrandLoaderWidget(width: 55),
                ],
              ),
            ),
            if (hasAddress && !isLoading && errorMessage == null)
              Positioned(
                bottom: 60,
                right: 16,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: BrandIconButton.next(
                    onTap: () =>
                        context.pushReplacement(RouteName.selectLanguageScreen),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
