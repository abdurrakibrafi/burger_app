import 'package:burgerapp/data/payment_data.dart';
import 'package:burgerapp/models/payment_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentNotifyer extends StateNotifier<List<PaymentModel>> {
  PaymentNotifyer() : super(paymentMethod);


 
}

final PaymentNotifyerProvider =
    StateNotifierProvider<PaymentNotifyer, List<PaymentModel>>((ref) {
  return PaymentNotifyer();
});
