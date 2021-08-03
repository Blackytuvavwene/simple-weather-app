import 'package:geolocator/geolocator.dart';

class LocationService {
  double? longitude;
  double? latitude;
  LocationService({
    this.longitude,
    this.latitude,
  });

  Future<void> getCurrentLocation() async {
    Position position;
    bool _serviceEnabled;
    LocationPermission _permission;

    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return Future.error('Location service is not enabled');
    }

    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (_permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
