import 'package:flutter/material.dart';
import 'package:simpleanimationlogin/Src/Animation.dart';

class Login extends StatelessWidget {
  //const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(
              1.2,
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 30,),
            FadeAnimation(
              1.5,
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey)
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(.8),
                          ),
                          hintText: 'Email or Username',
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(

                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(.8),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
            SizedBox(height: 40,),
            FadeAnimation(
              1.8,
              Center(
                child: Container(
                  width: 120,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue[800],
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7)
                      ),
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
