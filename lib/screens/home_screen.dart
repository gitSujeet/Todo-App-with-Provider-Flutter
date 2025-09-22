import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openAddTaskSheet(BuildContext context) {
    final controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16, // ✅ pushes up with keyboard
          ),
          child: SingleChildScrollView( // ✅ makes it scrollable
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Add New Task",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Enter task title",
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                  onSubmitted: (_) {
                    if (controller.text.isNotEmpty) {
                      Provider.of<TaskProvider>(context, listen: false)
                          .addTask(controller.text);
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      Provider.of<TaskProvider>(context, listen: false)
                          .addTask(controller.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add Task"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("📝 My Tasks"),
        centerTitle: true,
      ),
      body: Consumer<TaskProvider>(
        builder: (ctx, taskProvider, _) {
          if (taskProvider.tasks.isEmpty) {
            return const Center(
              child: Text(
                "No tasks yet!\nTap + to add one.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: taskProvider.tasks.length,
            itemBuilder: (ctx, i) => TaskItem(task: taskProvider.tasks[i]),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddTaskSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
