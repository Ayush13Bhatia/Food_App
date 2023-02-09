import 'dart:math';
import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
                      transform: Matrix4.rotationZ(-10 * pi / 180)..translate(-4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'MealApp',
                        style: TextStyle(
                          color: Theme.of(context).accentTextTheme.headline6!.color,
                          fontSize: 50,
                          fontFamily: 'Anton',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: const AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  AnimationController? _controller;
  Animation<Size>? _heightAnimation;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("An Error Occured!"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Okey"))
              ],
            ));
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _controller!.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller!.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        height: _authMode == AuthMode.Signup ? 320 : 260,
        // height: _heightAnimation!.value.height,
        constraints: BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
        width: deviceSize.width * 0.75,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                AnimatedContainer(
                  constraints: BoxConstraints(
                    minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                    maxHeight: _authMode == AuthMode.Signup ? 1200 : 0,
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  child: FadeTransition(
                    opacity: _opacityAnimation!,
                    child: SlideTransition(
                      position: _slideAnimation!,
                      child: TextFormField(
                        enabled: _authMode == AuthMode.Signup,
                        decoration: const InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: _authMode == AuthMode.Signup
                            ? (value) {
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match!';
                                }
                                return null;
                              }
                            : null,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {},
                    // _submit,
                    child: Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                  ),
                // (
                //   child:
                //
                //   onPressed: _submit,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 30.0, vertical: 8.0),
                //   color: Colors.red,
                //   textColor: Theme.of(context).primaryTextTheme.button!.color,
                // ),
                // RaisedButton(
                //   child: Text(
                //       _authMode == AuthMode.Login ? 'GOOGLE LOGIN' : 'SIGN UP'),
                //   onPressed: _submit,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 30.0, vertical: 8.0),
                //   color: Colors.red,

                //   // Theme.of(context).primaryColor,
                //   textColor: Theme.of(context).primaryTextTheme.button!.color,
                // ),
                ElevatedButton(
                  onPressed: _switchAuthMode,
                  child: Text('${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                ),
                // FlatButton(
                //   child: Text(
                //       '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                //   onPressed: _switchAuthMode,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   color: Colors.red,
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //   textColor: Theme.of(context).primaryTextTheme.button!.color,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirebaseAuthException {
  final String? message;
  FirebaseAuthException(this.message);
  @override
  String toString() {
    return message!;
  }
}
