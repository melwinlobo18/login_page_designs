import 'package:flutter/material.dart';

class Login4 extends StatefulWidget {
  @override
  _Login4State createState() => _Login4State();
}

class _Login4State extends State<Login4> {
  bool _isLogin = false;

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
                left: MediaQuery.of(context).size.width / 2.5,
                child: Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2.3,
                left: 0,
                child: Container(
                  height: 145,
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
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                labelText: 'User Name *'),
                          ),
                          Divider(),
                          TextField(
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
              Positioned(
                top: MediaQuery.of(context).size.height / 2.08,
                left: MediaQuery.of(context).size.width / 1.5,
                child: RaisedButton(
                    elevation: 10,
                    padding: EdgeInsets.all(16),
                    child: !_isLogin
                        ? Icon(
                            Icons.arrow_forward,
                            size: 32,
                            color: Colors.white,
                          )
                        : CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                    color: Colors.greenAccent,
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    shape: CircleBorder()),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.55,
                right: 8,
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange[800],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.4,
                left: 0,
                child: RawMaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  fillColor: Colors.white,
                  elevation: 10,
                  onPressed: () {
                    Navigator.pushNamed(context, '/registration4');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                  ),
                  child: Text(
                    'Register',
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
