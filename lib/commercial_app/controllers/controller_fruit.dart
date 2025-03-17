import 'package:get/get.dart';
import 'package:khanhvinh_flutter_app/commercial_app/models/fruit.model.dart';

class ControllerFruit extends GetxController {
  var fruits = <Fruit>[];
  var gh = <GH_Item>[];
  int get slGH => gh.length;
  static ControllerFruit get() => Get.find();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // fruits = FruitSnapshot.getAll();
    // update(["fruits"]);
    _docDL();
  }

  void _docDL() async {
    fruits = await FruitSnapshot.getFruit();
    update(["fruits"]);
  }

  void themGH(Fruit f) {
    for (var item in gh) {
      if (item.fruit.id == f.id) {
        item.sl++;
        update(["gh"]);
        return;
      }
    }
    gh.add(GH_Item(fruit: f, sl: 1));
    update(["gh"]);
    return;
  }
}

class BindingsHomeFruitStore extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ControllerFruit(),
    );
  }
}

class GH_Item {
  Fruit fruit;
  int sl;

  GH_Item({required this.fruit, required this.sl});
}
