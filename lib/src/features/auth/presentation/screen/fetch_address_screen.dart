// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mysafety_design_system/design_system/design_system.dart';
// import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:mysafety_web/util/location/location_manager.dart';

class FetchAddressScreen extends ConsumerStatefulWidget {
  const FetchAddressScreen({super.key});

  @override
  ConsumerState<FetchAddressScreen> createState() => _FetchAddressScreenState();
}

class _FetchAddressScreenState extends ConsumerState<FetchAddressScreen> {
  late ProfileNotifierProvider provider;

  Future<void> fetchAddress() async {
    provider.setIsAddressLoading = true;

    var location = await LocationManager.getCurrentLocation();

    provider.setIsAddressLoading = false;

    if (location == null) return;

    provider.getAddressFromLatLng(
      latlng: LatLng(location.latitude, location.longitude),
    );
  }

  // void gotoAddAddressScreen() {
  //   context.pushReplacement(RouteName.addAddress);
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(profileProvider);
    provider = ref.read(profileProvider.notifier);
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
                  if (provider.user?.address != null) ...[
                    BrandText.white(
                      data: provider.user?.address?.fulladdress ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ] else
                    BrandText.white(data: context.loc.fetching_your_location),
                  if (provider.isAddressLoading) BrandLoaderWidget(width: 55),
                ],
              ),
            ),
            // if (!provider.isAddressLoading)
            //   Positioned(
            //     bottom: 60,
            //     right: 16,
            //     child: Align(
            //       alignment: Alignment.centerRight,
            //       child: BrandIconButton.next(onTap: gotoAddAddressScreen),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
