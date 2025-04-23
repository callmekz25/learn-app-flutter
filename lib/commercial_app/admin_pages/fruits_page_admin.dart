import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:khanhvinh_flutter_app/commercial_app/admin_pages/fruit_add_page.dart';
import 'package:khanhvinh_flutter_app/helpers/dialog.dart';
import 'package:khanhvinh_flutter_app/my_widgets/async_widget.dart';

import '../models/fruit.model.dart';

class PageFruitsAdmin extends StatelessWidget {
  PageFruitsAdmin({super.key});
  late BuildContext myContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page admin"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder<List<Fruit>>(
          stream: FruitSnapshot.getFruitStream(),
          builder: (context, snapshot) {
            myContext = context;
            return AsyncWidget(
              snapshot: snapshot,
              builder: (context, snapshot) {
                var list = snapshot.data! as List<Fruit>;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        Fruit fruit = list[index];
                        return Slidable(
                          key: const ValueKey(0),

                          // The end action pane is the one at the right or the bottom side.
                          endActionPane: ActionPane(
                            extentRatio: 0.6,
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                // An action can be bigger than the others.

                                onPressed: (context) {},
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Cập nhật',
                              ),
                              SlidableAction(
                                onPressed: (context) async {
                                  String? confirm = await showConfirmDialog(
                                      myContext,
                                      "Bạn có muốn xoá ${fruit.ten}?");
                                  if (confirm == "ok") {
                                    FruitSnapshot.delete(fruit.id);
                                    ScaffoldMessenger.of(myContext)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(myContext)
                                        .showSnackBar(SnackBar(
                                            content:
                                                Text("Đã xoá ${fruit.ten}")));
                                  }
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Xoá',
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.network(fruit.anh ?? "Link"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${fruit.id}",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      "${fruit.ten}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${fruit.gia}đ",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 18),
                                    ),
                                    Text(
                                      "${fruit.moTa ?? ""}",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            thickness: 1.5,
                          ),
                      itemCount: list.length),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PageAddFruit(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
