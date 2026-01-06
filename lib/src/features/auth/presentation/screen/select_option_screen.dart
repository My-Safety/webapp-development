import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/auth/presentation/widgets/action_box.dart';
import 'package:mysafety_web/util/assets/assets.dart';
import 'package:mysafety_web/util/extension/extension.dart';

class SelectOptionScreen extends StatefulWidget {
  const SelectOptionScreen({super.key});

  @override
  State<SelectOptionScreen> createState() => _SelectOptionScreenState();
}

class _SelectOptionScreenState extends State<SelectOptionScreen> {
  void gotoOneToOneChatScreen() {
    context.go(RouteName.oneToOneChatScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: BrandAppBar(title: context.loc.enter_otp, centerTitle: false),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(),
              BrandVSpace.gap12(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionBox(
                    title: 'Audio Call',
                    assetPath: Assets.audioCall,
                    onTap: () {},
                  ),
                  ActionBox(
                    title: 'Video Call',
                    assetPath: Assets.videoCall,
                    onTap: () {},
                  ),
                  ActionBox(
                    title: 'Chat',
                    assetPath: Assets.chat,
                    onTap: () => gotoOneToOneChatScreen(),
                  ),
                ],
              ),
              BrandVSpace.gap100(),
            ],
          ),
        ),
      ),
    );
  }
}
