import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/config/app_pages.dart';
import '../models/help_request.dart';

class RequestCard extends StatelessWidget {
  final HelpRequest request;

  const RequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () => Get.toNamed(Routes.TICKET_DETAIL, arguments: request),
        child: Column(
          children: [
            Row(
              children: [
                // avatar
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(Icons.person_outline, color: Colors.black),
                ),
                const SizedBox(width: 10),
                // name + title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        request.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${request.date} • ${request.responseDue}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                // NEW / OVERDUE badge
                ShadBadge(
                  backgroundColor: request.highlight == 'NEW'
                      ? Colors.green.shade400
                      : Colors.red.shade400,
                  child: Text(
                    request.highlight,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // tags row like chips
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                for (var t in request.tags)
                  ShadBadge.secondary(
                    child: Text(t, style: const TextStyle(fontSize: 12)),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            // bottom row: status / open button
            Row(
              children: [
                // small badge "Urgent" (example)
                const ShadBadge.destructive(
                  child: Text('Urgent', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    request.tags.length > 1 ? request.tags[1] : '',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // status button (Open)
                ShadBadge.outline(
                  child: Text(
                    request.status,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
