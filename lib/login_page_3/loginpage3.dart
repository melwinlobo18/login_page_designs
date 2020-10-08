import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Login3 extends StatefulWidget {
  @override
  _Login3State createState() => new _Login3State();
}

class _Login3State extends State<Login3> with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isButtonVisible = false;
  bool isPasswordIconVisible = false;
  bool isEmailIconVisible = false;
  String animation = 'idle';

  @override
  void initState() {
    emailController.addListener(emailEntered);
    passwordController.addListener(passwordEntered);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void emailEntered() {
    if (emailController.value.text.isNotEmpty) {
      setState(() {
        isEmailIconVisible = true;
      });
    }
    if (emailController.value.text.isEmpty) {
      setState(() {
        isEmailIconVisible = false;
      });
    }
  }

  void passwordEntered() {
    if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty) {
      setState(() {
        isButtonVisible = true;
      });
    }
    if (emailController.value.text.isEmpty ||
        passwordController.value.text.isEmpty) {
      setState(() {
        isButtonVisible = false;
      });
    }
    if (passwordController.value.text.isNotEmpty) {
      setState(() {
        isPasswordIconVisible = true;
      });
    }
    if (passwordController.value.text.isEmpty) {
      setState(() {
        isPasswordIconVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      color: Colors.orange,
                      child: Center(
                        child: FlareActor(
                          "assets/animations/minion.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: "$animation",
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.46,
                      color: Colors.white,
                    )
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Hero(
                      tag: 'card',
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            inputField(
                                padding: EdgeInsets.only(
                                    bottom: 20, left: 10, right: 10),
                                text: 'E-mail',
                                prefixIcon: Icons.alternate_email,
                                controller: emailController,
                                suffixIcon: Icons.check,
                                isSuffixIconVisible: isEmailIconVisible),
                            inputField(
                                padding: EdgeInsets.only(
                                    bottom: 20, left: 10, right: 10),
                                text: 'Password',
                                prefixIcon: Icons.lock,
                                controller: passwordController,
                                suffixIcon: Icons.check,
                                isSuffixIconVisible: isPasswordIconVisible,
                                obscureText: true),
                            Center(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            Visibility(
                              visible: isButtonVisible,
                              child: FlatButton(
                                color: Colors.orange,
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 50),
                                onPressed: () {
                                  setState(() {
                                    animation = 'Jump';
                                  });
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),
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
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.85,
                  left: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.orange,
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/registration3');
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Padding inputField(
    {EdgeInsets padding,
    String text,
    IconData prefixIcon,
    IconData suffixIcon,
    bool isSuffixIconVisible,
    TextEditingController controller,
    bool obscureText = false}) {
  return Padding(
    padding: padding,
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.orange,
        ),
        suffixIcon: Visibility(
          visible: isSuffixIconVisible,
          child: Icon(
            suffixIcon,
            color: Colors.orange,
          ),
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
      ),
      style: TextStyle(color: Colors.grey[800]),
      cursorColor: Colors.grey,
      onSaved: (value) {
        print(value);
      },
    ),
  );
}
