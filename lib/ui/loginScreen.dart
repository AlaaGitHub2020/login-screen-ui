import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginInfo = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  _loginInfo() {
    setState(() {
      if (_nameController.text.trim().isEmpty &&
          _emailController.text.trim().isEmpty &&
          _passwordController.text.trim().isEmpty) {
        loginInfo = 'Please Enter your login Information';
      } else {
        loginInfo =
            'Hello ${_nameController.text} \n Your Email is: ${_emailController.text}\n'
            'Your Password is : ${_passwordController.text}';
      }
    });
  }

  _clearData() {
    setState(() {
      _nameController.clear();
      _passwordController.clear();
      _emailController.clear();
      loginInfo = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 20.0,
          ),
          child: Column(children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(
                'images/userlogin.png',
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                labelText: 'Name',
                hintText: 'Enter your Name ',
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.green,
                ),
                labelText: 'Email',
                hintText: 'Enter your Email ',
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.green,
                  ),
                  labelText: 'Password',
                  hintText: 'Enter Good Password '),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 70.0,
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                    ),
                  ),
                  onPressed: _loginInfo,
                ),
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                    ),
                  ),
                  onPressed: _clearData,
                ),
              ],
            ),
            Text(
              loginInfo,
              style: TextStyle(
                color: Colors.green,
                fontSize: 23.0,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
