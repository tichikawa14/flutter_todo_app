import 'package:flutter/material.dart';
import 'package:mytodoapp/todo_add_page.dart';
import 'package:mytodoapp/todo_update_page.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

// リスト一覧画面用Widget
class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('リスト一覧')
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                todoList.removeAt(index);
              });

              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(' 削除しました！')));
            },
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),

            ),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(todoList[index]),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final updateText = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return TodoUpdatePage(todoList[index], index);
                        }),
                      );
                      if (updateText != null) {
                        setState(() {
                          todoList[index] = updateText;
                        });
                      }
                    },
                    child: Text('更新', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
