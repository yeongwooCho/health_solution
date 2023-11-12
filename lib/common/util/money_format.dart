import 'package:intl/intl.dart';

extension MoneyString on int {
  // 이메일 포맷 검증
  String convertIntToMoneyString() {
    final NumberFormat numberFormat = NumberFormat('###,###,###,###');
    // print(numberFormat.format(1000000);
    // # ==> 1,000,000
    return numberFormat.format(this);
  }
}
