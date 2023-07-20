import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapkit extends StatelessWidget {
  const YandexMapkit({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 246.sp,
      child: YandexMap(
        mapObjects: [
          PlacemarkMapObject(
            point: const Point(
              latitude: 47.242613,
              longitude: 38.691239,
            ),
            mapId: const MapObjectId('Просто лес'),
            text: const PlacemarkText(
              text: 'Просто лес',
              style: PlacemarkTextStyle(),
            ),
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                zIndex: 13,
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/google-maps.png'),
                scale: 0.25.sp,
              ),
            ),
          ),
        ],
        onMapCreated: (controller) {
          controller.moveCamera(
            animation: const MapAnimation(
              type: MapAnimationType.smooth,
              duration: 1,
            ),
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: Point(
                  latitude: 47.242613,
                  longitude: 38.691239,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
