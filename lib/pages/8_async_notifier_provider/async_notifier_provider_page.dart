import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/pages/8_async_notifier_provider/async_notifier_provider.dart';

// final list = Provider((ref) => asyncTodosProvider);

class AsyncNotifierProviderPage extends ConsumerStatefulWidget {
  const AsyncNotifierProviderPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AsyncNotifierProviderPageState();
}

class _AsyncNotifierProviderPageState
    extends ConsumerState<AsyncNotifierProviderPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(loadMoreData);
  }

  void loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(asyncTodosProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoList = ref.watch(asyncTodosProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "AsyncNotifierProvider",
          style: TextStyle(
            fontFamily: "fontApp",
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: todoList.when(
        data: (todo) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: todo.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(todo[index].id.toString()),
              title: Text(todo[index].title),
              trailing: Checkbox(
                value: todo[index].completed,
                onChanged: (_) {
                  ref
                      .read(asyncTodosProvider.notifier)
                      .toggleTodoCompletion(todo[index].id);
                  ref
                      .read(asyncTodosProvider.notifier)
                      .removeTodo(todo[index].id);
                },
              ),
            );
          },
        ),
        error: (error, stackTrace) {
          return Scaffold(
            body: Center(
              child: Text("Error: $error"),
            ),
          );
        },
        loading: () {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // return the inital state of Provider
          ref.invalidate(asyncTodosProvider);

          // return ui back
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
          );
        },
        child: const Icon(
          Icons.refresh_outlined,
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}
