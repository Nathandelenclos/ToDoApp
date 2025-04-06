import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/views/main/home/components/task_card.dart';
import 'package:todo/app/views/main/home/components/task_form.dart';
import 'package:todo/models/task.dart';
import 'package:todo/providers/theme_provider.dart';
import 'package:todo/services/DatabaseHelper.dart';
import 'package:todo/utils/theme/app_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTaskModal(context),
          child: const Icon(Icons.add),
        ),
        body: _buildBody(theme),
      ),
    );
  }

  void _showAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
          ),
          child: TaskForm(
            onSubmit: () {
              setState(() {});
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  Widget _buildBody(AppTheme theme) {
    return Column(
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
        Expanded(child: _buildTaskCards()),
      ],
    );
  }

  Widget _buildTaskCards() {
    return FutureBuilder<List<Task>>(
      future: DatabaseHelper().getTasks().then((tasks) {
        tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
        tasks.sort((a, b) => b.priority.compareTo(a.priority));
        return tasks;
      }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Aucune tâche'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TaskCard(
              task: snapshot.data![index],
              onDelete: (task) async {
                await DatabaseHelper().deleteTask(task.id!);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }
}
