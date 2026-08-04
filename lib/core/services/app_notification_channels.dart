import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppNotificationChannels {
  const AppNotificationChannels._();

  static const String generalId = 'general';
  static const String generalName = 'General Notifications';
  static const String generalDescription =
      'General announcements, app updates, informational messages';

  static const String festivalId = 'festival';
  static const String festivalName = 'Festival Updates';
  static const String festivalDescription =
      'Festival started, Festival completed, major festival updates';

  static const String eventsId = 'events';
  static const String eventsName = 'Event Notifications';
  static const String eventsDescription =
      'Event starting, Event updated, Event reminders';

  static const String donationsId = 'donations';
  static const String donationsName = 'Donation Updates';
  static const String donationsDescription =
      'Donation received, donation acknowledgements, goal reached';

  static const String volunteersId = 'volunteers';
  static const String volunteersName = 'Volunteer Updates';
  static const String volunteersDescription =
      'Volunteer invitations, assignments, removals, important volunteer updates';

  static const AndroidNotificationChannel generalChannel =
      AndroidNotificationChannel(
    generalId,
    generalName,
    description: generalDescription,
    importance: Importance.max,
    playSound: true,
  );

  static const AndroidNotificationChannel festivalChannel =
      AndroidNotificationChannel(
    festivalId,
    festivalName,
    description: festivalDescription,
    importance: Importance.max,
    playSound: true,
  );

  static const AndroidNotificationChannel eventsChannel =
      AndroidNotificationChannel(
    eventsId,
    eventsName,
    description: eventsDescription,
    importance: Importance.max,
    playSound: true,
  );

  static const AndroidNotificationChannel donationsChannel =
      AndroidNotificationChannel(
    donationsId,
    donationsName,
    description: donationsDescription,
    importance: Importance.max,
    playSound: true,
  );

  static const AndroidNotificationChannel volunteersChannel =
      AndroidNotificationChannel(
    volunteersId,
    volunteersName,
    description: volunteersDescription,
    importance: Importance.max,
    playSound: true,
  );

  static List<AndroidNotificationChannel> get allChannels => [
        generalChannel,
        festivalChannel,
        eventsChannel,
        donationsChannel,
        volunteersChannel,
      ];
}
