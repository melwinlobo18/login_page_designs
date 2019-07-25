import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'validation.dart';

class Registration3 extends StatefulWidget {
  @override
  _Registration3State createState() => _Registration3State();
}

class _Registration3State extends State<Registration3> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.15,
            child: Text(
              'Hey There !',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.35,
            top: MediaQuery.of(context).size.height * -0.05,
            child: Container(
              height: 300,
              width: 300,
              child: FlareActor(
                "animations/minion.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Wave",
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              height: 450,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Hero(
                  tag: 'card',
                  child: Card(
                    child: ListView(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            inputField(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                text: 'First Name *',
                                prefixIcon: Icons.person,
                                validator: validation.validateFirstName),
                            inputField(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                text: 'Last Name *',
                                prefixIcon: Icons.person,
                                validator: validation.validateLastName),
                            inputField(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                text: 'E-mail *',
                                prefixIcon: Icons.alternate_email,
                                validator: validation.validateEmail),
                            inputField(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              text: 'Password *',
                              prefixIcon: Icons.lock,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: FlatButton(
                                color: Colors.orange,
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 50),
                                onPressed: _validator,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.15,
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account ?',
                  style: TextStyle(
                    color: Colors.grey[750],
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    ' Sign in',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Padding inputField(
    {EdgeInsets padding,
    String text,
    IconData prefixIcon,
    Function validator}) {
  return Padding(
    padding: padding,
    child: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.orange,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      style: TextStyle(color: Colors.grey[800]),
      cursorColor: Colors.grey,
      validator: validator,
      onSaved: (value) {
        print(value);
      },
    ),
  );
}
