import 'package:flutter_maps/data/api_service/places.dart';
import 'package:flutter_maps/data/models/place.dart';
import 'package:flutter_maps/data/models/place_directions.dart';
import 'package:flutter_maps/data/models/place_suggestion.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsRepo {
  final Places places;

  MapsRepo(this.places);

  Future<List<PlaceSuggestionModel>> fetchSuggestions(
      String place, String sessionToken) async {
    final suggestion = await places.fetchSuggestions(place, sessionToken);

    return suggestion
        .map((suggestion) => PlaceSuggestionModel.fromJson(suggestion))
        .toList();
  }

  Future<PlaceModel> getPlaceLocation(
      String placeId, String sessionToken) async {
    final place = await places.getPlaceLocation(placeId, sessionToken);
    var readyPlace = PlaceModel.fromJson(place);
    return readyPlace;
  }

  Future<PlaceDirectionsModel> getDirections(
      LatLng origin, LatLng destination) async {
    final directions = await places.getDirections(origin,destination);
    return PlaceDirectionsModel.fromJson(directions);
  }
}
