import 'package:flutter/material.dart';
import '../utils/validation.dart';

class Registration1 extends StatefulWidget {
  @override
  _Registration1State createState() => _Registration1State();
}

class _Registration1State extends State<Registration1> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  Validation validation = Validation();

  void _validator() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    size: 40,
                    color: Color(0xFF425C5A),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 30, top: 30),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF425C5A),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0xFF425C5A),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        inputField(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            text: 'First Name *',
                            icon: Icons.person,
                            validator: validation.validateFirstName),
                        inputField(
                            padding: EdgeInsets.symmetric(vertical: 0.0),
                            text: 'Last Name *',
                            icon: Icons.person,
                            validator: validation.validateLastName),
                        inputField(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            text: 'E-mail *',
                            icon: Icons.email,
                            validator: validation.validateEmail),
                        inputField(
                            padding: EdgeInsets.symmetric(vertical: 0.0),
                            text: 'Password *',
                            icon: Icons.lock),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                          child: FlatButton(
                            color: Color(0xFFFFCDA3),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            onPressed: _validator,
                            child: Text('Submit'),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have an account ?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                ' Sign in',
                                style: TextStyle(
                                    color: Color(0xFFFFCDA3), fontSize: 16),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  Padding inputField(
      {EdgeInsets padding, String text, IconData icon, Function validator}) {
    return Padding(
      padding: padding,
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0xFFFFCDA3),
          ),
          labelText: text,
          labelStyle: TextStyle(color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          errorStyle: TextStyle(color: Colors.white),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
        ),
        style: TextStyle(color: Colors.grey[350]),
        cursorColor: Colors.grey,
        validator: validator,
        onSaved: (value) {
          print(value);
        },
      ),
    );
  }
}
