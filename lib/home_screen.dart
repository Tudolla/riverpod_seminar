import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod_seminar/pages/6_change_notifier_provider/change_notifier_provider_page.dart';
import 'package:riverpod_seminar/pages/4_future_provider/future_provider_page.dart';
import 'package:riverpod_seminar/pages/1_provider/provider_page.dart';
import 'package:riverpod_seminar/pages/3_state_notifider_provider/state_notifier_provider_page.dart';
import 'package:riverpod_seminar/pages/2_state_provider/state_provider_page.dart';
import 'package:riverpod_seminar/pages/5_stream_provider/stream_provider_page.dart';
import 'package:riverpod_seminar/pages/7_notifier_provider/notifier_provider_page.dart';
import 'package:riverpod_seminar/pages/8_async_notifier_provider/async_notifier_provider_page.dart';

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
                height: 30,
              ),
              const Center(
                child: Text(
                  "New in Riverpod 2.0",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 245, 149, 25)
                              .withOpacity(0.5)),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const NotifierProviderPage());
                        },
                        child: const Text(
                          "Notifier Provider",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.withOpacity(0.5)),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const AsyncNotifierProviderPage());
                        },
                        child: const Text(
                          "Async Notifier Provider",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
