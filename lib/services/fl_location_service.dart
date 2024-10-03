import 'dart:async';

import 'package:background_location/app/app.logger.dart';
import 'package:fl_location/fl_location.dart';

class FlLocationService {
  final _log = getLogger('FlLocationService');
  StreamSubscription<Location>? _locationSubscription;

  Future<bool> _checkAndRequestPermission({bool? background}) async {
    if (!await FlLocation.isLocationServicesEnabled) {
      // Location services is disabled.
      return false;
    }

    LocationPermission permission = await FlLocation.checkLocationPermission();
    if (permission == LocationPermission.deniedForever) {
      // Location permission has been permanently denied.
      return false;
    } else if (permission == LocationPermission.denied) {
      // Ask the user for location permission.
      permission = await FlLocation.requestLocationPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Location permission has been denied.
        return false;
      }
    }

    // Location permission must always be granted (LocationPermission.always)
    // to collect location data in the background.
    if (background == true && permission == LocationPermission.whileInUse) {
      // Location permission must always be granted to collect location in the background.
      return false;
    }

    return true;
  }

  Future<(double,double)?> getLocation() async {
    if (await _checkAndRequestPermission()) {
      final Location location = await FlLocation.getLocation();
      _log.i('location: ${location.toJson()}');
      //Use records to return lat and long
      return (location.latitude,location.longitude);
    }
    return null;
  }
  Future<void> subscribeLocationStream() async {
    if (await _checkAndRequestPermission()) {
      _locationSubscription = FlLocation.getLocationStream().listen(_onLocation);
    }
  }

  void _onLocation(Location location) {
    //todo: send the location to the database here each time
    _log.i('location: ${location.toJson()}');
  }
}
