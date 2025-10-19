import 'package:bcrd_client/service/shop_service.dart';
import 'package:bcrd_client/service/stamp_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stamp_provider.g.dart';

@riverpod
class Stamp extends _$Stamp {
  @override
  Future<int> build(BuildContext context, String userId, int shopId) async {
    return await getStampNum(context, userId, shopId);
  }

  Future<int> getStampNum(
      BuildContext context, String userId, int shopId) async {
    final shop = await ShopService.getShop(context, userId, shopId);
    if (shop!.shop.numberOfTimes > 0) {
      return shop.shop.numberOfTimes;
    }
    return 0;
  }

  Future<int> addStamp(BuildContext context, String userId, int shopId) async {
    final stamp = await StampService.addStamp(context, userId, shopId);
    state = AsyncData(stamp!.numberOfTimes);
    return stamp.numberOfTimes;
  }

  Future<int> deleteStamp(
      BuildContext context, String userId, int shopId) async {
    final stamp = await StampService.deleteStamp(context, userId, shopId);
    state = AsyncData(stamp!.numberOfTimes);
    return stamp.numberOfTimes;
  }
}
