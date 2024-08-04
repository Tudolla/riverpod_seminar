import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:riverpod_seminar/pages/change_notifier_provider/change_notifier_provider_page.dart';
import 'package:riverpod_seminar/pages/future_provider/future_provider_page.dart';
import 'package:riverpod_seminar/pages/future_provider/future_provider_page.dart';
import 'package:riverpod_seminar/pages/provider/provider_page.dart';
import 'package:riverpod_seminar/pages/state_notifider_provider/state_notifier_provider_page.dart';
import 'package:riverpod_seminar/pages/state_provider/state_provider_page.dart';
import 'package:riverpod_seminar/pages/stream_provider/stream_provider_page.dart';

class Lamborghini extends StatefulWidget {
  const Lamborghini({super.key});

  @override
  State<Lamborghini> createState() => _LamborghiniState();
}

class _LamborghiniState extends State<Lamborghini> {
  @override
  Widget build(BuildContext context) {
    final sizeOfWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("(•ˋ_ˊ•)     Riverpod Seminar     (•ˋ_ˊ•)"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: sizeOfWidth,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.withOpacity(.6)),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProviderPage()));
                  },
                  child: const Text(
                    "Provider",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: sizeOfWidth,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pinkAccent.withOpacity(0.6)),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StateProviderPage()));
                  },
                  child: const Text(
                    "State Provider",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: sizeOfWidth,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple.withOpacity(0.4)),
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const StateNotifierProviderPage());
                  },
                  child: const Text(
                    "State Notifier Provider",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: sizeOfWidth,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orangeAccent.withOpacity(0.5)),
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const FutureProviderPage());
                  },
                  child: const Text(
                    "Future Provider",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: sizeOfWidth,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlue.withOpacity(0.5),
                ),
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const StreamProviderPage());
                  },
                  child: const Text(
                    "Stream Provider",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: sizeOfWidth,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown.withOpacity(0.5)),
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const ChangeNotifierProviderPage());
                  },
                  child: const Text(
                    "Change Notifier Provider",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
