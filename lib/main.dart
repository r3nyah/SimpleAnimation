import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simpleanimationlogin/Src/Login.dart';
import 'package:simpleanimationlogin/Src/Animation.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  late AnimationController _scaleController;
  late AnimationController _scaleController2;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scaleAnimation2;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState(){
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300
      )
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(_scaleController)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _widthController.forward();
      }
    });

    _widthController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );

    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 300.0
    ).animate(_widthController)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
      _positionController.forward();
      }
    });

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      )
    );

    _positionAnimation = Tween<double>(
      begin: 0.0,
      end: 215.0,
    ).animate(_positionController)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState(() {
          hideIcon = true;
        });
        _scaleController2.forward();
      }
    });

    _scaleController2 = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      )
    );

    _scaleAnimation2 = Tween<double>(
      begin: 1.0,
      end: 32.0,
    ).animate(_scaleController2)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.push(context,PageTransition(type: PageTransitionType.fade,
          child: Login(),
        ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(
                1,
                Container(
                  width: width,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://github.com/ariscybertech/aris_splash_creen_animation/blob/master/assets/images/one.png?raw=true',
                      ),
                      fit: BoxFit.cover,
                    )
                  ),
                )
              ),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                1.3,
                Container(
                  width: width,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://github.com/ariscybertech/aris_splash_creen_animation/blob/master/assets/images/one.png?raw=true',
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                1.6,
                Container(
                  width: width,
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://github.com/ariscybertech/aris_splash_creen_animation/blob/master/assets/images/one.png?raw=true',
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  FadeAnimation(
                    1.3,
                    Text(
                      'We promis that you will have the most \nfuss-free time with us ever.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          height: 1.4,
                          fontSize: 20,
                        ),
                    )
                  ),
                  SizedBox(height: 180,),
                  FadeAnimation(1.6, AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _widthController,
                            builder: (context, child) => Container(
                              width: _widthAnimation.value,
                              height: 80,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue.withOpacity(.4)
                              ),
                              child: InkWell(
                                onTap: () {
                                  _scaleController.forward();
                                },
                                child: Stack(
                                    children: <Widget> [
                                      AnimatedBuilder(
                                        animation: _positionController,
                                        builder: (context, child) => Positioned(
                                          left: _positionAnimation.value,
                                          child: AnimatedBuilder(
                                            animation: _scaleController2,
                                            builder: (context, child) => Transform.scale(
                                                scale: _scaleAnimation2.value,
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.blue
                                                  ),
                                                  child: hideIcon == false ? Icon(Icons.arrow_forward, color: Colors.white,) : Container(),
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ),
                        )),
                  )),
                  SizedBox(height: 60,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}