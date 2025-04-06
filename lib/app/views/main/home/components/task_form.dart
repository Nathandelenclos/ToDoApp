import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/DatabaseHelper.dart';

class TaskForm extends StatefulWidget {
  final VoidCallback onSubmit;

  const TaskForm({super.key, required this.onSubmit});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  DateTime? _dueDate;
  int _priority = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Nouvelle tâche", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Titre"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Champ requis" : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(_dueDate == null
                        ? 'Aucune date sélectionnée'
                        : 'Date limite : ${_dueDate!.toLocal().toString().split(' ')[0]}'),
                  ),
                  TextButton(
                    onPressed: _pickDate,
                    child: const Text("Choisir une date"),
                  ),
                ],
              ),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: "Priorité"),
                value: _priority,
                items: List.generate(5, (i) => i).map((value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text("Priorité $value"),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _priority = val);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Ajouter"),
                onPressed: _submit,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate() && _dueDate != null) {
      final task = Task(
        title: _titleController.text,
        description: _descController.text,
        dueDate: _dueDate!,
        priority: _priority,
      );
      await DatabaseHelper().insertTask(task);
      widget.onSubmit();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }
  }
}
