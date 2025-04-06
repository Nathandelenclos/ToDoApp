import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/providers/theme_provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task, this.onDelete});

  final Task task;
  final Function(Task)? onDelete;

  Color _getPriorityColor(int priority) {
    switch (priority) {
      case 0:
        return Colors.grey.shade300;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.amber;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

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
            color: _getPriorityColor(task.priority),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                spacing: theme.spacing.sm,
                children: [
                  Text(
                    task.title,
                    style: theme.text.title,
                  ),
                  Text(
                    task.description,
                    style: theme.text.subtitle,
                  )
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
                    "Date limite : ${task.dueDate.toLocal().toString().split(' ')[0]}",
                    style: theme.text.body,
                  ),
                  IconButton(
                    onPressed: () {
                      if (onDelete != null) {
                        onDelete!(task);
                      }
                    },
                    color: theme.customColors.error.defaultColor,
                    style: IconButton.styleFrom(
                      backgroundColor: theme.customColors.error.background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: theme.spacing.all(0),
                    ),
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
