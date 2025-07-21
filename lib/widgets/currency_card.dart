import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final Color _blackColor = const Color(0xFF1F2123);
  final int offsetOrder;
  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    this.isInverted = false,
    required this.offsetOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (offsetOrder - 1) * -20.toDouble()),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            amount,
                            style: TextStyle(
                              color: isInverted ? _blackColor : Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            ' $code',
                            style: TextStyle(
                              color: isInverted ? _blackColor : Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: 2.2,
                    child: Transform.translate(
                      offset: const Offset(-5, 12),
                      child: Icon(
                        icon,
                        color: isInverted ? _blackColor : Colors.white,
                        size: 88,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
