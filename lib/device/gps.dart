import 'package:geolocator/geolocator.dart';

class GpsSensor {
  Future<LocationPermission>
      get permissionStatus async => // Usando GeoLocator verifica el estado de los permisos
          await Geolocator.checkPermission();

  Future<Position>
      get currentLocation async => // Usando GeoLocator obten la posicion actual
          await Geolocator.getCurrentPosition();

  Future<LocationAccuracyStatus> get locationAccuracy async {
    try {
      return await Geolocator.getLocationAccuracy();
    } catch (e) {
      return LocationAccuracyStatus.unknown;
    }
  } // Usando GeoLocator verifica la precision de la ubicacion con soporte para web

  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();

    // TODO: Debes configurar correctamente el AndroidManifest.xml para Android:
    // 1. <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    // 2. <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

    // TODO: Si usas iOS debes configurar el Info.plist usando Xcode
    // 1. <key>NSLocationWhenInUseUsageDescription</key>
    //    <string>Esta aplicación necesita acceso a la ubicación cuando está abierta.</string>
    // 2. <key>NSLocationAlwaysUsageDescription</key>
    //    <string>Esta aplicación necesita acceso a la ubicación cuando está en segundo plano.</string>

    // TODO: Usando GeoLocator solicita los permisos
  }
}
