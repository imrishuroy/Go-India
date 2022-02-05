import 'package:flutter/material.dart';
import '/models/deal.dart';
import 'package:intl/intl.dart';

class OneDealCard extends StatelessWidget {
  final Deal? deal;

  const OneDealCard({Key? key, required this.deal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _canvas = MediaQuery.of(context).size;
    DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
    var format = NumberFormat.currency(
        locale: 'HI', customPattern: '#,##,##,###', decimalDigits: 0);
    var indiaFormat = NumberFormat.compactCurrency(
        locale: 'en_IN', decimalDigits: 1, symbol: '');

    // NumberFormat.currency(
    //     locale: 'en_IN', customPattern: '#.# cr', decimalDigits: 1);

    // compactCurrency(locale: 'en_IN',);

    //final clientName = deal?.clientName?.split(' ');

    final parsedDate =
        deal?.dealDate != null ? dateFormat.parse(deal!.dealDate!) : null;

    // print('Parsed date ----- $parsedDate');

    final formattedDate = parsedDate != null
        ? DateFormat('dd MMM yyyy').format(parsedDate)
        : 'N/A';

    final intValue = deal?.value != null ? double.tryParse(deal!.value!) : null;

    final intQuantity =
        deal?.quantity != null ? int.tryParse(deal!.quantity!)?.toInt() : null;

    final formattedQuanity =
        intQuantity != null ? format.format(intQuantity) : 'N/A';

    final formattedValue =
        intValue != null ? indiaFormat.format(intValue) : 'N/A';

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: deal?.dealType == 'BUY' ? Colors.green : Colors.red,
                ),
                height: 95.0,
                width: 5.0,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: _canvas.width * 0.5,
                        height: 20.0,
                        child: Text(
                          // '${clientName?[0] ?? 'N/A'} '
                          // '${clientName?[1] ?? ''} ',
                          deal?.clientName ?? 'N/A',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.5,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox(width: 50.0),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Text(
                        'Bought $formattedQuanity  shares ',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' @ Rs ${deal?.tradePrice} ',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    //'Value Rs 158.9 cr ',
                    'Value Rs $formattedValue',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
