import 'package:flutter_maps/data/api_service/places.dart';
import 'package:flutter_maps/data/models/place_suggestion.dart';

class MapsRepo{
  final Places places;

  MapsRepo(this.places);

  Future<List<PlaceSuggestion>> fetchSuggestions(String place , String sessionToken) async {
    final suggestion = await places.fetchSuggestions(place, sessionToken);

    return suggestion.map((suggestion) => PlaceSuggestion.fromJson(suggestion)).toList();
  }


}