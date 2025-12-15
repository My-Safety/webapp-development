// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Suresh M, 16/11/2025

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/contsants/limit_contstants.dart';
import 'package:mysafety_web/util/extension/extension.dart';
import 'package:mysafety_web/util/validator/validator.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  final dynamic rouetArgs;
  const AddAddressScreen({super.key, this.rouetArgs});

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  late ProfileNotifierProvider provider;

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController addressController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  TextEditingController landmarkontroller = TextEditingController();

  Future<void> nextOnTap() async {
    bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      gotoSelectLanguageScreen();
    }
  }

  void gotoSelectLanguageScreen() {
    context.push(RouteName.selectLanguageScreen);
  }

  Future<void> init() async {
    var address = provider.user?.address;
    addressController.text = address?.fulladdress ?? '';
    pincodeController.text = address?.pincode ?? '';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(profileProvider);
    provider = ref.read(profileProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(
        title: context.loc.add_address_details,
        centerTitle: false,
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BrandVSpace.gap60(),
                        BrandTextField(
                          label: context.loc.full_address,
                          hintText: context.loc.please_add_your_full_address,
                          controller: addressController,
                          maxLines: 5,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                              LimitContstants.maxAddressLength,
                            ),
                          ],
                          validator: (value) {
                            return Validator.nameValidator(
                              context: context,
                              value: value,
                              errorMessage:
                                  context.loc.please_add_your_full_address,
                            );
                          },
                          onChanged: (value) {
                            provider.updateFullAddress(value);
                          },
                        ),
                        BrandVSpace.gap26(),
                        BrandTextField(
                          label: context.loc.pincode,
                          hintText: context.loc.pincode,
                          controller: pincodeController,
                          validator: (value) =>
                              Validator.empty(context: context, value: value),
                          onChanged: (value) {
                            provider.updatePincode(value);
                          },
                        ),
                        BrandVSpace.gap26(),
                        BrandTextField(
                          label: context.loc.landmark,
                          hintText: context.loc.landmark,
                          controller: landmarkontroller,
                          validator: (value) =>
                              Validator.empty(context: context, value: value),
                          onChanged: (value) {
                            provider.updateLandmark(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BrandIconButton.next(
                        height: 60,
                        width: 60,
                        onTap: nextOnTap,
                      ),
                    ],
                  ),
                  BrandVSpace.gap100(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
