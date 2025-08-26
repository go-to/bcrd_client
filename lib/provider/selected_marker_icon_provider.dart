import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../const/config.dart';

part 'selected_marker_icon_provider.g.dart';

// マーカーアイコン（選択中）
@riverpod
Future<BitmapDescriptor> selectedMarkerIcon(Ref ref) async {
  return BitmapDescriptor.asset(
    const ImageConfiguration(),
    Config.shopSelectedImagePath,
    width: Config.shopSelectedImageWidth,
    height: Config.shopSelectedImageHeight,
  );
}
