import 'package:crypto_coins/exporters.dart';


class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;
  final CryptoCoin? coin;

  _CryptoCoinScreenState({this.coin});

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, "To'girla");
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coin!.name ?? "..."),
      ),
      body: Center(
        child: Text(coin!.priceInUSD.toString()),
      ),
    );
  }
}
