import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String message;
  final Color color;

  const LoadingIndicator({
    this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  color ?? Colors.black,
                ),
              ),
              if (message != null)
                SizedBox(
                  height: 24.0,
                ),
              if (message != null)
                Text(
                  '$message',
                ),
            ],
          ),
        ),
      ],
    );
  }
}
