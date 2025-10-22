import 'package:fixnum/fixnum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:bcrd_client/grpc_gen/bcrd.pbgrpc.dart';

class GrpcService {
  static ClientChannel? _channel;
  static BcrdServiceClient? _client;

  static CallOptions getCallOptions() {
    return CallOptions(metadata: {
      'api-key': dotenv.get('API_KEY'),
    });
  }

  static ClientChannel getChannel() {
    _channel ??= ClientChannel(
      dotenv.get('GRPC_SERVER_HOST'),
      port: int.parse(dotenv.get('GRPC_SERVER_PORT')),
      // default: secure()
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    return _channel!;
  }

  static BcrdServiceClient getClient() {
    _client ??= BcrdServiceClient(getChannel());
    return _client!;
  }

  static Future<void> shutdown() async {
    await _channel?.shutdown();
    _channel = null;
    _client = null;
  }

  static Future<ShopsTotalResponse> getShopsTotal() async {
    final client = getClient();

    final res = await client.getShopsTotal(
      ShopsTotalRequest(),
      options: getCallOptions(),
    );
    return res;
  }

  static Future<ShopsResponse> getShops(String userId,
      [List<int>? searchParams,
      String? searchKeyword,
      int? sortOrder,
      double? latitude,
      double? longitude]) async {
    final client = getClient();
    List<SearchType> searchTypes = [];
    SortOrderType sortOrderType = SortOrderType.SORT_ORDER_NO;

    for (final searchType in searchParams!) {
      final value = SearchType.valueOf(searchType);
      if (value == null) {
        continue;
      }
      searchTypes.add(value);
    }
    if (sortOrder != null) {
      for (SortOrderType s in SortOrderType.values) {
        if (s.value == sortOrder) {
          sortOrderType = s;
          break;
        }
      }
    }
    final res = await client.getShops(
      ShopsRequest(
          searchTypes: searchTypes,
          userId: userId,
          keyword: searchKeyword,
          sortOrder: sortOrderType,
          latitude: latitude,
          longitude: longitude),
      options: getCallOptions(),
    );
    return res;
  }

  static Future<ShopResponse> getShop(String userId, int shopId) async {
    final client = getClient();

    final res = await client.getShop(
      ShopRequest(userId: userId, shopId: Int64(shopId)),
      options: getCallOptions(),
    );
    return res;
  }

  static Future<StampResponse> addStamp(String userId, int shopId) async {
    final client = getClient();

    final res = await client.addStamp(
      StampRequest(userId: userId, shopId: Int64(shopId)),
      options: getCallOptions(),
    );
    return res;
  }

  static Future<StampResponse> deleteStamp(String userId, int shopId) async {
    final client = getClient();

    final res = await client.deleteStamp(
      StampRequest(userId: userId, shopId: Int64(shopId)),
      options: getCallOptions(),
    );
    return res;
  }
}
