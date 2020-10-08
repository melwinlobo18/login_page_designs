import 'package:flutter/material.dart';

class Login1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF425C5A),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  CircleAvatar(
                    child: Image.asset('assets/images/profile_avatar.png'),
                    radius: 80,
                  ),
                  SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.alternate_email,
                        color: Color(0xFFFFCDA3),
                      ),
                      labelText: 'E-MAIL',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                    style: TextStyle(color: Colors.grey[350]),
                    cursorColor: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Color(0xFFFFCDA3),
                      ),
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                    style: TextStyle(color: Colors.grey[350]),
                    cursorColor: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        print('Forgot Password?');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    color: Color(0xFFFFCDA3),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    onPressed: () {},
                    child: Text('Log In'),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Not a member ?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          ' Join Now',
                          style: TextStyle(
                              color: Color(0xFFFFCDA3), fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/registration1');
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
