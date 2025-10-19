import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

import '../common/util.dart';
import '../const/config.dart';
import '../grpc_gen/bcrd.pbgrpc.dart';
import 'grpc_service.dart';

class StampService {
  static Future<StampResponse?> addStamp(
      BuildContext context, String userId, int shopId) async {
    StampResponse? stamp;

    try {
      stamp = await GrpcService.addStamp(userId, shopId);
    } on GrpcError catch (e) {
      debugPrint('Caught error: $e');
      if (context.mounted) {
        Util.showAlertDialog(context, 'スタンプ獲得に失敗しました', Config.buttonLabelClose);
      }
    } catch (e) {
      debugPrint('Caught error: $e');
      if (context.mounted) {
        Util.showAlertDialog(context, 'スタンプ獲得に失敗しました', Config.buttonLabelClose);
      }
    }

    return stamp;
  }

  static Future<StampResponse?> deleteStamp(
      BuildContext context, String userId, int shopId) async {
    StampResponse? stamp;

    try {
      stamp = await GrpcService.deleteStamp(userId, shopId);
    } on GrpcError catch (e) {
      debugPrint('Caught error: $e');
      if (context.mounted) {
        Util.showAlertDialog(
            context, 'スタンプ取り消しに失敗しました', Config.buttonLabelClose);
      }
    } catch (e) {
      debugPrint('Caught error: $e');
      if (context.mounted) {
        Util.showAlertDialog(
            context, 'スタンプ取り消しに失敗しました', Config.buttonLabelClose);
      }
    }

    return stamp;
  }
}
