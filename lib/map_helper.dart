import 'dart:math';

import 'package:assignment/api_service.dart';
import 'package:assignment/location_model.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHelper {
  static Future<Results> getLocation(String city, String country) async {
    Response response = await ApiService.getMethod(
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$city+in+$country&key=AIzaSyBmsp0NFrNi9gGwTHQJ0XphIjDHSkNLEY4");
    LocationModel locationModel = LocationModel.fromJson(response.data);
    return locationModel.results.first;
  }

  static double getAngle(LatLng a, LatLng b){
    var delta_x = a.latitude - b.latitude;
    var delta_y = a.longitude - b.longitude;
    var theta_radians = atan2(delta_y, delta_x);
    print(theta_radians);
    print(theta_radians);
    return theta_radians*57.2958;
  }
}
