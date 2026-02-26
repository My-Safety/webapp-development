// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';
import 'package:mysafety_web/route/route_name.dart';
import 'package:mysafety_web/src/features/agora/presentation/provider/agora_provider.dart';
import 'package:mysafety_web/src/features/chat/presentation/provider/chat_provider.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_input_bar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_screen_appbar.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/chat_tile.dart';
import 'package:mysafety_web/src/features/chat/presentation/widget/predefined_message_tile.dart';
import 'package:mysafety_web/src/features/profile/presentation/provider/profile_provider.dart';
import 'package:mysafety_web/src/features/vehicle/presentation/provider/vehicle_provider.dart';
import 'package:mysafety_web/util/formator/date_formator.dart';

class OneToOneChatScreen extends ConsumerStatefulWidget {
  final String? roomId;
  final String? qrId;
  final String? visitorName;
  final String? profileType;
  final String? visitorId;
  const OneToOneChatScreen({
    super.key,
    this.roomId,
    this.qrId,
    this.visitorName,
    this.profileType,
    this.visitorId,
  });

  @override
  ConsumerState<OneToOneChatScreen> createState() => _OneToOneChatScreenState();
}

class _OneToOneChatScreenState extends ConsumerState<OneToOneChatScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  int _previousMessageCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _connectToChat();
      debugPrint('🔍 ProfileType: ${widget.profileType}');
      debugPrint('🔍 IsVehicle: ${widget.profileType == 'vehicle'}');
    });
  }

  void _scrollToBottom() {
    if (!mounted) return;
    if (_scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_scrollController.hasClients) return;
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _connectToChat() async {
    final roomId = widget.roomId;

    if (roomId != null) {
      debugPrint('🔵 Connecting to chat room: $roomId');
      await ref.read(oneToOneChatControllerProvider.notifier).connect(roomId);
    } else {
      debugPrint('🔴 No room ID available');
    }
  }

  Future<void> startCall(String qrId, String callType) async {
    final notifier = ref.read(agoraProvider.notifier);

    if (qrId.isEmpty) {
      debugPrint('⚠️ No QR ID available');
      return;
    }

    notifier.setCallInitiated(true);
    bool success = await notifier.startCall(
      qrId: qrId,
      callType: callType,
      visitorId: widget.visitorId ?? '',
    );

    if (success && mounted) {
      final roomId = widget.roomId;
      if (roomId != null) {
        context.push(
          '${RouteName.agoraAudioCall}?qrId=$qrId&roomId=$roomId&visitorId=${widget.visitorId ?? ''}',
        );
      } else {
        context.push(
          '${RouteName.agoraAudioCall}?qrId=$qrId&visitorId=${widget.visitorId ?? ''}',
        );
      }
    }
  }

  void goToreportScreen(qrId) {
    context.push('${RouteName.reportAccedent}?qrId=$qrId');
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(oneToOneChatControllerProvider);
    final controller = ref.read(oneToOneChatControllerProvider.notifier);
    final profile = ref.watch(profileProvider);
    final selectedIndex = ref.watch(selectedMessageIndexProvider);
    final qrId = widget.qrId ?? profile.qrId;
    final isVehicle = widget.profileType == 'vehicle';
    final isLostFound = widget.profileType == 'lostfound';
    final predefinedMessages = profile.predefinedMessages;

    debugPrint('🚗 isVehicle: $isVehicle');
    debugPrint('🔍 isLostFound: $isLostFound');
    debugPrint('📋 predefinedMessages count: ${predefinedMessages.length}');
    debugPrint('📋 predefinedMessages: $predefinedMessages');

    final visitorName =
        widget.visitorName ??
        profile.resolveQrResponse?.qr?.ownerId?.name ??
        'Visitor';

    // Auto-scroll when new messages arrive
    if (messages.length > _previousMessageCount) {
      _previousMessageCount = messages.length;
      _scrollToBottom();
    }

    return BaseLayout(
      canPop: true,
      backgroundColor: AppColors.primary,
      child: Expanded(
        child: Column(
          children: [
            ChatScreenAppBar(
              avatarUrl: '',
              userName: visitorName,
              status: controller.isOtherTyping ? 'typing...' : 'online',
              onAudioCall: () {
                startCall(qrId!, "audio");
              },
              onVideoCall: () {
                final roomId = widget.roomId;
                if (roomId != null) {
                  context.go(
                    '${RouteName.agoraVideoCall}?qrId=$qrId&roomId=$roomId',
                  );
                } else {
                  context.go('${RouteName.agoraVideoCall}?qrId=$qrId');
                }
              },
            ),
            Expanded(
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                children: [
                  if ((isVehicle || isLostFound) && predefinedMessages.isNotEmpty)
                    ...predefinedMessages.asMap().entries.map(
                      (entry) => PredefinedMessageTile(
                        title: entry.value.title ?? '',
                        isSelected: selectedIndex == entry.key,
                        onTap: () async {
                          if (!mounted) return;
                          await controller.sendText(
                            entry.value.message ?? '',
                            messageIndex: entry.key,
                          );

                          // Trigger auto call if audioId exists (only for vehicle)
                          if (isVehicle && entry.value.audioId != null && qrId != null) {
                            await ref
                                .read(vehicleProvider.notifier)
                                .initiateAutoCall(
                                  qrId: qrId,
                                  audioCode: entry.value.audioId!,
                                );
                          }

                          _scrollToBottom();
                        },
                      ),
                    ),
                  if (isVehicle)
                    PredefinedMessageTile(
                      title: 'Report',
                      backgroundColor: const Color(0xFFFDD1D2),
                      borderColor: Colors.red,
                      textColor: Colors.red,
                      isSelected: false,
                      onTap: () async {
                        if (qrId != null) {
                          // await ref
                          //     .read(vehicleProvider.notifier)
                          //     .initiateAutoCall(qrId: qrId, audioCode: "");
                        }
                        // Handle report action
                        goToreportScreen(qrId);
                      },
                    ),
                  ...messages.map(
                    (msg) => ChatTile(
                      isIncoming: msg.senderType != "Visitor",
                      messages: msg.content ?? '',
                      timeStamp: msg.createdAt != null
                          ? DateFormats.formatTime(msg.createdAt!)
                          : null,
                      status: msg.status,
                      name: msg.senderDetails?.name ?? '',
                      fileUrl: msg.messageType == 'Image' ? msg.mediaUrl : null,
                      imgUrl: '',
                    ),
                  ),
                ],
              ),
            ),
            ChatInputBar(
              chatController: _controller,
              onSend: () async {
                final text = _controller.text.trim();
                if (text.isEmpty) return;
                _controller.clear();
                await controller.sendText(text);
                if (!mounted) return;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) _scrollToBottom();
                });
              },
              onTyping: controller.sendTyping,
              isOtherTyping: controller.isOtherTyping,
              onAudioTap: () {},
              onMediaTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
