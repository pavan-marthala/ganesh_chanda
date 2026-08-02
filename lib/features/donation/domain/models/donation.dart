import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/donation_status.dart';
import '../enums/payment_mode.dart';

part 'donation.freezed.dart';
part 'donation.g.dart';

@freezed
abstract class Donation with _$Donation {
  @JsonSerializable(explicitToJson: true)
  const factory Donation({
    required String id,
    required String festivalId,
    required String communityId,
    required String donorName,
    @Default('') String donorPhone,
    required double amount,
    @Default(PaymentMode.cash) PaymentMode paymentMode,
    String? referenceNumber,
    @Default('') String notes,
    required String collectedBy,
    @Default('') String receiptNumber,
    @Default(DonationStatus.received) DonationStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Donation;

  factory Donation.fromJson(Map<String, dynamic> json) =>
      _$DonationFromJson(json);
}
