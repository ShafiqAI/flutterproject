import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Opacity _buildText() {
      return Opacity(
        opacity: 0.54,
        child: Text("Register your account",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
            )),
      );
    }

    return MaterialButton(
      height: 40.0,
      onPressed: this.onPressed,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildText(),
        ],
      ),
    );
  }
}

class ConfirmRegisterButton extends StatelessWidget {
  ConfirmRegisterButton({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    Opacity _buildText() {
      return Opacity(
        opacity: 0.54,
        child: Text("Confirm Register",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
            )),
      );
    }

    return MaterialButton(
      height: 40.0,
      onPressed: this.onPressed,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildText(),
        ],
      ),
    );
  }
}
