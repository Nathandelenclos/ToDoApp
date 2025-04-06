import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/views/main/home/components/task_card.dart';
import 'package:todo/providers/theme_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: theme.spacing.horizontal(theme.spacing.lg),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: theme.spacing.sm,
                  children: [
                    Text(
                      "Today",
                      style: theme.text.title,
                    ),
                    Text(
                      "Best platform for creating to-do lists",
                      style: theme.text.caption,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const TaskCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
