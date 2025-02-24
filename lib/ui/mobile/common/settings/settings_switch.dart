import 'package:flutter/material.dart';

class SettingsSwitchTile extends StatelessWidget {
  const SettingsSwitchTile({
    Key? key,
    required this.name,
    required this.desc,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String name;
  final String desc;
  final bool value;
  final Function(bool) onChanged;

  Color? Function(Set<WidgetState>) switchColor(
      BuildContext context, double opacity) {
    return (states) {
      if (states.contains(WidgetState.selected)) {
        return Theme.of(context).colorScheme.primary.withValues(alpha: opacity);
      } else {
        return Theme.of(context)
            .colorScheme
            .secondary
            .withValues(alpha: opacity);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return SwitchTheme(
      data: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(switchColor(context, 1.0)),
        trackColor: WidgetStateProperty.resolveWith(switchColor(context, 0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13.0,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Switch(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
