part of 'maps_cubit.dart';

@immutable
abstract class MapsState {}

class MapsInitial extends MapsState {}

class PlacesLoaded extends MapsState {
  final List<PlaceSuggestionModel> places;

  PlacesLoaded(this.places);
}

class PlaceLocationLoaded extends MapsState {
  final PlaceModel place;

  PlaceLocationLoaded(this.place);
}

class DirectionsLoaded extends MapsState {
  final PlaceDirectionsModel placeDirections;

  DirectionsLoaded(this.placeDirections);
}
