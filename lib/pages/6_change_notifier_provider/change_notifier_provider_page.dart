import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_change_notifier_provider_model.dart';
import 'package:riverpod_seminar/pages/6_change_notifier_provider/change_notifier_provider.dart';

class ChangeNotifierProviderPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeNotifierProviderPageState();

  const ChangeNotifierProviderPage({super.key});
}

class _ChangeNotifierProviderPageState
    extends ConsumerState<ChangeNotifierProviderPage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void _onSubmitAll(
    WidgetRef ref,
    String inputAge,
    String inputName,
  ) {
    ref.read(userChangeNotifierProvider).updateAll(
          inputName,
          int.parse(inputAge),
        );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  ref.watch(userChangeNotifierProvider).user =
    //    const  User(age: 25, name: "Bruno Fenardet");

    final user = ref.watch(userChangeNotifierProvider).user;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        centerTitle: true,
        title: const Text(
          "Change Notifier Provider",
          style: TextStyle(
            fontFamily: "fontApp",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter name company",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: TextField(
                controller: _ageController,
                onSubmitted: (value) => _onSubmitAll(
                  ref,
                  _ageController.text,
                  _nameController.text,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter your age",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 39,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                "Company name: ${user.name}\n\nI'm ${user.age} years old",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
