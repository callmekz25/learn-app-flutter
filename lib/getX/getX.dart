import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final _counter = 0.obs;
  int get counter => _counter.value;

  void increase() {
    _counter.value++;
  }

  void decrease() {
    _counter.value--;
  }
}

class PageCounterGetX extends StatelessWidget {
  PageCounterGetX({super.key});
  final controller = Get.put(CounterController());
  final controller2 = Get.put(CounterController(), tag: "my tag");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get X Example"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Obx(
              () => Text(
                "${controller._counter}",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
            GetX<CounterController>(
                builder: (controller) => Text("${controller._counter}")),
            GetX<CounterController>(
                tag: "my tag",
                builder: (controller) => Text("${controller._counter}")),
            ElevatedButton(
                onPressed: () {
                  controller.increase();
                  controller2.decrease();
                },
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.red,
                )),
            ElevatedButton(
                onPressed: () {
                  controller.decrease();
                  controller2.increase();
                },
                child: Icon(
                  Icons.remove,
                  size: 30,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
