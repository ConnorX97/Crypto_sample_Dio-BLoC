import '../../../exporters.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({
    super.key,
    required this.coin,
    required this.textTheme,
  });
  final TextTheme textTheme;
  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final String value =
        double.parse(coin.priceInUSD.toStringAsFixed(2)).toString();
    return ListTile(
      title: Text(
        coin.name,
        style: textTheme.bodyMedium,
      ),
      subtitle: Text(
        "${(value)}\$",
        style: textTheme.labelSmall,
      ),
      leading: Image.network(
        coin.imageUrl,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.coin, arguments: coin);
      },
    );
  }
}
