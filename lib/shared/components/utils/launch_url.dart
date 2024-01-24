import 'dart:io';

import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart' as url_launcher;

import 'show_snack_bar.dart';

typedef OnFailLaunchingUrl = void Function(String exception);

void _defaultOnFailLaunchingUrl(String value) =>
    ShowSnackBar.error(value).show();

class LaunchUrl {
  LaunchUrl._();

  static Future<void> link(
    String url, {
    OnFailLaunchingUrl? onFailLaunchingUrl,
  }) =>
      _launchUrl(url, onFailLaunchingUrl);

  static Future<void> email(
    String email, {
    OnFailLaunchingUrl? onFailLaunchingUrl,
  }) =>
      _launchUrl('mailto:$email', onFailLaunchingUrl);

  static Future<void> whatsApp(
    String phoneNumber, {
    OnFailLaunchingUrl? onFailLaunchingUrl,
  }) {
    const message = '';
    final phone = '+55${phoneNumber.replaceAll(RegExp(r'\D'), '')}';

    final url = Platform.isIOS
        ? 'whatsapp://wa.me/$phone/?text=$message'
        : 'whatsapp://send?phone=$phone&text=$message';

    return _launchUrl(url, onFailLaunchingUrl);
  }

  static Future<void> phone(
    String phoneNumber, {
    OnFailLaunchingUrl? onFailLaunchingUrl,
  }) {
    final phone = phoneNumber.replaceAll(RegExp(r'\D'), '');

    return _launchUrl('tel:$phone', onFailLaunchingUrl);
  }
}

Future<void> _launchUrl(
  String url, [
  OnFailLaunchingUrl? onFailLaunchingUrl,
]) async {
  try {
    final uri = Uri.parse(url);
    onFailLaunchingUrl ??= _defaultOnFailLaunchingUrl;

    if (await url_launcher.canLaunchUrl(uri)) {
      await url_launcher.launchUrl(
        uri,
        mode: url_launcher.LaunchMode.platformDefault,
      );
    } else {
      onFailLaunchingUrl.call('Erro ao tentar abrir link');
    }
  } on PlatformException catch (exception) {
    onFailLaunchingUrl?.call(exception.toString());
  }
}
