import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_in_step/main.dart';
import 'package:keep_in_step/MainControll.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainpage.dart';
class LoginPage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String authConfirm = "이미 계정이 있으세요?";
var ctr1 = new TextEditingController();
var ctr2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      body:  Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[

                    Padding(padding: EdgeInsets.all(30),),
                    Container(
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/kislogologin.png'),),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment(0,0.5),
                        color: Colors.white,
                        child: Container(
                          color: Colors.white,
                          height: 300,
                          width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                alignment: Alignment(0,-0.5),
                                child: Text('회원가입하시면 이용하실 수 있습니다.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(20),

                              ),
                              Container(
                                child:
                                Container(
                                  child:
                                  GestureDetector(
                                    onTap: ()
                                    {
                                      Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => SignUp()));
                                    },
                                    child:
                                    Container(

                                      alignment: Alignment(0,-0.4),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        border: Border.all(width: 2,color: Colors.yellow),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),

                                      ),
                                      height: 50,
                                      width: 200,
                                      child: Center(
                                        child: Text('회원가입',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,

                                          )
                                          ,)
                                        ,)
                                      ,
                                    ),

                                  ),
                                ),
                                alignment: Alignment(0,-0.4),

                              ),
                            ],
                          ),
                        ),
                      ),)
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 290,
            left: 50,
            right: 50,
            bottom: 200,
            child:  ListView(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Container(
                      alignment: Alignment(0,-0.5),
                      child: Text(authConfirm,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10),),
                    GestureDetector(
                      onTap: ()
                      async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        if(prefs.getString('email') != "" && prefs.getString('password') != ""  && prefs.getString('password') != null &&prefs.getString('email') != null){
                          setState(() {authConfirm = "로그인중입니다.";});
                          print(prefs.getString('email').toString());
                          print(prefs.getString('password').toString());

                          FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: prefs.getString('email'), password: prefs.getString('password'),)).user;
                          Firestore.instance.collection('users').document(user.uid).get().then((DocumentSnapshot ds){
                            if(ds.exists){}else{

                              Firestore.instance.collection('users').document(user.uid).setData({
                                'name': prefs.getString('name'),
                                'phonenum': prefs.getString('phonenum'),
                                'availnums': 0,
                                'verify': '',
                                'expiredate' : 0,
                                'expiredatebungee' : 0,
                                'disting': '미승인',
                                'birthday': prefs.getString('birthday'),
                                'maximumyoga' : 0,
                                'maximumbungee' : 0,
                              });

                            }

                          });
                            Navigator.push(
                                context,MaterialPageRoute(builder:
                                (context) => MainPage(user: user,)
                            )
                            );


                        }
                        else{
                          setState(() {
                            authConfirm = "로그인 정보가 없습니다.";
                            showAlertDialog(context);
                          });
                        }
                      },
                      child:
                      Container(

                        alignment: Alignment(0,-0.4),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(width: 2,color: Colors.yellow),
                          borderRadius: BorderRadius.all(Radius.circular(10)),

                        ),
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text('로그인',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                            )
                            ,)
                          ,)
                        ,
                      ),

                    ),
                    Padding(padding: EdgeInsets.all(10),),
                    GestureDetector(
                      onTap: ()async{
                        SharedPreferences prefs = await SharedPreferences
                            .getInstance();
                        await prefs.setString('email', "");
                        await prefs.setString('password', "");
                        await FirebaseAuth.instance.signOut();
                        setState(() {authConfirm = "로그아웃 되었습니다.";});
                      },
                      child:
                      Container(

                        alignment: Alignment(0,-0.4),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(width: 2,color: Colors.yellow),
                          borderRadius: BorderRadius.all(Radius.circular(10)),

                        ),
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text('로그아웃',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,

                            )
                            ,)
                          ,)
                        ,
                      ),

                    ),


                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

  }
void dispose(){
    super.dispose();

}
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget cancelbutton = FlatButton(
      child: Text("취소"),
      onPressed: () { Navigator.of(context).pop();},
    );
    // set up the AlertDialog

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String loginerrmsg = '로그인하세요.';
        return StatefulBuilder(
          builder: (context, setState, ) {
            return AlertDialog(
              title: Text("로그인",textAlign: TextAlign.center,),
              content: Wrap(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(loginerrmsg),
                      TextFormField(
                        controller: ctr1,
                        decoration: InputDecoration(
                          hintText: '이메일',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5),),
                      TextFormField(
                        obscureText: true,
                        controller: ctr2,
                        decoration: InputDecoration(
                          hintText: '비밀번호',

                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      Container(
                        child: Row (
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              cancelbutton,FlatButton(
                                child: Text('로그인'),
                                onPressed: () async{
                                  setState(() {
                                    loginerrmsg = '로그인중입니다...';
                                  });
                                  var _auth = FirebaseAuth.instance;
                                  try{
                                    FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: ctr1.text, password: ctr2.text)).user;
                                    SharedPreferences prefs = await SharedPreferences
                                        .getInstance();
                                    await prefs.setString('email', ctr1.text);
                                    await prefs.setString('password', ctr2.text);


                                    Navigator.push(
                                        context,MaterialPageRoute(builder:
                                        (context) => MainPage(user: user)
                                    )
                                    );

                                  }
                                  on PlatformException catch(e){
                                    setState(() {

                                      loginerrmsg = '아이디/비밀번호가 다르거나\n 존재하지 않습니다.';

                                    });
                                  }
                                },
                              )
                            ]
                        ),
                      ),
                    ],

                  ),
                ],

              ),
            );
        });
      },
    );
  }
}

