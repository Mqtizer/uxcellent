import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uxcellent/uxcellent.dart';

enum UXAppDialogLevel { info, warning, danger }

Color _getColor(UXAppDialogLevel level) {
  switch (level) {
    case UXAppDialogLevel.info:
      return Colors.blue[300] ?? Colors.blue;
    case UXAppDialogLevel.warning:
      return Colors.yellow[300] ?? Colors.yellow;
    case UXAppDialogLevel.danger:
      return Colors.red[300] ?? Colors.red;
  }
}

IconData _getIcon(UXAppDialogLevel level) {
  switch (level) {
    case UXAppDialogLevel.info:
      return Icons.info;
    case UXAppDialogLevel.warning:
      return Icons.warning;
    case UXAppDialogLevel.danger:
      return Icons.error;
  }
}

class UXAppDialogAction {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onPressed;

  UXAppDialogAction({
    required this.label,
    required this.icon,
    this.isPrimary = false,
    required this.onPressed,
  });
}

class UXAppDialogBox extends StatelessWidget {
  final String title;
  final String message;
  final UXAppDialogLevel level;
  final List<UXAppDialogAction> dialogActions;
  final bool showIcon;
  final Widget? titleWidget;

  const UXAppDialogBox({
    super.key,
    required this.title,
    required this.message,
    required this.level,
    required this.dialogActions,
    this.showIcon = true,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color levelColor = _getColor(level);
    final IconData icon = _getIcon(level);
    return isIOS
        ? _buildCupertinoAlert(levelColor, colorScheme)
        : _buildMaterialAlert(levelColor, colorScheme, icon);
  }

  AlertDialog _buildMaterialAlert(
      Color levelColor, ColorScheme colorScheme, IconData icon) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      title: titleWidget ?? Text(title),
      icon: showIcon
          ? Icon(
              icon,
              color: levelColor,
            )
          : null,
      iconColor: levelColor,
      content: Text(message),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: dialogActions.isNotEmpty
          ? dialogActions
              .map(
                (action) => OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: BorderSide(
                      color:
                          action.isPrimary ? levelColor : colorScheme.primary,
                    ),
                  ),
                  onPressed: action.onPressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        action.icon,
                        color:
                            action.isPrimary ? levelColor : colorScheme.primary,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        action.label,
                        style: TextStyle(
                            color: action.isPrimary
                                ? levelColor
                                : colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              )
              .toList()
          : [],
    );
  }

  CupertinoAlertDialog _buildCupertinoAlert(
      Color levelColor, ColorScheme colorScheme) {
    return CupertinoAlertDialog(
      title: titleWidget ?? Text(title),
      content: Text(message),
      actions: dialogActions.isNotEmpty
          ? dialogActions
              .map(
                (action) => CupertinoDialogAction(
                  onPressed: action.onPressed,
                  textStyle: TextStyle(
                    color: action.isPrimary ? levelColor : colorScheme.primary,
                  ),
                  child: Text(action.label),
                ),
              )
              .toList()
          : [],
    );
  }
}
