import 'package:favorite_places/helpers/location_helper.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImage;

  Future<void> _getCurrentLocationInput() async {
    final currentLocation = await Location().getLocation();
    print(currentLocation);
    String googleApiKey = await FlutterConfig.get('Google_API_Key');
    print(googleApiKey);
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: currentLocation.latitude,
      longitude: currentLocation.longitude,
    );
    print(staticMapImageUrl);
    setState(() {
      _previewImage = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImage == null
              ? const Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        ElevatedButton.icon(
          onPressed: _getCurrentLocationInput,
          icon: const Icon(Icons.location_on),
          label: const Text('Current LocationInput'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.map),
          label: const Text('Select on Map'),
        ),
      ],
    );
  }
}
