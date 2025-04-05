import 'package:flutter/material.dart';

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
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3,
              width: 28,
              color: isSelected ? Colors.blue : Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
