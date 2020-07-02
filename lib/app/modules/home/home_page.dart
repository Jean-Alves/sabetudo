import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sabetudo/app/modules/menu/menu_page.dart';
import 'package:sabetudo/app/shared/google/admob/admob.dart';

import 'package:sabetudo/app/shared/utils/appsize.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Sabe Tudo"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation animationTranslate;
  Animation animationSize;
  Animation animationSizeBorder;

  @override
  void initState() {
    super.initState();

    startInterstitial();
    animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
    animationTranslate = Tween(
      begin: 0.0,
      end: 300.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));

    animationTranslate.addListener(() {
      setState(() {});
    });

    animationSize = Tween(begin: 1.0, end: 0.8).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationSize.addListener(() {
      setState(() {});
    });

    animationSizeBorder = Tween(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    animationSizeBorder.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _onTapMenu() {
    if (animationController.value == 1) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MenuPage(),
        Transform.scale(
          scale: animationSize.value,
          child: Container(
            transform: Matrix4.identity()
              ..translate(animationTranslate.value, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(animationSizeBorder.value),
              child: _buildHome(),
            ),
          ),
        ),
      ],
    );
  }

  _buildHome() {
    var appSize = AppSize(context);
    return GestureDetector(
      onTap: () {
        animationController.reverse();
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: appSize.width * .04,
                    left: appSize.width * .04,
                    top: appSize.mediaQuery.padding.top,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: _onTapMenu,
                        child: Icon(
                          Icons.menu,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: appSize.width * .1),
                  child: Center(
                    child: Image.asset(
                      "assets/images/ideia.jpg",
                      width: appSize.width * .7,
                      height: appSize.width * .7,
                    ),
                  ),
                ),
                SizedBox(
                  height: appSize.height * .12,
                ),
                Center(
                  child: Text(
                    "Quiz Sabe Tudo",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: appSize.height * .06,
                ),
                SizedBox(
                  width: appSize.width * .9,
                  height: appSize.height * .08,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    splashColor: Colors.blueAccent,
                    onPressed: () async {
                      await Modular.to.pushNamed("/QuestionPage");
                      startInterstitial();
                    },
                    child: Text(
                      "PLAY",
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
