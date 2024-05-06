import 'dart:async';

import 'package:courier_client_app/config/keys.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLocation;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// widgets
import 'package:courier_client_app/widgets/widgets.dart';

// models
import 'package:courier_client_app/models/models.dart';
import 'package:location/location.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

class OrderTracking extends StatefulWidget {
  final OrderResponse orderDetail;

  const OrderTracking({super.key, required this.orderDetail});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  final GeoLocation.Location locationController = GeoLocation.Location();

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(6.918125761213582, 79.85610673556513),
    zoom: 13,
  );
  static const mountainView = LatLng(37.3861, -122.0839);
  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => {initializeMap()});
  }

  Future<void> initializeMap() async {
    await fetchLocation();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      KEYS.googleAPI,
      PointLatLng(kGooglePlex.target.latitude, kGooglePlex.target.longitude),
      PointLatLng(mountainView.latitude, mountainView.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: AppColors.primary,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() => polylines[id] = polyline);
  }

  Future<void> fetchLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return UIContainer(
      paddingLeft: 0,
      paddingRight: 0,
      paddingBottom: 0,
      showAppBar: true,
      appbar: const UIAppBar(title: "Order Tracking"),
      children: GoogleMap(
        initialCameraPosition: kGooglePlex,
        mapType: MapType.terrain,
        markers: {
          Marker(
              markerId: const MarkerId('currentLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: currentPosition!),
          Marker(
              markerId: const MarkerId('sourceLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: kGooglePlex.target),
          const Marker(
              markerId: MarkerId("destination"),
              icon: BitmapDescriptor.defaultMarker,
              position: mountainView)
        },
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (GoogleMapController mapController) {
          controller.complete(mapController);
        },
      ),
    );
  }

  /* Future<void> goToLake() async {
    final GoogleMapController controller = await controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  } */
}
