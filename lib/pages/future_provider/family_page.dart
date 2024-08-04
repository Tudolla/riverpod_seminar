import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seminar/models/user_future_provider_model.dart';

final fetchUserDetailProvider = FutureProvider.family((ref, String input) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchDetailUserData(input);
});

class FutureFamilyPage extends ConsumerStatefulWidget {
  const FutureFamilyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __FutureFamilyPageStateState();
}

class __FutureFamilyPageStateState extends ConsumerState<FutureFamilyPage> {
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchUserDetailProvider(userNo)).when(data: (data) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber[200],
          title: const Text(
            "Family Future Provider",
            style: TextStyle(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) => setState(() {
                    userNo = value;
                  }),
                ),
              ),
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 23,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.email,
                style: const TextStyle(
                  fontSize: 23,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      );
    }, error: (error, stackTrace) {
      return Scaffold(
        body: Center(child: Text(error.toString())),
      );
    }, loading: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
