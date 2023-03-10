
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../constants.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Map<String, dynamic>? chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(chat!['image_url']),
                ),
              /*  if (chat.isActive)
                  Positioned(
                    // ask about left and top
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context)
                                .scaffoldBackgroundColor, // ask here
                            width: 3),
                      ),
                    ),
                  )*/
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat!['username'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),

    ],
    ),
    ),
    ),
    ]
    ),
    ),
    );
  }
}

/*  SizedBox(height: 8),
                   opacity: 0.64,
                      child: Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           Opacity(
              opacity: 0.64,
              child: Text(chat.time),
            ),*/

