import 'package:flutter/material.dart';
import '../api/api_client.dart';

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

class MyCustomFormState extends State<MyCustomForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  final textController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Center(
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
                    controller: textController,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        locationSearchByString(textController.text);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing search')));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
