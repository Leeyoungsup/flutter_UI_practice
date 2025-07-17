import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Map App',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Position? currentPosition;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 현재 위치를 가져오는 함수
  Future<void> _getCurrentLocation() async {
    try {
      // 위치 권한 확인 및 요청
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            isLoading = false;
          });
          _showErrorDialog('위치 권한이 거부되었습니다.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          isLoading = false;
        });
        _showErrorDialog('위치 권한이 영구적으로 거부되었습니다. 설정에서 권한을 허용해주세요.');
        return;
      }

      // 현재 위치 가져오기
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentPosition = position;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorDialog('위치를 가져올 수 없습니다: $e');
    }
  }

  // 에러 다이얼로그 표시
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('오류'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  // 내 위치로 이동하는 함수
  void _goToMyLocation() {
    if (currentPosition != null && mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
            zoom: 16.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 위치 지도'),
        backgroundColor: const Color.fromARGB(255, 156, 159, 211),
      ),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('위치를 가져오는 중...'),
                ],
              ),
            )
          : currentPosition == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_off, size: 64, color: Colors.grey),
                      SizedBox(height: 20),
                      Text('위치를 가져올 수 없습니다'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _getCurrentLocation,
                        child: Text('다시 시도'),
                      ),
                    ],
                  ),
                )
              : GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      currentPosition!.latitude,
                      currentPosition!.longitude,
                    ),
                    zoom: 16.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('current_location'),
                      position: LatLng(
                        currentPosition!.latitude,
                        currentPosition!.longitude,
                      ),
                      infoWindow: InfoWindow(
                        title: '내 위치',
                        snippet: '현재 위치입니다',
                      ),
                    ),
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false, // 커스텀 버튼 사용
                ),
      floatingActionButton: currentPosition != null
          ? FloatingActionButton(
              onPressed: _goToMyLocation,
              backgroundColor: const Color.fromARGB(255, 156, 159, 211),
              child: Icon(Icons.my_location),
            )
          : null,
    );
  }
}