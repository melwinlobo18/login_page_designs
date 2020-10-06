import 'package:flutter/material.dart';

class Login2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomPaint(
        foregroundPainter: ShapesPainter(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    CircleAvatar(
                      child: Image.asset('assets/images/profile_avatar.png'),
                      radius: 80,
                    ),
                    SizedBox(height: 25),
                    inputField(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      text: 'E-mail',
                      icon: Icons.alternate_email,
                    ),
                    inputField(
                      padding: EdgeInsets.all(0),
                      text: 'Password',
                      icon: Icons.lock,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: FlatButton(
                        color: Color(0xFFC30D3B),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Center(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 16),
                    child: Center(
                      child: Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/registration2');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Padding inputField({EdgeInsets padding, String text, IconData icon}) {
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
      ),
      style: TextStyle(color: Colors.grey[350]),
      cursorColor: Colors.grey,
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
    paint.color = Colors.white12;
    var center = Offset(size.width / 2, size.height + 200);
    canvas.drawCircle(center, 380.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
