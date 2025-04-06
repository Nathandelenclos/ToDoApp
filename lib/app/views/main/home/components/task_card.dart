import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/theme_provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    return Container(
      margin: theme.spacing.horizontal(theme.spacing.sm),
      decoration: BoxDecoration(
        boxShadow: theme.shadows.defaultShadow,
        color: theme.customColors.brand.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: theme.customColors.brand.defaultColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: 35,
        ),
        Container(
          padding: theme.spacing.all(theme.spacing.md),
          child: Column(
            spacing: theme.spacing.lg,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: theme.spacing.sm,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(
                        backgroundColor: theme.customColors.brand.defaultColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: theme.spacing.all(0)),
                    color: theme.customColors.brand.background,
                  ),
                  Text("Tap plus to create a new task ")
                ],
              ),
              Container(
                height: 0.5,
                color: theme.customColors.neutral.background,
                width: MediaQuery.of(context).size.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add your Task",
                    style: theme.text.body,
                  ),
                  Text(
                    "Today, Mon 20 Jul 2022",
                    style: theme.text.body,
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
