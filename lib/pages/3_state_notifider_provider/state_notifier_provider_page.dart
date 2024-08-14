import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/pages/3_state_notifider_provider/notifier_provider.dart';
import 'package:riverpod_seminar/pages/3_state_notifider_provider/state_notifier_provider.dart';

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
  final _fcNameController = TextEditingController();
  final _fcPriceController = TextEditingController();

  void _onSubmit(WidgetRef ref, String inputValue) {
    ref.read(userProvider.notifier).updateName(inputValue);
  }

  void _onSubmitAll(WidgetRef ref, String inputAge, String inputName) {
    ref.read(userProvider.notifier).updateAge(int.parse(inputAge));
    _onSubmit(ref, inputName);

    // ref.read(userProvider.notifier).updateNameAndAge(inputName, int.parse(inputAge));
  }

  void _changeFC(WidgetRef ref, String fcName, int fcPrice) {
    ref.read(fCNotifierProvider.notifier).updateFC(fcName, fcPrice);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _fcNameController.dispose();
    _fcNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final myFootbalClub = ref.watch(fCNotifierProvider);

    // compare efficiency between "select" and properties watched
    final userDirectChange = ref.watch(userProvider).age;
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
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                "My company name is: ${user.name}\nI'm: ${user.age} years old",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Test with notifierprovider",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: _fcNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter name club",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: TextField(
                controller: _fcPriceController,
                onSubmitted: (value) {
                  _changeFC(
                    ref,
                    _fcNameController.text,
                    int.parse(_fcPriceController.text),
                  );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Enter price club",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                "My favorite FC is: ${myFootbalClub.name}\nhas price: ${myFootbalClub.price}\$",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
