import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Page"),
      ),
      body: FormText(),
    );
  }
}

class FormText extends StatefulWidget {
  FormText({Key key}) : super(key: key);

  @override
  _FormTextState createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  final mTextController = TextEditingController();
  final mTextFocusNode = FocusNode();
  @override
  void dispose() {
    mTextController.dispose();
    mTextFocusNode.dispose();
    // 资源释放
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    mTextController.addListener(_printTextField);
  }

  _printTextField() {
    print('text:${mTextController.text}');
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var text = '';

    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                autofocus: true, // 自动聚焦
                validator: (value) {
                  text = value;
                  if (value.isEmpty) {
                    return 'text is empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                maxLines: 10,
                maxLength: 300,
                focusNode: mTextFocusNode,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'input something'),
                // onChanged: (value) {
                //   // 当输入的内容发生变化时会调用
                //   print(value);
                // },
                controller: mTextController,
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(text)));
                  mTextFocusNode.requestFocus(); // 点击button后聚焦到某个text
                }
              },
              child: Text("data"),
            ),
          ],
        ));
  }
}
