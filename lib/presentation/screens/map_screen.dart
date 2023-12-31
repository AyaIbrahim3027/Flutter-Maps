import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constants/colors.dart';
import 'package:flutter_maps/helpers/location_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../widgets/my_drawer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  static Position? position;
  Completer<GoogleMapController> _mapController = Completer();

  FloatingSearchBarController controller = FloatingSearchBarController();

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0,
    zoom: 17,
  );

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: CircularProgressIndicator(
                    color: MyColors.blue,
                  ),
                ),
          buildFloatingSearchBar(),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: MyColors.blue,
          onPressed: _goToMyCurrentLocation,
          child: const Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      controller: controller,
      elevation: 6,
      hint: 'Find a place',
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      border: const BorderSide(style: BorderStyle.none),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      height: 52,
      iconColor: MyColors.blue,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0 : -1,
      openAxisAlignment: 0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {},
      onFocusChanged: (_) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            onPressed: () {},
            icon: Icon(
              Icons.place,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        );
      },
    );
  }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
    // position = await Geolocator.getLastKnownPosition().whenComplete(() {
    //   setState(() {});
    // });
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }
}
