import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:shared_preferences/shared_preferences.dart';
class SignUp extends StatefulWidget {

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  var charcor1 = Color.fromARGB(255, 0, 69, 189);
  var charcor2 = Color.fromARGB(255, 0, 24, 120);
  var charcor3 = Color.fromARGB(255, 0, 13, 66);
  var ctr1 = TextEditingController();//이메일
  var ctr2 = TextEditingController();//비번
  var ctr3 = TextEditingController();//비번확인
  var ctr4 = TextEditingController();//성명
  var ctr5 = TextEditingController();//연락처
  var ctr6 = TextEditingController();//생년월일
  String errormsg = "";
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
          child:
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 2.0),
              color: Colors.white70,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.white,
                  blurRadius: 1.0,
                  offset: new Offset(0.0, 3.0),
                ),
              ],
            ),
          height: MediaQuery.of(context).size.height,


          child: Container(

            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(20)),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage('assets/logoIcon.png'),width: 50,),
                        Padding(padding: EdgeInsets.all(10),),
                        Text('회원가입',style: TextStyle(fontSize: 40,color: charcor3),),

                      ],
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    Container(decoration: BoxDecoration(
                      border: Border.all(color: Colors.white70, width: 2.0),
                      color: Colors.white,
                    ),
                      child: Column (
                          children: <Widget>[
                            Text('회원정보 수정은 카운터에 문의하세요.',style: TextStyle(fontSize: 14,color: charcor3),),
                            Padding(padding: EdgeInsets.all(10),),
                            Text(errormsg,style: TextStyle(color: Colors.red[800]),),
                            Container(
                              width: 350,
                              child:ListTile(leading: Icon(Icons.email), title: TextFormField(
                                controller: ctr1,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    border:InputBorder.none,
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "이메일",
                                    hintStyle: TextStyle(fontSize: 13)
                                ),),),),
                            Padding(padding: EdgeInsets.all(10),),
                            Container(
                              width: 350,
                              child:ListTile(leading: Icon(Icons.vpn_key),title: TextFormField(

                                maxLength: 15,
                                obscureText: true,
                                controller: ctr2,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    border:InputBorder.none,
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "비밀번호",
                                    hintStyle: TextStyle(fontSize: 13)
                                ),),),),
                            Padding(padding: EdgeInsets.all(10),),
                            Container(
                              width: 350,
                              child:ListTile(leading: Icon(Icons.vpn_key),title: TextFormField(
                                maxLength: 15,
                                controller: ctr3,
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    border:InputBorder.none,
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "비밀번호 확인",
                                    hintStyle: TextStyle(fontSize: 13)
                                ),),),),
                            Padding(padding: EdgeInsets.all(10),),
                            Container(
                              width: 350,
                              child:ListTile(leading: Icon(Icons.face),title: TextFormField(

                                maxLength: 6,
                                controller: ctr4,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    border:InputBorder.none,
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "성명",
                                    hintStyle: TextStyle(fontSize: 13)
                                ),),),),
                            Padding(padding: EdgeInsets.all(10),),
                            Container(
                              width: 350,
                              child:ListTile(leading: Icon(Icons.phone),title: TextFormField(

                                maxLength: 11,
                                keyboardType: TextInputType.number,
                                controller: ctr5,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    border:InputBorder.none,
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "연락처",
                                    hintStyle: TextStyle(fontSize: 13)
                                ),),),),
                            Padding(padding: EdgeInsets.all(10),),
                            Container(
                              width: 350,
                              child:ListTile(leading: Icon(Icons.cake),title: TextFormField(
                                maxLength: 8,
                                keyboardType: TextInputType.number,
                                controller: ctr6,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    border:InputBorder.none,
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "생년월일",
                                    hintStyle: TextStyle(fontSize: 13)
                                ),),),),
                            Padding(padding: EdgeInsets.all(10),),
                          ]
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70, width: 2.0),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            boxShadow: <BoxShadow>[
                              new BoxShadow(
                                color: Colors.red,
                                blurRadius: 1.0,
                                offset: new Offset(0.0, 3.0),
                              ),
                            ],
                          ),
                          height: 30,
                          child:
                          FlatButton(onPressed: () {Navigator.pop(context);},child: Text('취소',style: TextStyle(color: Colors.red),),),
                        ),

                        Padding(padding: EdgeInsets.all(20),),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70, width: 2.0),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            boxShadow: <BoxShadow>[
                              new BoxShadow(
                                color: Colors.blue,
                                blurRadius: 1.0,
                                offset: new Offset(0.0, 3.0),
                              ),
                            ],
                          ),
                          height: 30,
                          child:
                          FlatButton(onPressed: () async{

                            if(checkform()) {
                              SharedPreferences prefs = await SharedPreferences
                                  .getInstance();
                              await prefs.setString('email', ctr1.text);
                              await prefs.setString('password', ctr2.text);
                              await prefs.setString('name', ctr4.text);
                              await prefs.setString('phonenum', ctr5.text);
                              await prefs.setString('birthday', ctr6.text);
                              try {
                                user = (await _auth
                                    .createUserWithEmailAndPassword(
                                  email: ctr1.text,
                                  password: ctr2.text,
                                ))
                                    .user;
                                setState(() {
                                  errormsg = "가입 완료되었습니다.";
                                });
                                Navigator.pop(context);
                              } on PlatformException catch (e) {
                                setState(() {
                                  errormsg = "이미 존재하는 이메일입니다.";
                                });
                              }
                            }
                            FocusScope.of(context).requestFocus(FocusNode());
                          },

                            child: Text('가입',style: TextStyle(color: Colors.blue),),),
                        ),
                      ],
                    ),


                  ],
                ),
              ],
            ),
          )),),])
    );
  }
bool checkform(){
    if(ctr1.text != "" && ctr2.text != "" && ctr3.text != "" && ctr4.text != "" && ctr5.text != "" && ctr6.text != "") {
      if (ctr2.text != ctr3.text) {
        setState(() {
          errormsg = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
        });
        return false;
      }
      else {
        return true;
      }
    }
    else{
      setState(() {
        errormsg = "공란이 있습니다.";
      });
    }
}
}
