import 'package:flutter/material.dart';
import 'validation.dart';

class Registration2 extends StatefulWidget {
  @override
  _Registration2State createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
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
      child: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(30.0),
                    bottomRight: const Radius.circular(30.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Placeholder(
                          color: Color(0xFFD00E3F),
                        ),
                      ),
                    ),
                    inputField(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      text: 'E-mail',
                      icon: Icons.alternate_email,
                      validator: validation.validateEmail,
                    ),
                    inputField(
                      padding: EdgeInsets.all(0),
                      text: 'Password',
                      icon: Icons.lock,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: FlatButton(
                        color: Color(0xFFBA0D38),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        onPressed: _validator,
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  child: Text(
                    'LogIn',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Padding inputField(
    {EdgeInsets padding, String text, IconData icon, Function validator}) {
  return Padding(
    padding: padding,
    child: TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          labelText: text,
          labelStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD00E3F), width: 2),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD00E3F), width: 2),
            borderRadius: BorderRadius.circular(30.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD00E3F), width: 2),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD00E3F), width: 2),
            borderRadius: BorderRadius.circular(30.0),
          )),
      style: TextStyle(color: Colors.grey[350]),
      cursorColor: Colors.grey,
      validator: validator,
      onSaved: (value) {
        print(value);
      },
    ),
  );
}
