import '../exporters.dart';

const url =
    "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,TONCOIN,ETH,SOL,BNB,SHIB,DOGE,XRP,TRX&tsyms=USD";

class CryptoCoinsRepository implements AbstractCoinRepository {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});
  

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(url);
    final Map<String, dynamic> data = response.data;
    final Map<String, dynamic> dataRaw = data["RAW"]; // raw ichiga kir

    final cryptoCoinsList = dataRaw.entries.map((e) {
      // raw ichidegi mapga kir
      final Map<String, dynamic> usdData =
          (e.value)["USD"]; // i osha mapdegi valuedegi USDni ichini ochib ber
      final price = usdData['PRICE'];
      final imageUrl = usdData["IMAGEURL"];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: "https://www.cryptocompare.com/$imageUrl",
      );
    }).toList();
    return cryptoCoinsList;
  }
}
