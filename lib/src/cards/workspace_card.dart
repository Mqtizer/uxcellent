import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uxcellent/uxcellent.dart';

enum UXWorkspaceCardAction { update, delete }

class UXWorkspaceCard extends StatelessWidget {
  final String id;
  final String name;
  final String? pictureUrl;
  final int brokerCount;
  final void Function(UXWorkspaceCardAction)? onDismissed;
  final void Function() onTap;
  final bool isDismissible;

  final Color deleteBackgroundColor;
  final Color deleteForegroundColor;
  final Color updateBackgroundColor;
  final Color updateForegroundColor;

  const UXWorkspaceCard({
    super.key,
    required this.id,
    required this.name,
    this.pictureUrl,
    this.brokerCount = 0,
    this.onDismissed,
    required this.onTap,
    this.isDismissible = false,
    this.deleteBackgroundColor = Colors.red,
    this.deleteForegroundColor = Colors.white,
    this.updateBackgroundColor = Colors.blue,
    this.updateForegroundColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    Widget card = GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UXInitialsAvatar(
            name: name,
            imageUrl: pictureUrl,
            size: 64,
            backgroundColor: colorScheme.secondaryContainer,
          ),
          const SizedBox(width: 32),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: colorScheme.primary),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: colorScheme.tertiaryContainer,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    child: Text(
                      '$brokerCount brokers',
                      overflow: TextOverflow.fade,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: colorScheme.onTertiaryContainer),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
    if (isDismissible) {
      return Slidable(
        key: ValueKey(id),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          // extentRatio: 0.25,
          children: [
            SlidableAction(
              icon: Icons.edit,
              label: 'Update',
              backgroundColor: updateBackgroundColor,
              foregroundColor: updateForegroundColor,
              onPressed: (BuildContext context) {
                onDismissed!(UXWorkspaceCardAction.update);
              },
            ),
            SlidableAction(
              icon: Icons.delete,
              label: 'Delete',
              backgroundColor: deleteBackgroundColor,
              foregroundColor: deleteForegroundColor,
              onPressed: (BuildContext context) {
                onDismissed!(UXWorkspaceCardAction.delete);
              },
            )
          ],
        ),
        child: card,
      );
    } else {
      return card;
    }
  }
}
