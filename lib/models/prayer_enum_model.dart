import 'package:hive/hive.dart';

part 'prayer_enum_model.g.dart';

@HiveType(typeId: 6)
enum Prayer {
  @HiveField(0)
  fajr,

  @HiveField(1)
  dhuhr,

  @HiveField(2)
  asr,

  @HiveField(3)
  maghrib,

  @HiveField(4)
  isha
}

const Map<Prayer, String> names = {
  Prayer.fajr : "Fajr",
  Prayer.dhuhr : "Dhuhr",
  Prayer.asr : "Asr",
  Prayer.maghrib : "Maghrib",
  Prayer.isha : "Isha"
};