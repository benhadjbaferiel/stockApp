import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Mapping {
  String lat = '';
  String long = '';
  String locationMessage = 'current location';

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Service is Disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission is denied');
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission is permanently denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  void liveLocation(Function(Position) onLocationUpdate) {
    final locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen(onLocationUpdate);
  }

  Future<void> openMapWithAddress(String address) async {
    final String googleURL =
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}';
    if (await canLaunchUrlString(googleURL)) {
      await launchUrlString(googleURL);
    } else {
      throw 'Could not launch $googleURL';
    }
  }
}
