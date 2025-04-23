import 'package:khanhvinh_flutter_app/commercial_app/supabase.helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Fruit {
  int id;
  int? gia;
  String ten;
  String? moTa, anh;
  Fruit({required this.id, this.gia, required this.ten, this.moTa, this.anh});
  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
        id: json['id'] as int,
        ten: json['ten'] as String,
        moTa: json['moTa'] as String,
        anh: json['anh'] as String,
        gia: json['gia']);
  }
  Map<dynamic, dynamic> toJson() {
    return {"id": id, "ten": ten, "moTa": moTa, "anh": anh, "gia": gia};
  }
}

class FruitSnapshot {
  Fruit fruit;

  FruitSnapshot({required this.fruit});
  Future<dynamic> update(Fruit newFruit) async {
    final supabase = Supabase.instance.client;
    var data = await supabase
        .from("Fruit")
        .update(newFruit.toJson())
        .eq("id", fruit.id);

    return data;
  }

  static Future<void> delete(fruitId) async {
    final supabase = Supabase.instance.client;
    await supabase.from("Fruit").delete().eq("id", fruitId);
    await removeImage(bucket: "fruits", path: "fruit_${fruitId}.jpg");
    return;
  }

  static Future<Fruit> insert(Fruit newFruit) async {
    final supabase = Supabase.instance.client;
    var data = await supabase.from('Fruit').insert(newFruit.toJson());
    return data;
  }

  static Future<List<Fruit>> getFruit() async {
    final supabase = Supabase.instance.client;
    List<Fruit> fruits = [];
    final data = await supabase.from("Fruit").select("");
    fruits = data
        .map(
          (e) => Fruit.fromJson(e),
        )
        .toList();
    print(supabase);
    print(data);
    return fruits;
  }

  static List<Fruit> getAll() {
    return data;
  }

  static Future<Map<int, Fruit>> getMapFruit() async {
    return await getMapData(
      table: "Fruit",
      fromJson: Fruit.fromJson,
      getId: (fruit) => fruit.id,
    );
  }

  static Stream<List<Fruit>> getFruitStream() {
    return getDataStream(table: "Fruit", ids: ["id"], fromJson: Fruit.fromJson);
  }

  static listenFruitChange(Map<int, Fruit> maps, {Function()? updateUI}) {
    listenDataChange(maps,
        channel: "public:fruit",
        schema: "public",
        fromJson: Fruit.fromJson,
        getId: (fruit) => fruit.id,
        table: "Fruit");
  }
}

final data = <Fruit>[
  Fruit(
      id: 1,
      ten: "Chuối",
      gia: 1000,
      moTa: "Chuối vàng",
      anh:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0VN3YHKtp0dm2Pi7xerFlgMvr5aIuqjtjPw&s"),
  Fruit(
      id: 2,
      ten: "Táo",
      gia: 1500,
      moTa: "Táo đỏ",
      anh:
          "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGZydWl0c3xlbnwwfHwwfHx8MA%3D%3D"),
  Fruit(
      id: 3,
      ten: "Lê",
      moTa: "Lê vàng",
      gia: 2000,
      anh:
          "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGZydWl0c3xlbnwwfHwwfHx8MA%3D%3D"),
  Fruit(
      id: 4,
      ten: "Bơ",
      gia: 3000,
      moTa: "Bơ xanh",
      anh:
          "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGZydWl0c3xlbnwwfHwwfHx8MA%3D%3D"),
  Fruit(
      id: 5,
      gia: 4000,
      ten: "Măng cầu",
      moTa: "Măng cầu xanh",
      anh:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgvFq3d_FwnONS-l_eIsvgAZ9VzZLAHy2qcw&s"),
  Fruit(
      id: 6,
      gia: 5000,
      ten: "Trái dâu",
      moTa: "Trái dâu",
      anh:
          "https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnJ1aXRzfGVufDB8fDB8fHww"),
  Fruit(
      id: 7,
      ten: "Trái thơm",
      gia: 6000,
      moTa: "Thơm",
      anh:
          "https://images.unsplash.com/photo-1490885578174-acda8905c2c6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZydWl0c3xlbnwwfHwwfHx8MA%3D%3D"),
  Fruit(
      id: 8,
      ten: "Đu đủ",
      gia: 7000,
      moTa: "Đu đủ",
      anh:
          "https://images.unsplash.com/photo-1526318472351-c75fcf070305?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZnJ1aXRzfGVufDB8fDB8fHww"),
  Fruit(
      id: 9,
      ten: "Trái lựu",
      gia: 8000,
      moTa: "Lựu đỏ",
      anh:
          "https://images.unsplash.com/photo-1615485925600-97237c4fc1ec?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGZydWl0c3xlbnwwfHwwfHx8MA%3D%3D"),
  Fruit(
      id: 10,
      ten: "Trái kiwi",
      gia: 9000,
      moTa: "Kiwi",
      anh:
          "https://plus.unsplash.com/premium_photo-1674382739482-5d36b98d653a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGZydWl0c3xlbnwwfHwwfHx8MA%3D%3D"),
];
