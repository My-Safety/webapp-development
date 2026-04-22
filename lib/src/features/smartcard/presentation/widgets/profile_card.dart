import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String displayName;
  final String bio;
  final String avatarUrl;

  const ProfileCard({
    super.key,
    required this.displayName,
    required this.bio,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1F3A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            children: [
              Text(
                displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (bio.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  bio,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: _buildAvatar(),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF0A0E27),
          width: 3,
        ),
      ),
      child: ClipOval(
        child: avatarUrl.isNotEmpty
            ? Image.network(
                avatarUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _defaultAvatar(),
              )
            : _defaultAvatar(),
      ),
    );
  }

  Widget _defaultAvatar() {
    return Container(
      color: const Color(0xFFE0A020),
      child: const Icon(Icons.person, size: 40, color: Colors.white),
    );
  }
}
