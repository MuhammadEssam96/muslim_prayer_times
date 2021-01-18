import 'package:location/location.dart';

class LocationService {
    static Future<LocationData> getLocation() => Location().getLocation();
}