import 'dart:ui';

import 'package:flutter/material.dart';

class SocialMedia {
  Color colors;
  String socialImagePath;
  String socialName;

  SocialMedia(this.colors, this.socialImagePath, this.socialName);
}

List<SocialMedia> socialMediaList = [
  SocialMedia(Colors.red, 'send', 'Send'),
  SocialMedia(Colors.green, 'whatsapp', 'WhatsApp'),
  SocialMedia(Colors.blue, 'telegram', 'Telegram'),
  SocialMedia(Colors.purpleAccent, 'instagram', 'Instagram'),
  SocialMedia(Colors.white, 'gmail', 'Gmail'),
  SocialMedia(Colors.black12, 'link', 'Copy link'),
];

class ShareInfo {
  String? title;
  String? desc;

  ShareInfo(this.title, this.desc);
}

List<ShareInfo> shareToOtherList = [
  ShareInfo('Download image', null),
  ShareInfo('Hide Pin', null),
  ShareInfo(
      'Report Pin', 'This goes against Pinterest\'s Community Guidelines'
  ),
];
