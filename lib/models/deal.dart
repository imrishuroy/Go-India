import 'dart:convert';

import 'package:equatable/equatable.dart';

class Deal extends Equatable {
  final String? finCode;
  final String? clientName;
  final String? dealType;
  final String? quantity;
  final String? value;
  final String? tradePrice;
  final String? dealDate;
  final String? exchange;

  const Deal({
    this.finCode,
    this.clientName,
    this.dealType,
    this.quantity,
    this.value,
    this.tradePrice,
    this.dealDate,
    this.exchange,
  });

  Deal copyWith({
    String? finCode,
    String? clientName,
    String? dealType,
    String? quantity,
    String? value,
    String? tradePrice,
    String? dealDate,
    String? exchange,
  }) {
    return Deal(
      finCode: finCode ?? this.finCode,
      clientName: clientName ?? this.clientName,
      dealType: dealType ?? this.dealType,
      quantity: quantity ?? this.quantity,
      value: value ?? this.value,
      tradePrice: tradePrice ?? this.tradePrice,
      dealDate: dealDate ?? this.dealDate,
      exchange: exchange ?? this.exchange,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FinCode': finCode,
      'ClientName': clientName,
      'DealType': dealType,
      'Quantity': quantity,
      'Value': value,
      'TradePrice': tradePrice,
      'DealDate': dealDate,
      'Exchange': exchange,
    };
  }

  factory Deal.fromMap(Map<String, dynamic> map) {
    return Deal(
      finCode: map['FinCode'],
      clientName: map['ClientName'],
      dealType: map['DealType'],
      quantity: map['Quantity'],
      value: map['Value'],
      tradePrice: map['TradePrice'],
      dealDate: map['DealDate'],
      exchange: map['Exchange'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Deal.fromJson(String source) => Deal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Deal(finCode: $finCode, clientName: $clientName, dealType: $dealType, quantity: $quantity, value: $value, tradePrice: $tradePrice, dealDate: $dealDate, exchange: $exchange)';
  }

  @override
  List<Object?> get props {
    return [
      finCode,
      clientName,
      dealType,
      quantity,
      value,
      tradePrice,
      dealDate,
      exchange,
    ];
  }
}
