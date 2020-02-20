import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    debugPrint('search');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: MyCustomForm(),
      );
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tightForFinite(height: 300),
        padding: EdgeInsets.all(40),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type in a city name',
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please, type in a city';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing search')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            )),
      ),
    );
  }
}
