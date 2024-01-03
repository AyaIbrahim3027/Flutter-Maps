import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/data/models/place.dart';
import 'package:flutter_maps/data/models/place_directions.dart';
import 'package:flutter_maps/data/repos/maps_repo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../data/models/place_suggestion.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit(this.mapsRepo) : super(MapsInitial());

  final MapsRepo mapsRepo;

  void emitPlaceSuggestions(String place, String sessionToken) {
    mapsRepo.fetchSuggestions(place, sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }


  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepo.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlaceLocationLoaded(place));
    });
  }


  void emitPlaceDirections(LatLng origin, LatLng destination) {
    mapsRepo.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }
}
