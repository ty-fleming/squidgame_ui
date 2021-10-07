import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
    );
  }
}

const Color COLOR_BLUE = Color.fromRGBO(22, 25, 38, 1);
const Color COLOR_YELLOW = Color.fromRGBO(222, 186, 112, 1);

const Color COLOR_RED = Color.fromRGBO(177, 62, 62, 1);
const Color COLOR_GREEN = Color.fromRGBO(87, 216, 64, 1);

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: COLOR_BLUE,
      body: Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    "assets/Ellipse 2@3x.png",
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 90,
                  height: 90,
                  child: Image.asset(
                    "assets/Polygon 1@3x.png",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 75,
                  height: 75,
                  child: Image.asset(
                    "assets/Rectangle 1@3x.png",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: GameOneScreen()));
              },
              child: Text(
                "PLAY GAME",
                style: TextStyle(
                    fontFamily: "The Shape of Things",
                    fontSize: 18,
                    color: COLOR_YELLOW,
                    letterSpacing: 1.2),
              ),
            ),
            SizedBox(
              height: height * .10,
            ),
          ],
        ),
      ),
    );
  }
}

class GameOneScreen extends StatefulWidget {
  const GameOneScreen({Key? key}) : super(key: key);

  @override
  _GameOneScreenState createState() => _GameOneScreenState();
}

class _GameOneScreenState extends State<GameOneScreen> {
  bool animate = false;
  void animateImage() {
    setState(() {
      animate = true;
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => animateImage());
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: COLOR_BLUE,
      body: Container(
        height: height * 2,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        "assets/Ellipse 2@3x.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 90,
                      height: 90,
                      child: Image.asset(
                        "assets/Polygon 1@3x.png",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 75,
                      height: 75,
                      child: Image.asset(
                        "assets/Rectangle 1@3x.png",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Text(
                  "GAME 1",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: COLOR_YELLOW,
                      letterSpacing: 1.2),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "RED LIGHT",
                  style: TextStyle(
                      fontFamily: "The Shape of Things",
                      fontSize: 28,
                      color: COLOR_RED,
                      letterSpacing: 7.2),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "GREEN LIGHT",
                  style: TextStyle(
                      fontFamily: "The Shape of Things",
                      fontSize: 28,
                      color: COLOR_GREEN,
                      letterSpacing: 7.2),
                ),
                SizedBox(
                  height: height * .25,
                ),
              ],
            ),
            Positioned(
              right: 40,
              bottom: -100,
              child: AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: animate ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/Image 4@3x.png',
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: CallScreen()));
                },
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    fontFamily: "The Shape of Things",
                    fontSize: 12,
                    color: COLOR_YELLOW,
                    letterSpacing: 7.2,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
} //Image 4@3x.png

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool isCalling = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: COLOR_BLUE,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                child: Image.asset(
                  "assets/Ellipse 2@3x.png",
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 90,
                height: 90,
                child: Image.asset(
                  "assets/Polygon 1@3x.png",
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 75,
                height: 75,
                child: Image.asset(
                  "assets/Rectangle 1@3x.png",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 55,
          ),
          AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: isCalling ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: Container(
              width: 150.0,
              height: 50.0,
              child: Text(
                "CALLING...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: COLOR_YELLOW,
                    letterSpacing: 1.2),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                primary: isCalling ? COLOR_RED : Colors.grey.withOpacity(0.7)),
            child: Container(
              width: 83,
              height: 83,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Icon(
                isCalling ? Icons.phone : Icons.play_arrow,
                color: isCalling ? COLOR_BLUE : COLOR_YELLOW,
                size: isCalling ? 31 : 25,
              ),
            ),
            onPressed: () {
              setState(() {
                isCalling = !isCalling;
              });
            },
          ),
          SizedBox(
            height: height * .25,
          ),
        ],
      ),
    );
  }
}
