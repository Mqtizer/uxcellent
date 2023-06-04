import 'package:flutter/material.dart';

import '../ui_helpers.dart';

class UXExpansionTile extends StatelessWidget {
  final String title;
  final String? helperText;
  final List<Widget> children;
  final GlobalKey expansionTileKey;
  const UXExpansionTile({
    super.key,
    required this.title,
    this.helperText,
    required this.children,
    required this.expansionTileKey,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: ExpansionTile(
        key: expansionTileKey,
        onExpansionChanged: (value) {
          if (value) {
            final keyContext = expansionTileKey.currentContext;
            if (keyContext != null) {
              Future.delayed(durationStandard).then((value) {
                Scrollable.ensureVisible(
                  keyContext,
                  duration: const Duration(milliseconds: 500),
                );
                // Keep the expansion tile open for a while
              });
            }
          }
        },
        title: Text(title),
        backgroundColor: colorScheme.primaryContainer,
        collapsedBackgroundColor: colorScheme.primaryContainer,
        collapsedIconColor: colorScheme.onPrimaryContainer,
        collapsedTextColor: colorScheme.onPrimaryContainer,
        iconColor: colorScheme.onPrimaryContainer,
        textColor: colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: colorScheme.primary, width: 1),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: colorScheme.primary, width: 1),
        ),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              color: colorScheme.surface,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (helperText != null) ...[
                  Text(
                    helperText!,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 32),
                ],
                ...children,
              ],
            ),
          )
        ],
      ),
    );
  }
}
