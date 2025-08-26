import 'package:egp_client/grpc_gen/egp.pb.dart';
import 'package:egp_client/service/grpc_service.dart';
import 'package:egp_client/view/shop_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/util.dart';
import '../service/auth_service.dart';
import '../widget/stamp_card_widget.dart';
import '../const/config.dart';

class StampManagementPage extends ConsumerStatefulWidget {
  const StampManagementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StampManagementPageState();
}

class _StampManagementPageState extends ConsumerState<StampManagementPage> {
  Future<ShopsResponse> _fetchShops(String userId) async {
    return await GrpcService.getShops(userId, []);
  }

  final List<String> dropdownItems = [
    Config.stampNumLabelPerShop,
    Config.stampNumLabelTotal,
  ];
  String selectedValue = Config.stampNumLabelPerShop;

  @override
  Widget build(BuildContext context) {
    final user = ref.read(authServiceProvider.notifier).getCurrentUser();
    final userId = user!.uid;
    // 現在のテーマからカラースキームを取得
    final colorScheme = Theme.of(context).colorScheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        return Util.showAppCloseDialog(context, didPop, result);
      },
      child: FutureBuilder<ShopsResponse>(
        future: _fetchShops(userId),
        builder: (BuildContext context, AsyncSnapshot<ShopsResponse> snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          int stampNum = 0;
          if (data.shops.where((shop) => shop.isStamped == true).isNotEmpty) {
            stampNum = selectedValue == Config.stampNumLabelPerShop
                ? data.shops.where((shop) => shop.isStamped == true).length
                : data.shops
                    .where((shop) => shop.isStamped == true)
                    .map((shop) => shop.numberOfTimes)
                    .reduce((a, b) => a + b);
          }

          return Column(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        value: selectedValue,
                        isDense: true,
                        style: TextStyle(
                          fontSize: Config.fontSizeLarge,
                          color: colorScheme.primary,
                        ),
                        items: dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                      ),
                      SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  Config.numberOfStampsObtained + Config.colon,
                              style: TextStyle(
                                  color: colorScheme.primary,
                                  fontSize: Config.fontSizeLarge),
                            ),
                            TextSpan(
                              text: '$stampNum ',
                              style: TextStyle(
                                  color: colorScheme.primary,
                                  fontSize: Config.fontSizeVeryLarge),
                            ),
                            TextSpan(
                              text: Config.stampUnit,
                              style: TextStyle(
                                  color: colorScheme.primary,
                                  fontSize: Config.fontSizeLarge),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: data.shops.length,
                  itemBuilder: (context, index) {
                    final shop = data.shops.toList()[index];
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push<bool>(
                          MaterialPageRoute(builder: (context) {
                            return ShopDetailPage(
                                year: shop.year,
                                no: shop.no,
                                shopId: shop.id.toInt(),
                                shopName: shop.shopName,
                                address: shop.address);
                          }),
                        ).then((onValue) {
                          // 遷移先ページから戻ってきたあとの処理
                          setState(() {});
                        });
                      },
                      child: StampCard(userId: userId, shop: shop),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
