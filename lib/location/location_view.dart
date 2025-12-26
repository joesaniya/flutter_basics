import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      locationSettings: AndroidSettings(
        accuracy: LocationAccuracy.high,
        intervalDuration: const Duration(seconds: 5),
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText: "Location services are running in the background",
          notificationTitle: "Using Location",
          enableWakeLock: true,
        ),
      ),
    );
  }

  Position? position;
  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  void fetchLocation() async {
    Position pos = await getLocation();
    setState(() {
      position = pos;
    });
    log('Latitude: ${position!.latitude}, Longitude: ${position!.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location View')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          position != null
              ? Text(
                  'Latitude: ${position!.latitude}, Longitude: ${position!.longitude}',
                )
              : Text('Location not available'),
          /*ElevatedButton(
            onPressed: () async {
              Position position = await getLocation();
              log(
                'Latitude: ${position.latitude}, Longitude: ${position.longitude}',
              );
            },
            child: Text('Get Location'),
          ),*/
        ],
      ),
    );
  }
}
