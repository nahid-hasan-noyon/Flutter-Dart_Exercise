import 'package:flutter_config/flutter_config.dart';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double? latitude, double? longitude}) {
    final googleApiKey = FlutterConfig.get('Google_API_Key');
    print(googleApiKey);
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=$googleApiKey&signature=YOUR_SIGNATURE';

    // 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude, $longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Alabel:C%7C$latitude,$longitude&key=$google_api_key&signature=YOUR_SIGNATURE';
  }
}
