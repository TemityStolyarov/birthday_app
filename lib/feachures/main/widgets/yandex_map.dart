import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class YandexMapKit extends StatelessWidget {
  const YandexMapKit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: secondaryFontColor,
          width: 1.sp,
        ),
      ),
      width: 343.sp,
      height: 246.sp,
      child: YandexMap(
        mapObjects: [
          PlacemarkMapObject(
            point: const Point(
              latitude: 47.242613,
              longitude: 38.691239,
            ),
            mapId: const MapObjectId('Просто лес'),
            text: PlacemarkText(
              text: 'Просто лес',
              style: PlacemarkTextStyle(
                placement: TextStylePlacement.right,
                size: 8.sp,
                outlineColor: Colors.transparent,
              ),
            ),
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/google-maps.png'),
                scale: 0.15.sp,
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
                zoom: 10,
                target: Point(
                  latitude: 47.190613,
                  longitude: 38.731239,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
