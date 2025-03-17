import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khanhvinh_flutter_app/getX/getX.dart';

class SimpleStateController extends GetxController {
  int counter = 0;
  static SimpleStateController get({String? tag}) =>
      Get.find<SimpleStateController>(tag: tag);
  void increase1() {
    counter++;
    update(["01"]);
  }

  void increase2() {
    counter++;
    update(["02"]);
  }

  void increaseAll() {
    counter++;
    update(["01", "02"]);
  }
}

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SimpleStateController(),
    );
  }
}

class BindingTempController extends Bindings {
  @override
  void dependencies() {
    Get.create(() => SimpleStateController(), permanent: false);
  }
}

class GetXApp extends StatelessWidget {
  const GetXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetXApp",
      initialBinding: BindingController(),
      home: PageSimpleState(),
    );
  }
}

class PageNext extends StatelessWidget {
  const PageNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page simple state"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<SimpleStateController>(
                init: SimpleStateController.get(),
                id: "01",
                builder: (controller) => Text(
                      "01: ${controller.counter}",
                      style: TextStyle(fontSize: 25),
                    )),
            GetBuilder<SimpleStateController>(
                init: SimpleStateController.get(),
                id: "02",
                builder: (controller) => Text(
                      "02: ${controller.counter}",
                      style: TextStyle(fontSize: 25),
                    )),
            ElevatedButton(
                onPressed: () {
                  SimpleStateController.get().increase1();
                },
                child: Text("Increase 1")),
            ElevatedButton(
                onPressed: () {
                  SimpleStateController.get().increase2();
                },
                child: Text("Increase 2")),
            ElevatedButton(
                onPressed: () {
                  SimpleStateController.get().increaseAll();
                },
                child: Text("Increase all")),
          ],
        ),
      ),
    );
  }
}

class PageSimpleState extends StatelessWidget {
  PageSimpleState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page simple state"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<SimpleStateController>(
                init: SimpleStateController.get(),
                id: "01",
                builder: (controller) => Text(
                      "01: ${controller.counter}",
                      style: TextStyle(fontSize: 25),
                    )),
            GetBuilder<SimpleStateController>(
                init: SimpleStateController.get(),
                id: "02",
                builder: (controller) => Text(
                      "02: ${controller.counter}",
                      style: TextStyle(fontSize: 25),
                    )),
            ElevatedButton(
                onPressed: () {
                  SimpleStateController.get().increase1();
                },
                child: Text("Increase 1")),
            ElevatedButton(
                onPressed: () {
                  SimpleStateController.get().increase2();
                },
                child: Text("Increase 2")),
            ElevatedButton(
                onPressed: () {
                  SimpleStateController.get().increaseAll();
                },
                child: Text("Increase all")),
            ElevatedButton(
                onPressed: () {
                  Get.to(PageNext(), binding: BindingTempController());
                },
                child: Text("Next")),
          ],
        ),
      ),
    );
  }
}
