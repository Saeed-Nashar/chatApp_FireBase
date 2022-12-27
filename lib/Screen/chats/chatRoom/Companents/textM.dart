

import 'package:flutter/material.dart';


import '../../../../constants.dart';


class textM extends StatelessWidget {
  const textM({
    Key? key,
    this.message,
  }) : super(key: key);


  final Map<String, dynamic>? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity( message!['sendby'] ? 1 : 0.1),//****
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            message!['message'],
            style: TextStyle(
              color:  message!['sendby']
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
      ),
    );
  }
}
