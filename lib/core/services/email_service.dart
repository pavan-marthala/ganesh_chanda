import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

@LazySingleton()
class EmailService {
  final String email = dotenv.env['GMAIL_ID'] ?? '';
  final String password = dotenv.env['GMAIL_PASS'] ?? '';
  String get appName => dotenv.env['APP_NAME'] ?? '';
  late final SmtpServer smtpServer = gmail(email, password);

  Future<void> sendEmail(
    String to,
    String subject,
    String path,
    Map<String, String> parameters,
  ) async {
    log('Sending email to $to');
    final template = await rootBundle.loadString(path);
    final html = renderTemplate(template, parameters);
    final message = Message()
      ..from = Address(email, appName)
      ..recipients.add(to)
      ..subject = subject
      ..html = html;
    try {
      final sendReport = await send(message, smtpServer);
      log('Message sent: $sendReport');
    } on MailerException catch (e) {
      log('Message not sent.');
      for (var p in e.problems) {
        log('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  String renderTemplate(String template, Map<String, String> values) {
    return template.replaceAllMapped(RegExp(r'\{\{(\w+)\}\}'), (match) {
      final key = match.group(1)!;
      return values[key]?.toString() ?? match.group(0)!;
    });
  }
}
