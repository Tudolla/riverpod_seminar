import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/pages/state_notifider_provider/state_notifier_provider.dart';

class StateNotifierProviderPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StateNotifierProviderPageState();

  const StateNotifierProviderPage({super.key});
}

class _StateNotifierProviderPageState
    extends ConsumerState<StateNotifierProviderPage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void _onSubmit(WidgetRef ref, String inputValue) {
    ref.read(userProvider.notifier).updateName(inputValue);
  }

  void _onSubmitAll(WidgetRef ref, String inputAge, String inputName) {
    ref.read(userProvider.notifier).updateAge(int.parse(inputAge));
    _onSubmit(ref, inputName);
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
    final user = ref.watch(userProvider);

    // watch the change of userProvider, when any property changing, rebuild all .
    final userDirect = ref.watch(userProvider).age;
    // get a property of User, only rebuild with value selected
    final userSelect = ref.watch(userProvider.select((value) => value.age));

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        centerTitle: true,
        title: const Text(
          "State Notifier Provider",
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
                    )),
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
                    ref, _ageController.text, _nameController.text),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter your age",
                    hintStyle: const TextStyle(
                      fontSize: 20,
                    )),
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
                "My company name is ${user.name}\n\nI'm ${user.age} years old",
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
