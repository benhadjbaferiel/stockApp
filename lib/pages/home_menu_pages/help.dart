import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final String youtubeUrl = 'https://www.youtube.com/@moudirpos';
  final String supportEmail = 'mailto:Moudirpos@gmail.com';
  final String facebookUrl =
      'https://www.facebook.com/people/Moudir-Pos/61567611268056/?mibextid=ZbWKwL';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "المساعدة",
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(width: 40),
                  Icon(
                    Icons.help_outline,
                    size: 50,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "قناة البرنامج على اليوتيوب",
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/2004.png',
                        width: 30,
                        height: 30,
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  if (await canLaunch(youtubeUrl)) {
                    await launch(youtubeUrl);
                  } else {
                    throw 'Could not launch $youtubeUrl';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                      ),
                      Text(
                        "الاتصال بفريق الدعم",
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'images/2001.png',
                        width: 30,
                        height: 30,
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        "بريد البرنامج ",
                        style: TextStyle(fontSize: 22),
                      ),
                      Image.asset(
                        'images/2002.png',
                        width: 30,
                        height: 30,
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  if (await canLaunch(supportEmail)) {
                    await launch(supportEmail);
                  } else {
                    throw 'Could not launch $supportEmail';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "   صفحة البرنامج على الفايسبوك",
                        style: TextStyle(fontSize: 22),
                      ),
                      Image.asset(
                        'images/2003.png',
                        width: 30,
                        height: 30,
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  if (await canLaunch(facebookUrl)) {
                    await launch(facebookUrl);
                  } else {
                    throw 'Could not launch $facebookUrl';
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
