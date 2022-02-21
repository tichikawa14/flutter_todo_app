import 'package:flutter/material.dart';

// リスト更新画面用Widget
class TodoUpdatePage extends StatefulWidget {
  TodoUpdatePage(this.text, this.index);
  String text;
  int index;

  @override
  _TodoUpdatePageState createState() => _TodoUpdatePageState();
}

class _TodoUpdatePageState extends State<TodoUpdatePage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('リスト更新')
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                initialValue: widget.text,
                onChanged: (String value) {
                  setState(() {
                    _text = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(_text);
                  },
                  child: Text('リスト更新', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 8,),
              Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('キャンセル'),
                  )
              )
            ]
        ),
      ),
    );
  }
}
