import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/professional.dart';
import 'proProfile.dart';

class Inbox extends StatefulWidget {
  final Professional professional;

  const Inbox({
    super.key,
    required this.professional,
  });

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  void callEmoji() {
    print('Emoji Icon Pressed....');
  }

  void callAttachFile() {
    print('Attach File Icon Pressed...');
  }

  void callCamera() {
    print('Camera Icon Pressed...');
  }

  void callVoice() {
    print('Voice Icon Pressed...');
  }

  void callSend() {
    print('Send Icon Pressed...');
  }

  Widget moodIcon() {
    return IconButton(
        icon: Icon(
          Icons.mood,
          color: Color.fromARGB(255, 3, 26, 36),
        ),
        onPressed: () => callEmoji());
  }

  Widget attachFile() {
    return IconButton(
      icon: Icon(
        Icons.attach_file,
        color: Color.fromARGB(255, 3, 26, 36),
      ),
      onPressed: () => callAttachFile(),
    );
  }

  Widget camera() {
    return IconButton(
      icon: Icon(Icons.photo_camera, color: Color.fromARGB(255, 3, 26, 36)),
      onPressed: () => callCamera(),
    );
  }

  Widget send() {
    return IconButton(
      icon: Icon(Icons.send, color: Color.fromARGB(255, 3, 26, 36)),
      onPressed: () => callSend(),
    );
  }

  Widget voiceIcon() {
    return const Icon(
      Icons.keyboard_voice,
      color: Colors.white,
    );
  }

  void pushproProfile(Professional pro) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return proProfile(professional: pro);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(widget.professional.Contact);
    final Uri _email = Uri.parse(
        'mailto:' + widget.professional.email + '?subject=%20&body=%20');

    Future<void> _makePhoneCall() async {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    Future<void> _sendEmail() async {
      if (!await launchUrl(_email)) {
        throw 'Could not launch $_email';
      }
    }

    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 236, 234, 234),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/wallpaper.jpg"))),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 26, 36),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.professional.image),
            ),
            Text(' ' + widget.professional.name),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => _makePhoneCall(), icon: Icon(Icons.phone)),
          PopupMenuButton(
              color: Color.fromARGB(255, 3, 26, 36),
              onSelected: (result) {
                if (result == 'Profile') {
                  pushproProfile(widget.professional);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      value: "Profile",
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    PopupMenuItem(
                      value: "Settings",
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    PopupMenuItem(
                      value: "Email",
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      onTap: () => _sendEmail(),
                    ),
                  ]),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 3, 26, 36),
          child: Container(
            margin: const EdgeInsets.all(12.0),
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 234, 234),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Row(
                      children: [
                        moodIcon(),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Message",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 3, 26, 36),
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        attachFile(),
                        camera(),
                        send(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 26, 36),
                      shape: BoxShape.circle),
                  child: InkWell(
                    child: voiceIcon(),
                    onLongPress: () => callVoice(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
