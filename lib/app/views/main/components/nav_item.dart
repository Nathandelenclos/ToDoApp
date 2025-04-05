import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/theme_provider.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final int index;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3,
              width: 28,
              color: isSelected
                  ? theme.customColors.brand.defaultColor
                  : theme.customColors.brand.outline,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Icon(icon,
                  color: isSelected
                      ? theme.customColors.brand.defaultColor
                      : theme.customColors.neutral.defaultColor),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
