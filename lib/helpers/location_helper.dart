// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double? latitude, double? longitude}) {
    return "https://map.positionstack.com/export/embed.html?bbox=-73.978004,40.756384,-73.979004,40.755384&layer=mapnik&marker=40.755884,-73.978504";
  }

  static Future<String> getPlacesAddress(double lat, double lng) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY');
    final response = await http.get(url);
    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}
