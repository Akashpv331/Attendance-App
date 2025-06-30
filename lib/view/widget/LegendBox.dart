import 'package:flutter/material.dart';

class LegendBox extends StatelessWidget {
  final String label;
  final Color color;

  const LegendBox({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Container(
             width: MediaQuery.of(context).size.width / 20,
              height: MediaQuery.of(context).size.height / 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
