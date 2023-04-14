import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/app/components/shape.dart';
import 'package:task_list/app/components/title_custom.dart';
import 'package:task_list/app/repository/task_repository.dart';
import 'package:task_list/app/view/task_list_page/task_provider.dart';

import '../../model/task.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider()..fetchTasks(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Header(),
            Expanded(child: _TaskList()),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _showNewTaskModal(context),
            child: const Icon(Icons.add, size: 30),
          ),
        ),
      ),
    );
  }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ChangeNotifierProvider.value(
        value: context.read<TaskProvider>(),
        child: _NewTaskModal(),
      ),
    );
  }
}

class _NewTaskModal extends StatelessWidget {
  _NewTaskModal({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  final _controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 23),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleCustom(title: 'Nueva Tarea'),
          const SizedBox(height: 26),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'Titulo de la tarea'),
            controller: _controller,
          ),
          const SizedBox(height: 26),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'Descripción de la tarea'),
            controller: _controllerDescription,
          ),
          const SizedBox(height: 26),
          ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  final task = Task(_controller.text,
                      description: _controllerDescription.text);
                  context.read<TaskProvider>().addNewTask(task);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Guardar'))
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          Row(
            children: const [
              Shape(),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/tasks-list-image.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 16),
              const TitleCustom(
                title: 'Completa tus tareas',
                color: Colors.white,
              ),
              const SizedBox(height: 24),
            ],
          )
        ],
      ),
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleCustom(title: 'Tareas'),
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (_, provider, __) {
                if (provider.taskList.isEmpty) {
                  return const Center(
                    child: Text('No hay tareas'),
                  );
                }
                return ListView.separated(
                  itemCount: provider.taskList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (_, index) => _TaskItem(
                    provider.taskList[index],
                    onTap: () =>
                        provider.onTaskDoneChange(provider.taskList[index]),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key, this.onTap}) : super(key: key);

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 21),
            child: Row(
              children: [
                Icon(task.done
                    ? Icons.check_box
                    : Icons.check_box_outline_blank),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title),
                    Text(
                      task.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
