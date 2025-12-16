// Copyright (c) 2025, Indo-Sakura Software Pvt Ltd. All rights reserved.
// Created By Adwaith c, 16/12/2025



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/common/widget/selectable_chip.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/util/extension/extension.dart';

class SelectLanguageScreen extends ConsumerStatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  ConsumerState<SelectLanguageScreen> createState() =>
      _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends ConsumerState<SelectLanguageScreen> {
  late ProfileNotifierProvider provider;

  Future<void> getLanguage() async {
    await provider.getLanguages();
  }


  // ref.read(profileProvider.notifier).handleDoorBellScan();

  Future<void> nextOnTap() async {
    gotoLoginScreen();
  }

  void gotoLoginScreen() {
    context.go(RouteName.login);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getLanguage();
      // await handleDoorBellScan();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(profileProvider);
    provider = ref.read(profileProvider.notifier);
    return BaseLayout(
      appBar: BrandAppBar(
        title: context.loc.select_language,
        centerTitle: false,
      ),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .spaceBetween,
            children: [
              Column(
                children: [
                  BrandVSpace.gap26(),

                  if (provider.isLanguageListLoading)
                    BrandLoaderWidget(width: 55)
                  else if (provider.globalLanguages.isNotEmpty) ...[
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        BrandText.white(
                          data: context.loc.international_language,
                          fontWeight: .w500,
                          fontFamily: BrandFontFamily.inter,
                        ),
                        BrandVSpace.gap10(),
                        Wrap(
                          spacing: 16,
                          runSpacing: 26,
                          children: provider.globalLanguages
                              .map(
                                (e) => SelectableChip(
                                  title: e.name,
                                  isSelected:
                                      provider.selectedLanguages?.id == e.id,
                                  onTap: () {
                                    provider.setSelectedLanguage = e;
                                  },
                                ),
                              )
                              .toList(),
                        ),
                        BrandVSpace.gap10(),
                      ],
                    ),
                    BrandVSpace.gap40(),
                  ],
                  if (provider.localLanguages.isNotEmpty) ...[
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        BrandText.white(
                          data: context.loc.regional_language,
                          fontWeight: .w500,
                          fontFamily: BrandFontFamily.inter,
                        ),
                        BrandVSpace.gap10(),
                        Wrap(
                          spacing: 16,
                          runSpacing: 26,
                          children: provider.localLanguages
                              .map(
                                (e) => SelectableChip(
                                  title: e.name,
                                  isSelected:
                                      provider.selectedLanguages?.id == e.id,
                                  onTap: () {
                                    provider.setSelectedLanguage = e;
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: .centerRight,
                    child: BrandIconButton.next(
                      onTap: () {
                        if (provider.selectedLanguages != null) {
                          nextOnTap();
                        }
                      },
                      isDisable: provider.selectedLanguages == null,
                    ),
                  ),
                  BrandVSpace.gap60(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
