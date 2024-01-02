class PlaceModel {
  late ResultModel result;

  PlaceModel.fromJson(dynamic json) {
    result = ResultModel.fromJson(json['result']);
  }
}

class ResultModel {
  late GeometryModel geometry;

  ResultModel.fromJson(dynamic json) {
    geometry = GeometryModel.fromJson(json['geometry']);
  }
}

class GeometryModel {
  late LocationModel location;

  GeometryModel.fromJson(dynamic json) {
    location = LocationModel.fromJson(json['location']);
  }
}

class LocationModel {
  late double lat;
  late double lng;

  LocationModel.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}
