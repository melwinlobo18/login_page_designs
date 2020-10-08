import 'package:flutter/material.dart';
import 'package:sample_designs/utils/validation.dart';

class Registration4 extends StatefulWidget {
  @override
  _Registration4State createState() => _Registration4State();
}

class _Registration4State extends State<Registration4> {
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
      child: CustomPaint(
        foregroundPainter: ShapesPainter(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height / 3,
                left: MediaQuery.of(context).size.width / 2.7,
                child: Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2.3,
                left: 0,
                child: Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100)),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: ListView(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'User Name *'),
                              validator: validation.validateFirstName,
                            ),
                            Divider(height: 1),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Email *'),
                              validator: validation.validateEmail,
                            ),
                            Divider(height: 1),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Password *'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.85,
                left: MediaQuery.of(context).size.width / 1.5,
                child: RaisedButton(
                    elevation: 10,
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.check,
                      size: 32,
                      color: Colors.white,
                    ),
                    color: Colors.greenAccent,
                    onPressed: _validator,
                    shape: CircleBorder()),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                right: 0,
                child: RawMaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  fillColor: Colors.white,
                  elevation: 10,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100)),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.orange[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// Top portion
    var paint = Paint();

    paint.color = Colors.orange;

    var topStartPoint = Offset(0, size.height / 2.5);
    var topControlPoint1 = Offset(size.width / 3.3, size.height / 2.8);
    var topControlPoint2 = Offset(size.width / 3.3, size.height / 18.4);
    var topEndPoint = Offset(size.width, 0);

    var path = Path();
    path.lineTo(topStartPoint.dx, topStartPoint.dy);
    path.cubicTo(topControlPoint1.dx, topControlPoint1.dy, topControlPoint2.dx,
        topControlPoint2.dy, topEndPoint.dx, topEndPoint.dy);

    canvas.drawPath(path, paint);

    /// Bottom portion

    paint.color = Colors.blue;

    var bottomStartPoint = Offset(size.width, size.height);
    var bottomControlPoint1 = Offset(size.width / 1.5, size.height / 1.025);
    var bottomControlPoint2 = Offset(size.width / 1.66, size.height / 1.32);
    var bottomEndPoint = Offset(size.width, size.height / 1.4);

    path = Path();
    path.moveTo(0, bottomStartPoint.dy);
    path.cubicTo(
        bottomControlPoint1.dx,
        bottomControlPoint1.dy,
        bottomControlPoint2.dx,
        bottomControlPoint2.dy,
        bottomEndPoint.dx,
        bottomEndPoint.dy);
    path.lineTo(bottomStartPoint.dx, bottomStartPoint.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
