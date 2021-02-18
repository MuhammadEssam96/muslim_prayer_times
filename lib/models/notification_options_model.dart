import 'package:hive/hive.dart';

import 'prayer_enum_model.dart';

part 'notification_options_model.g.dart';

@HiveType(typeId: 5)
class NotificationOptions {
  @HiveField(0)
  final Prayer prayer;

  @HiveField(1)
  final int timeDifference;

  @HiveField(2)
  final bool isEnabled;

  const NotificationOptions({
    this.prayer,
    this.timeDifference,
    this.isEnabled
  });

  static const List<NotificationOptions> defaultNotificationOptions = [
    NotificationOptions(
      prayer: Prayer.fajr,
      timeDifference: 0,
      isEnabled: true
    ),
    NotificationOptions(
      prayer: Prayer.dhuhr,
      timeDifference: 0,
      isEnabled: true
    ),
    NotificationOptions(
      prayer: Prayer.asr,
      timeDifference: 0,
      isEnabled: true
    ),
    NotificationOptions(
      prayer: Prayer.maghrib,
      timeDifference: 0,
      isEnabled: true
    ),
    NotificationOptions(
      prayer: Prayer.isha,
      timeDifference: 0,
      isEnabled: true
    )
  ];
}