import 'dart:io';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

Future<void> launchLink(
  String url, {
  bool forceWebView = false,
  required void Function(String exception)? onFailLaunchingUrl,
}) async =>
    _launchUrl(
      url,
      onFailLaunchingUrl: onFailLaunchingUrl,
    );

Future<void> launchEmail(
  String email, {
  required void Function(String exception)? onFailLaunchingUrl,
}) async {
  final url = 'mailto:$email';

  return _launchUrl(url, onFailLaunchingUrl: onFailLaunchingUrl);
}

Future<void> launchWhatsApp(
  String phoneNumber, {
  required void Function(String exception)? onFailLaunchingUrl,
}) async {
  const message = 'Olá!';
  final phone = '+55$phoneNumber';

  final url = Platform.isIOS
      ? 'whatsapp://wa.me/$phone/?text=$message'
      : 'whatsapp://send?phone=$phone&text=$message';

  return _launchUrlW(url, onFailLaunchingUrl: onFailLaunchingUrl);
}

Future<void> _launchUrl(
  String url, {
  required void Function(String exception)? onFailLaunchingUrl,
}) async {
  try {
    if (await url_launcher.canLaunchUrl(Uri.parse(url))) {
      await url_launcher.launchUrl(
        Uri.parse(url),
        mode: url_launcher.LaunchMode.externalApplication,
      );
    } else {
      onFailLaunchingUrl?.call('Erro ao tentar abrir link');
    }
  } on PlatformException catch (exception) {
    onFailLaunchingUrl?.call(exception.toString());
  }
}

Future<void> _launchUrlW(
  String url, {
  required void Function(String exception)? onFailLaunchingUrl,
}) async {
  try {
    if (await url_launcher.canLaunchUrl(Uri.parse(url))) {
      await url_launcher.launchUrl(
        Uri.parse(url),
        mode: url_launcher.LaunchMode.externalApplication,
      );
    } else {
      onFailLaunchingUrl
          ?.call('Erro ao tentar abrir link. App whatsapp não está instalado.');
    }
  } on PlatformException catch (exception) {
    onFailLaunchingUrl?.call(exception.toString());
  }
}
