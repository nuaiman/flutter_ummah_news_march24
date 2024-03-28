import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../models/gps.dart';

class GpsController extends StateNotifier<GpsModel> {
  GpsController()
      : super(
          GpsModel(
            latitude: 0,
            longitude: 0,
            street: '',
            locality: '',
            subAdministrativeArea: '',
            administrativeArea: '',
            country: '',
            isoCountryCode: '',
          ),
        );

  Future<bool> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<GpsModel> getCurrentLocation() async {
    final currentLocation = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);

    state = GpsModel(
      latitude: currentLocation.latitude,
      longitude: currentLocation.longitude,
      street: placemarks[0].street.toString(),
      locality: placemarks[0].locality.toString(),
      subAdministrativeArea: placemarks[0].subAdministrativeArea.toString(),
      administrativeArea: placemarks[0].administrativeArea.toString(),
      country: placemarks[0].country.toString(),
      isoCountryCode: placemarks[0].isoCountryCode.toString(),
    );
    return state;
  }

  Future<GpsModel?> getLocationForACordinate(
      double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    GpsModel model = GpsModel(
      latitude: latitude,
      longitude: longitude,
      street: placemarks[4].street.toString(),
      locality: placemarks[1].locality.toString(),
      subAdministrativeArea: placemarks[1].subAdministrativeArea.toString(),
      administrativeArea: placemarks[1].administrativeArea.toString(),
      country: placemarks[1].country.toString(),
      isoCountryCode: placemarks[1].isoCountryCode.toString(),
    );

    return model;
  }
}
// -----------------------------------------------------------------------------

final gpsControllerProvider =
    StateNotifierProvider<GpsController, GpsModel>((ref) {
  return GpsController();
});
