import 'package:flutter/material.dart';
import '../utils/validation.dart';

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
          body: CustomPaint(
            painter: ShapesPainter(),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CircleAvatar(
                        child: Image.asset('assets/images/profile_avatar.png'),
                        radius: 80,
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
                  padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
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

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint
    paint.color = Colors.white12;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, 150);

    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 380.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
