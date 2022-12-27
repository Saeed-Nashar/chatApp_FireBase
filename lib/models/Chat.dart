
class Chat {
  final String name, lastMessage, image, time,email;
  final bool isActive;
  final bool isGroup;
   bool select;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
      this.isGroup=false,
    this.email='',
    this.select=false,

  });
}

List chatsData = [
  Chat(
    name: "Saeed AL_Nashar",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/saeed.jpg",
    time: "3m ago",
    isActive: false,
    isGroup: false,
    email: "saeedNashargmail.com"
  ),
  /*Chat(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),*/
  Chat(
    name: "Jacob Jones",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isActive: true,
    isGroup: false
  ),
  Chat(
    name: "Albert Flores",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
    isGroup: false,
  ),
  Chat(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user_3.png",
    time: "3m ago",
    isActive: false,
    isGroup: false,
  ),
  Chat(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
    isGroup: false,
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
    isGroup: false,
  ),

  Chat(
    name: "Albert Flores",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
    isGroup: false,
  ),
  Chat(
      name: "Jacob Jones",
      lastMessage: "You’re welcome :)",
      image: "assets/images/user_4.png",
      time: "5d ago",
      isActive: true,
      isGroup: false
  ),


];
