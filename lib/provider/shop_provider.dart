import 'package:bcrd_client/grpc_gen/bcrd.pb.dart';
import 'package:bcrd_client/service/auth_service.dart';
import 'package:bcrd_client/service/shop_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_provider.g.dart';

@riverpod
class Shop extends _$Shop {
  @override
  Future<ShopsResponse?> build(BuildContext context) async {
    return await _fetchShops(context);
  }

  Future<ShopsResponse?> _fetchShops(BuildContext context) {
    User? user = ref.read(authServiceProvider.notifier).getCurrentUser();
    String userId = user != null ? user.uid : '';
    return ShopService.getShops(context, userId);
  }

  Future<ShopsResponse?> getShops(BuildContext context,
      [List<int>? searchCondition,
      String? searchKeyword,
      int? sortOrder,
      double? latitude,
      double? longitude]) async {
    User? user = ref.read(authServiceProvider.notifier).getCurrentUser();
    String userId = user != null ? user.uid : '';
    final shops = await ShopService.getShops(context, userId, searchCondition,
        searchKeyword, sortOrder, latitude, longitude);
    state = AsyncData(shops);
    return shops;
  }
}
