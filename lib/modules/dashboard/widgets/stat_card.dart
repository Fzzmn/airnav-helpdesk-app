import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const StatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.black87),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
