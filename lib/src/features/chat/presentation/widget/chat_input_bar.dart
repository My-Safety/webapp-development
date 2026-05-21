import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class ChatInputBar extends StatefulWidget {
  final VoidCallback onSend;
  final Future<void> Function(PlatformFile) onMediaTap;
  final Function(bool) onTyping;
  final bool isOtherTyping;
  final TextEditingController chatController;
  final FocusNode? chatFocusNode;
  final VoidCallback onAudioTap;
  final bool isUploading;
  final bool showMediaButton;
  final bool isRecording;
  final int recordingDuration;
  final VoidCallback onStartRecording;
  final VoidCallback onStopRecording;
  final VoidCallback onCancelRecording;

  const ChatInputBar({
    super.key,
    required this.onSend,
    required this.onAudioTap,
    required this.onMediaTap,
    required this.onTyping,
    required this.isOtherTyping,
    required this.chatController,
    this.chatFocusNode,
    this.isUploading = false,
    this.showMediaButton = true,
    this.isRecording = false,
    this.recordingDuration = 0,
    required this.onStartRecording,
    required this.onStopRecording,
    required this.onCancelRecording,
  });

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  double _dragOffset = 0;
  bool _isCancelled = false;

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Typing indicator
          if (widget.isOtherTyping)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: AppColors.grey8D,
                  ),
                  BrandHSpace.gap8(),
                  Text(
                    'Typing...',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey8D,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

          // Input row
          Row(
            children: [
              // Media attachment - Only show for Premium users
              if (widget.showMediaButton)
                IconButton(
                  icon: widget.isUploading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        )
                      : const Icon(Icons.attach_file, color: AppColors.grey8D),
                  onPressed: widget.isUploading
                      ? null
                      : () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.image,
                          );
                          if (result != null) {
                            await widget.onMediaTap(result.files.first);
                          }
                        },
                  tooltip: 'Attach media',
                ),

              // Text input
              Expanded(
                child: BrandTextField(
                  controller: widget.chatController,
                  maxLines: null,
                  textStyle: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.isOtherTyping
                        ? "They are typing..."
                        : "Write your message",
                    hintStyle: TextStyle(color: AppColors.grey8D),
                    filled: true,
                    fillColor: AppColors.greyf6,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),

              BrandHSpace.gap8(),
                 IconButton(
                  icon: const Icon(Icons.send, color: AppColors.primary),
                  onPressed: widget.onSend,
                  tooltip: 'Send message',
                ),
              // Recording or Send/Mic button
              // if (widget.isRecording)
                // GestureDetector(
                //   onTap: () {
                //     widget.onStopRecording();
                //     setState(() {
                //       _dragOffset = 0;
                //       _isCancelled = false;
                //     });
                //   },
                //   onHorizontalDragUpdate: (details) {
                //     setState(() {
                //       _dragOffset += details.delta.dx;
                //       if (_dragOffset < -100) {
                //         _isCancelled = true;
                //       }
                //     });
                //   },
                //   onHorizontalDragEnd: (details) {
                //     if (_isCancelled) {
                //       widget.onCancelRecording();
                //     } else {
                //       widget.onStopRecording();
                //     }
                //     setState(() {
                //       _dragOffset = 0;
                //       _isCancelled = false;
                //     });
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                //     decoration: BoxDecoration(
                //       color: _isCancelled ? Colors.red : AppColors.primary,
                //       borderRadius: BorderRadius.circular(24),
                //     ),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Icon(
                //           _isCancelled ? Icons.delete : Icons.mic,
                //           color: Colors.white,
                //           size: 20,
                //         ),
                //         const SizedBox(width: 8),
                //         Text(
                //           _isCancelled
                //               ? 'Release to cancel'
                //               : _formatDuration(widget.recordingDuration),
                //           style: const TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //         const SizedBox(width: 8),
                //         if (!_isCancelled)
                //           const Icon(
                //             Icons.keyboard_arrow_left,
                //             color: Colors.white,
                //             size: 20,
                //           ),
                //       ],
                //     ),
                //   ),
                // )
              // else ...[
              //   // Mic button
              //   // IconButton(
              //   //   icon: const Icon(Icons.mic, color: AppColors.primary),
              //   //   onPressed: widget.onStartRecording,
              //   //   tooltip: 'Record voice',
              //   // ),
              //   // Send button
              //   IconButton(
              //     icon: const Icon(Icons.send, color: AppColors.primary),
              //     onPressed: widget.onSend,
              //     tooltip: 'Send message',
              //   ),
              // ],
            ],
          ),
        ],
      ),
    );
  }
}
