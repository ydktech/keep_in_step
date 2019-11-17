import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:expandable/expandable.dart';

class MainPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

 final FirebaseUser user;
  MainPage({Key key, @required this.user}) : super(key:key);
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin  {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 List<Color> reservcolor = [Colors.white70,Colors.yellow, Colors.lightBlueAccent];
 bool noshow;
 int whichcolor = 0;
 int whichcoloryoga = 0;
  int whichcoloryoga2 = 0;
  Color changeablecolor1= Colors.grey;
  Color changeablecolor2= Colors.grey;
  Color changeablecolor3= Colors.grey;
  Color changeablecolor4= Colors.grey;
  Color changeablecolor5= Colors.grey;
  Color changeablecolor6= Colors.grey;
  Color changeablecolor7= Colors.grey;
  Color changeablecolor8= Colors.black;
  Color changeablecolor9= Colors.grey;
 Color colorswitch(int whichcolors){
   return reservcolor[whichcolors];
 }
/////
  String formattedDate;
  String formattedDay;
  String notifyexpire = "";
  String notifyexpire2 = "";
  String notifyexpirebungee = "";
  String dateselectedtofancy;
  int nowtime;
  int expiredate = 0;
  int maximumbungee = 0;
  int expiredatebungee = 0;
  int limitbungee = 0;
  int limityoga = 0;
  int limityoga2 = 0;
String todaydate;
  var mon;
  var tue;
  var wed;
  var thu;
  var fri;
  var mons;
  var tues;
  var weds;
  var thus;
  var fris;


  String disting;
  String verify = "";
  String namefromserver = "";
/////
  int imagerotate;
/////
  var _calendarController;

  var res='';
  var resyoga = '';
  var resyoga2 = '';
  var useruid;

  var num;
/////
  TabController _tabController;
bool alerttrigger1 = false;
  bool alerttrigger2 = false;
  String dateselected;
  int today;
  int yogadate=0;
  int yogadate2=0;
  int bungeedate = 0;
int howmuchpics = 1;
String bungeetime = "";
String yogatime= "";
String yogatime2= "";
String Eformatter= "";
String textofdate = "";
  String textofdateyoga1 = "";
  String textofdateyoga2 = "";

String thisweek(String compare, String plus){
  DateTime now = DateTime.now();
  todaydate = DateFormat("EEE").format(now);
  switch(todaydate){
    case "Mon":
      mon = new DateTime(now.year, now.month, now.day);
      tue = new DateTime(now.year, now.month, now.day + 1);
      wed = new DateTime(now.year, now.month, now.day + 2);
      thu = new DateTime(now.year, now.month, now.day + 3);
      fri = new DateTime(now.year, now.month, now.day + 4);
      break;
    case "Tue":
      mon = new DateTime(now.year, now.month, now.day - 1);
      tue = new DateTime(now.year, now.month, now.day );
      wed = new DateTime(now.year, now.month, now.day + 1);
      thu = new DateTime(now.year, now.month, now.day + 2);
      fri = new DateTime(now.year, now.month, now.day + 3);
      break;
    case "Wed":
      mon = new DateTime(now.year, now.month, now.day - 2);
      tue = new DateTime(now.year, now.month, now.day - 1);
      wed = new DateTime(now.year, now.month, now.day    );
      thu = new DateTime(now.year, now.month, now.day + 1);
      fri = new DateTime(now.year, now.month, now.day + 2);
      break;
    case "Thu":
      mon = new DateTime(now.year, now.month, now.day - 3);
      tue = new DateTime(now.year, now.month, now.day - 2);
      wed = new DateTime(now.year, now.month, now.day - 1);
      thu = new DateTime(now.year, now.month, now.day );
      fri = new DateTime(now.year, now.month, now.day + 1);
      break;
    case "Fri":
      mon = new DateTime(now.year, now.month, now.day - 4);
      tue = new DateTime(now.year, now.month, now.day - 3);
      wed = new DateTime(now.year, now.month, now.day - 2);
      thu = new DateTime(now.year, now.month, now.day - 1);
      fri = new DateTime(now.year, now.month, now.day    );
      break;
    case "Sat":
      mon = new DateTime(now.year, now.month, now.day - 5);
      tue = new DateTime(now.year, now.month, now.day - 4);
      wed = new DateTime(now.year, now.month, now.day - 3);
      thu = new DateTime(now.year, now.month, now.day - 2);
      fri = new DateTime(now.year, now.month, now.day - 1);
    break;
    default:
      mon = new DateTime(now.year, now.month, now.day-6);
      tue = new DateTime(now.year, now.month, now.day-5);
      wed = new DateTime(now.year, now.month, now.day-4);
      thu = new DateTime(now.year, now.month, now.day-3);
      fri = new DateTime(now.year, now.month, now.day-2);
      break;

  }
  mons = (DateFormat("MM월dd일 월요일").format(mon));
  tues = (DateFormat("MM월dd일 화요일").format(tue));
  weds = (DateFormat("MM월dd일 수요일").format(wed));
  thus = (DateFormat("MM월dd일 목요일").format(thu));
  fris = (DateFormat("MM월dd일 금요일").format(fri));
  mon = (DateFormat("yyyyMd").format(mon));
  tue = (DateFormat("yyyyMd").format(tue));
  wed = (DateFormat("yyyyMd").format(wed));
  thu = (DateFormat("yyyyMd").format(thu));
  fri = (DateFormat("yyyyMd").format(fri));
  if(compare == mon){
    plus += mons;
  }
  if(compare == tue){
    plus  += tues;
  }
  if(compare == wed)
  {
    plus  += weds;
  }
  if(compare == thu){
    plus  += thus;
  }
  if(compare == fri){
    plus  += fris;
  }
  return plus;
}

  void _onDaySelected(DateTime day, List events) {
setState(() {
  noshow = false;
  Eformatter = DateFormat('EEE').format(day);
  print(Eformatter);
  dateselected = DateFormat('yyyyMd').format(day);
  dateselectedtofancy = DateFormat('yyyy년M월d일').format(day);
  yogadate = int.parse(DateFormat('D').format(day));
  yogadate2 = int.parse(DateFormat('D').format(day));
  bungeedate = int.parse(DateFormat('D').format(day));
  switch(Eformatter){
    case "Mon":
      bungeetime = "오전 9:30";
      yogatime = "";
      yogatime2 = "8:30";
      noshow = true;
      break;
    case "Tue":
      bungeetime = "오후 9:30";
      yogatime = "10:30";
      yogatime2 = "";

      noshow = true;
      break;
    case "Wed":
      bungeetime = "";
      yogatime = "9:30";
      yogatime2 = "8:30";

      noshow = true;
      break;
    case "Thu":
      bungeetime = "오후 9:30";
      yogatime = "10:30";
      yogatime2 = "";

      noshow = true;
      break;
    case "Fri":
      bungeetime = "오전 9:30";
      yogatime = "10:30";
      yogatime2 = "8:30";

      noshow = true;
      break;
  }
});
  }

  int availnums = 0;
  @override
  void initState() {
    super.initState();
    noshow = false;
    imagerotate = 1;
    DateTime now = DateTime.now();
    formattedDate =  DateFormat('D').format(now);
    today = int.parse(DateFormat("D").format(now));
    nowtime = int.parse(DateFormat("HH").format(now));
    setState(() {
      dateselected = DateFormat('yyyyMd').format(now);
      dateselectedtofancy = DateFormat('yyyy년M월d일').format(now);
      Firestore.instance.collection('mainpage').document('pictures').get().then((DocumentSnapshot ds){
        howmuchpics = ds.data.length;
      });
    });

      formattedDay = DateFormat('EEEE').format(now);
      _calendarController = CalendarController();
      _tabController = TabController(vsync: this, length: 9);
      Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds){
        setState(() {

          expiredate = ds['expiredate'];
          expiredatebungee = ds['expiredatebungee'];
        });
        if(expiredate-today < 10 && expiredate-today > 0){
          alerttrigger1 = true;
          notifyexpire = '[요가]';
        }
        else{notifyexpire = "";
      alerttrigger1 = false;}

      if(expiredatebungee-today< 10 &&  expiredatebungee-today > 0){
        alerttrigger2 = true;
        notifyexpirebungee = '[번지플라이]';
      }
      else{notifyexpirebungee = "";
      alerttrigger2 = true;}
    });

  }
  @override
  void dispose() {
    super.dispose();
    DateTime now = DateTime.now();
    setState(() {
      dateselected = "";
    });
    try{
    _calendarController.dispose();}
    on NoSuchMethodError catch(e){}
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    if((notifyexpire != "" || notifyexpirebungee != "")&&(alerttrigger1 ||alerttrigger2)){
    Future.delayed(Duration.zero, () => showAlert(context));}
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.purple[50 ],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              Padding(padding: EdgeInsets.all(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
namedata(), distinger()
                ],
              ),
              Padding(padding: EdgeInsets.all(5),),
              Padding(padding: EdgeInsets.all(5),),
              verified(),
              Padding(padding: EdgeInsets.all(5),),
              availnum(),
              Padding(padding: EdgeInsets.all(5),),
              availnumyoga(),
              Padding(padding: EdgeInsets.all(0),),
              Flexible(
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(6.0),
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()=> {
                        changeablecolor1 = Colors.grey,
                        changeablecolor2 = Colors.grey,
                        changeablecolor3 = Colors.grey,
                        changeablecolor4 = Colors.grey,
                        changeablecolor5 = Colors.grey,
                        changeablecolor6 = Colors.grey,
                        changeablecolor7 = Colors.grey,
                        changeablecolor8 = Colors.black,
                        changeablecolor9= Colors.grey,
                        Navigator.pop(context),
                            (){setState(() {
                          dateselected = "";
                        });},
                      _tabController.animateTo(0)
                      },

                      child: Card(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.amberAccent[400],
                                  width: 4.0
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(image: AssetImage('assets/logoIcon_white.png'),width: 40,color: changeablecolor8,),
                                  Padding(padding: EdgeInsets.all(5),), Text('킵인스텝', style: TextStyle(fontSize: 12,color: changeablecolor8 ,fontFamily: 'yangjin',),textAlign: TextAlign.center,),])
                        ),
                      )),
        GestureDetector(
          onTap: ()=> {
            changeablecolor1 = Colors.black,
            changeablecolor2 = Colors.grey,
            changeablecolor3 = Colors.grey,
            changeablecolor4 = Colors.grey,
            changeablecolor5 = Colors.grey,
            changeablecolor6 = Colors.grey,
            changeablecolor7 = Colors.grey,
            changeablecolor8 = Colors.grey,
            changeablecolor9= Colors.grey,

            Navigator.pop(context),(){setState(() {
              dateselected = "";
            });},
            _tabController.animateTo(1)
          },
          child: Card(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.amberAccent[400],
                    width: 4.0
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.notifications,size: 40,color: changeablecolor1,),
                  Padding(padding: EdgeInsets.all(5),),
                  Text('공지사항',style: TextStyle(color: changeablecolor1,fontSize: 12,fontFamily: 'yangjin'),textAlign: TextAlign.center,),
                ],
              ),
            ),

          ),

        ),
        GestureDetector(onTap: ()=> {
        changeablecolor1 = Colors.grey,
        changeablecolor2 = Colors.black,
        changeablecolor3 = Colors.grey,
        changeablecolor4 = Colors.grey,
        changeablecolor5 = Colors.grey,
        changeablecolor6 = Colors.grey,
          changeablecolor7 = Colors.grey,
          changeablecolor8 = Colors.grey,
          changeablecolor9= Colors.grey,
          Navigator.pop(context),(){setState(() {
            dateselected = "";
          });},
          _tabController.animateTo(2)
        },child:Card(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.amberAccent[400],
                    width: 4.0
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.event,size: 40,color: changeablecolor2,),
                    Padding(padding: EdgeInsets.all(5),),Text('행사자료',style: TextStyle(fontSize: 12,fontFamily: 'yangjin',color: changeablecolor2),textAlign: TextAlign.center,),])

          ),

        )),
        GestureDetector(onTap: ()=> {
          changeablecolor1 = Colors.grey,
          changeablecolor2 = Colors.grey,
          changeablecolor3 = Colors.black,
          changeablecolor4 = Colors.grey,
          changeablecolor5 = Colors.grey,
          changeablecolor6 = Colors.grey,
          changeablecolor7 = Colors.grey,
          changeablecolor8 = Colors.grey,
          changeablecolor9= Colors.grey,
          Navigator.pop(context),(){setState(() {
            dateselected = "";
          });},
          _tabController.animateTo(5)
        },child: Card(

          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.amberAccent[400],
                    width: 4.0
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.calendar_today,size: 40,color:changeablecolor3,),
                    Padding(padding: EdgeInsets.all(5),),Text('시간표', style: TextStyle(fontSize: 12,fontFamily: 'yangjin',color: changeablecolor3),textAlign: TextAlign.center,),]

              )

          ),
        ),),
        GestureDetector(onTap: ()=> {
          changeablecolor1 = Colors.grey,
          changeablecolor2 = Colors.grey,
          changeablecolor3 = Colors.grey,
          changeablecolor4 = Colors.black,
          changeablecolor5 = Colors.grey,
          changeablecolor6 = Colors.grey,
          changeablecolor7 = Colors.grey,
          changeablecolor8 = Colors.grey,
          changeablecolor9= Colors.grey,
          Navigator.pop(context),(){setState(() {
            dateselected = "";
          });},
          _tabController.animateTo(4)
        },child:Card(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.amberAccent[400],
                    width: 4.0
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.check,size: 40,color:changeablecolor4),
                    Padding(padding: EdgeInsets.all(5),), Text('프로그램예약',style: TextStyle(fontSize: 10,fontFamily: 'yangjin',color:changeablecolor4),textAlign: TextAlign.center,),]

              )

          ),
        )),
        GestureDetector(onTap: ()=> {
          changeablecolor1 = Colors.grey,
          changeablecolor2 = Colors.grey,
          changeablecolor3 = Colors.grey,
          changeablecolor4 = Colors.grey,
          changeablecolor5 = Colors.black,
          changeablecolor6 = Colors.grey,
          changeablecolor7 = Colors.grey,
          changeablecolor8 = Colors.grey,
          changeablecolor9= Colors.grey,
          Navigator.pop(context),(){setState(() {
            dateselected = "";
          });},
          _tabController.animateTo(6)
        },child: Card(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.amberAccent[400],
                    width: 4.0
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.access_time,size: 40,color: changeablecolor5,),
                    Padding(padding: EdgeInsets.all(5),),Text('내 예약정보',style: TextStyle(fontSize: 12,fontFamily: 'yangjin',color: changeablecolor5),textAlign: TextAlign.center,),]

              )
          ),
        )),
                    GestureDetector(onTap: ()=> {
                      changeablecolor1 = Colors.grey,
                      changeablecolor2 = Colors.grey,
                      changeablecolor3 = Colors.grey,
                      changeablecolor4 = Colors.grey,
                      changeablecolor5 = Colors.grey,
                      changeablecolor6 = Colors.grey,
                      changeablecolor7 = Colors.grey,
                      changeablecolor8 = Colors.grey,
                      changeablecolor9= Colors.black,
                      Navigator.pop(context),(){setState(() {
                        dateselected = "";
                      });},
                      _tabController.animateTo(3)
                    },child:Card(
                      child:  Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.amberAccent[400],
                                width: 4.0
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.question_answer,size: 40,color: changeablecolor9,),
                                Padding(padding: EdgeInsets.all(5),),Text('Q&A',style: TextStyle(fontSize: 12,fontFamily: 'yangjin',color: changeablecolor9),textAlign: TextAlign.center,),]

                          )
                      ),
                    )),
                    GestureDetector(onTap: ()=> {
                      changeablecolor1 = Colors.grey,
                      changeablecolor2 = Colors.grey,
                      changeablecolor3 = Colors.grey,
                      changeablecolor4 = Colors.grey,
                      changeablecolor5 = Colors.grey,
                      changeablecolor6 = Colors.black,
                      changeablecolor7 = Colors.grey,
                      changeablecolor8 = Colors.grey,
                      changeablecolor9= Colors.grey,
                      Navigator.pop(context),(){setState(() {
                        dateselected = "";
                      });},
                      _tabController.animateTo(7)
                    },child:Card(
                      child:  Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.amberAccent[400],
                                width: 4.0
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.movie,size: 40,color: changeablecolor6,),
                                Padding(padding: EdgeInsets.all(5),),Text('영상자료',style: TextStyle(fontSize: 12,fontFamily: 'yangjin',color: changeablecolor6),textAlign: TextAlign.center,),]

                          )
                      ),
                    )),
                    GestureDetector(onTap: ()=> {
                      changeablecolor1 = Colors.grey,
                      changeablecolor2 = Colors.grey,
                      changeablecolor3 = Colors.grey,
                      changeablecolor4 = Colors.grey,
                      changeablecolor5 = Colors.grey,
                      changeablecolor6 = Colors.grey,
                      changeablecolor7 = Colors.black,
                      changeablecolor8 = Colors.grey,
                      changeablecolor9= Colors.grey,
                      Navigator.pop(context),
                      (){setState(() {
                        dateselected = "";
                      });},

                      _tabController.animateTo(8)
                    },
                      child: Card(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.amberAccent[400
                                  ],
                                  width: 4.0
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.motorcycle,size: 40,color: changeablecolor7,),
                                  Padding(padding: EdgeInsets.all(5),),Text('KIS스피닝',style: TextStyle(fontFamily: 'yangjin',fontSize: 12,color: changeablecolor7),textAlign: TextAlign.center,),]

                            )
                        ),
                      )),
                  ],
                ),),

              Padding(padding: EdgeInsets.all(0),),
              Container(
                child: Text('회사소개',style: TextStyle(fontFamily: 'yangjin',fontSize: 20),),),
              Padding(padding: EdgeInsets.all(5),),
              Image(image: AssetImage('assets/logoIcon_white.png'),width: 40,color: Colors.black,),
              Padding(padding: EdgeInsets.all(5),),
              Container(
                child: Text('KeepInStep',style:TextStyle(fontFamily: 'yangjin',fontWeight: FontWeight.w500,fontSize: 15,),textAlign: TextAlign.center,),
              ),
              Padding(padding: EdgeInsets.all(5),),
              Container(
                child: Text('대표 박준수',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              ),

              Container(
                child: Text('031-297-4713\n경기도 수원시 권선구 서수원로\n519 성광프라자 5층',textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),
              ),
              Padding(padding: EdgeInsets.all(5),),
              Container(
                child: Text(''),
              ),
              Padding(padding: EdgeInsets.all(5),),

            ],
          ),
        ),
      ),
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,color: Colors.black,),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            );
          },
        ),

        title: Image(image: AssetImage('assets/logoIcon.png'),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:

      new TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [

        ListView(children:<Widget> [
          Padding(padding: EdgeInsets.all(40),),
          bodyComponent()]),
          new Padding(
            padding: EdgeInsets.all(20),
            child: dataform(),
          ),
          new Padding(
            padding: EdgeInsets.all(20),
            child: dataformcelebs(),
          ),
          new Scaffold(
            body:
          Padding(
            padding: EdgeInsets.all(20),
            child: qna(),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {

            var tcontroller = TextEditingController();
             int lengthofdata = 0;
              CollectionReference qs = Firestore.instance.collection('qna');
              DocumentReference dr;
              if(qs.document(widget.user.uid)!=null){
                dr=qs.document(widget.user.uid);
               dr.get().then((DocumentSnapshot ds){
                 if(ds.exists && ds.data.length != 0){
                  lengthofdata = ds.data.length;}
                 else{
                   lengthofdata = 0;
                   dr.setData({});
                 }
                });
              }
            return showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text('글쓰기',textAlign: TextAlign.center,),
                  content: TextFormField(
                    controller: tcontroller,

                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('취소'),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: Text('확인'),
                      onPressed: (){
                        if(lengthofdata != 0){
                       dr.updateData({lengthofdata.toString():{"subtitle": tcontroller.text, "reply": "", "title": "작성된 내용은 관리자만 볼 수 있습니다."}});}
                        else{
    dr.setData({lengthofdata.toString():{"subtitle": tcontroller.text, "reply": "", "title": "작성된 내용은 관리자만 볼 수 있습니다."}});
                          lengthofdata = 1;
                        }
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );

              },
            );

          },child: Icon(Icons.border_color,color: Colors.black,),backgroundColor: Colors.white70,),),
          new Scaffold(body: Container(
            alignment: Alignment.topCenter,
            child: ListView(
              children: <Widget>[

                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10),),
                    Text(dateselectedtofancy,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Padding(padding: EdgeInsets.all(10),),
                    Card(
                      child: Container(
                        width: 350,
                        child: TableCalendar(
                          onDaySelected: _onDaySelected,
                          locale: 'ko_KR', calendarController: _calendarController,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        return showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              title: Text('번지플라이',textAlign: TextAlign.center,),
                              content: const Text('\n예약하시겠습니까?',textAlign: TextAlign.center,),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('취소'),
                                  onPressed: (){

                                    Firestore.instance.collection('bungeeflying').document(dateselected).get().then((DocumentSnapshot ds){
                                      if(ds.data.containsKey(widget.user.uid))
                                      {
                                        if(today < bungeedate)
                                        {
                                          if(nowtime < 22){
                                            if(int.parse(res) < limitbungee)
                                            {
                                              setState(() {
                                                availnums += 1;
                                              });
                                              Firestore.instance
                                                  .collection('bungeeflying')
                                                  .document(dateselected)
                                                  .updateData({widget.user.uid:FieldValue.delete()});
                                              Firestore.instance
                                                  .collection('bungeeflying')
                                                  .document(dateselected)
                                                  .updateData({'howmuch': int.parse(res) -1});
                                              Firestore.instance
                                                  .collection('users')
                                                  .document(widget.user.uid)
                                                  .updateData({'availnums': availnums});
                                              Fluttertoast.showToast(
                                                  msg: "취소되었습니다.",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIos: 1,
                                                  backgroundColor: Colors.yellow[200],
                                                  textColor: Colors.black,
                                                  fontSize: 16.0
                                              );}
                                            else{}
                                          }
                                          else{
                                            Fluttertoast.showToast(
                                                msg: "저녁10시이후 취소할 수 없습니다.",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIos: 1,
                                                backgroundColor: Colors.yellow[200],
                                                textColor: Colors.black,
                                                fontSize: 16.0
                                            );


                                          }
                                        }
                                        else{
                                          Fluttertoast.showToast(
                                              msg: "취소할 수 없습니다.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.yellow[200],
                                              textColor: Colors.black,
                                              fontSize: 16.0
                                          );

                                        }
                                      }
                                      else{

                                        Fluttertoast.showToast(
                                            msg: "취소할 예약이 없습니다.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.yellow[200],
                                            textColor: Colors.black,
                                            fontSize: 16.0
                                        );

                                      }

                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('확인'),
                                  onPressed: ()async{

                                    Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds) {
                                      setState(() {
                                        expiredatebungee = ds['expiredatebungee'];
                                      });

                                      if (bungeedate <= expiredatebungee) {
                                        Firestore.instance.collection('bungeeflying')
                                            .document(dateselected)
                                            .get()
                                            .then((DocumentSnapshot ds) {
                                          if (!ds.data.containsKey(widget.user.uid)) {
                                            if (availnums > 0) {
                                              setState(() {
                                                availnums -= 1;
                                              });
                                              Firestore.instance
                                                  .collection('bungeeflying')
                                                  .document(dateselected)
                                                  .updateData({'howmuch': int.parse(res) + 1});

                                              Firestore.instance
                                                  .collection('bungeeflying')
                                                  .document(dateselected)
                                                  .updateData({widget.user.uid: true});
                                              Firestore.instance
                                                  .collection('users')
                                                  .document(widget.user.uid)
                                                  .updateData({'availnums': availnums});

                                              Fluttertoast.showToast(
                                                  msg:"번지플라이 " + bungeetime.toString() + "에 예약되었습니다.",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIos: 1,
                                                  backgroundColor: Colors.red[50],
                                                  textColor: Colors.black,

                                                  fontSize: 16.0
                                              );
                                            }
                                            else {
                                              Fluttertoast.showToast(
                                                  msg: "이미 예약되었거나\n남은 횟수가 없습니다.",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIos: 1,
                                                  backgroundColor: Colors.red[50],
                                                  textColor: Colors.black,
                                                  fontSize: 16.0
                                              );
                                            }
                                          }

                                          else {
                                            print(bungeedate);
                                            print(expiredatebungee);
                                            Fluttertoast.showToast(
                                                msg: "예약할 수 없습니다.",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIos: 1,
                                                backgroundColor: Colors.red[50],
                                                textColor: Colors.black,
                                                fontSize: 16.0
                                            );
                                          }
                                        });
                                      }
                                      else {
                                        print(bungeedate);
                                        print(expiredatebungee);
                                        Fluttertoast.showToast(
                                            msg: "예약할 수 없습니다.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.red[50],
                                            textColor: Colors.black,
                                            fontSize: 16.0
                                        );
                                      }
                                    });
                                    Navigator.of(context).pop();

                                  },
                                ),
                              ],
                            );

                          },
                        );
                      },
                      child:
                      reservationBungee(),


                    ),
                    GestureDetector(
                      onTap: (){
                        return showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              title: Text('플라잉요가',textAlign: TextAlign.center,),
                              content: const Text('\n예약하시겠습니까?',textAlign: TextAlign.center,),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('취소'),
                                  onPressed: (){


                                    Firestore.instance.collection('yoga').document(dateselected).get().then((d)  {
                                      if(d.data.containsKey(widget.user.uid)){
                                        if(today < yogadate)
                                        {
                                          if(nowtime<22)
                                          {


                                            Firestore.instance
                                                .collection('yoga')
                                                .document(dateselected)
                                                .updateData({'howmuch': int.parse(resyoga) -1});
                                            Firestore.instance
                                                .collection('yoga')
                                                .document(dateselected)
                                                .updateData({widget.user.uid: FieldValue.delete()});
                                            Fluttertoast.showToast(
                                                msg: " 취소되었습니다.",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIos: 1,
                                                backgroundColor: Colors.yellow[50],
                                                textColor: Colors.black,
                                                fontSize: 16.0
                                            );}
                                          else{ Fluttertoast.showToast(
                                              msg: "취소할 수 없습니다.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.red[50],
                                              textColor: Colors.black,
                                              fontSize: 16.0
                                          );}
                                        }
                                        else{
                                          Fluttertoast.showToast(
                                              msg: "취소할 수 없습니다.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.red[50],
                                              textColor: Colors.black,
                                              fontSize: 16.0
                                          );}
                                      }

                                      else{

                                        Fluttertoast.showToast(
                                            msg: "취소할 에약이 없습니다.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.yellow[200],
                                            textColor: Colors.black,
                                            fontSize: 16.0
                                        );
                                      }

                                    }  );

                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('확인'),
                                  onPressed: (){


                                    Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds){
                                      setState(() {
                                        expiredate = ds['expiredate'];
                                      });

                                      if(yogadate<=expiredate)
                                      {
                                        Firestore.instance.collection('yoga').document(dateselected).get().then((d)  {
                                          if(!d.data.containsKey(widget.user.uid)){
                                            if(today < yogadate)
                                            {if(int.parse(resyoga) < limityoga)
                                            {

                                              if(nowtime<22)
                                              {
                                                Firestore.instance
                                                    .collection('yoga')
                                                    .document(dateselected)
                                                    .updateData(
                                                    {'howmuch': int.parse(resyoga) + 1});

                                                Firestore.instance
                                                    .collection('yoga')
                                                    .document(dateselected)
                                                    .updateData({widget.user.uid: true});

                                                Fluttertoast.showToast(
                                                    msg:"플라잉요가 오전" + yogatime.toString() +
                                                        "에 예약되었습니다.",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIos: 1,
                                                    backgroundColor: Colors.yellow[50],
                                                    textColor: Colors.black,
                                                    fontSize: 16.0
                                                );}
                                              else{
                                                Fluttertoast.showToast(
                                                    msg: "저녁 10시이후 불가능합니다",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIos: 1,
                                                    backgroundColor: Colors.red[50],
                                                    textColor: Colors.black,
                                                    fontSize: 16.0
                                                );
                                              }
                                            }
                                            else{

                                              Fluttertoast.showToast(
                                                  msg: "인원이 가득 찼습니다.",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIos: 1,
                                                  backgroundColor: Colors.yellow[50],
                                                  textColor: Colors.black,
                                                  fontSize: 16.0
                                              );
                                            }
                                            }
                                            else{
                                              Fluttertoast.showToast(
                                                  msg: "예약할 수 없습니다.",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIos: 1,
                                                  backgroundColor: Colors.yellow[200],
                                                  textColor: Colors.black,
                                                  fontSize: 16.0
                                              );

                                            }}

                                          else{

                                            Fluttertoast.showToast(
                                                msg: "예약할 수 없습니다.",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIos: 1,
                                                backgroundColor: Colors.yellow[200],
                                                textColor: Colors.black,
                                                fontSize: 16.0
                                            );
                                          }

                                        }  );}
                                      else{
                                        Fluttertoast.showToast(
                                            msg: "예약할 수 없습니다.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.yellow[200],
                                            textColor: Colors.black,
                                            fontSize: 16.0
                                        );

                                      }

                                      Navigator.of(context).pop();


                                    });

                                  },
                                ),
                              ],
                            );

                          },
                        );
                      },
                      child:
                      reservationYoga(),


                    ),
                    GestureDetector(
                      onTap: (){
                        return showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              title: Text('플라잉요가 오후반',textAlign: TextAlign.center,),
                              content: const Text('\n예약하시겠습니까?',textAlign: TextAlign.center,),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('취소'),
                                  onPressed: (){


                                    Firestore.instance.collection('yoga2').document(dateselected).get().then((d)  {
                                      if(d.data.containsKey(widget.user.uid)){
                                        if(today < yogadate)
                                        {
                                          if(nowtime<22)
                                          {


                                            Firestore.instance
                                                .collection('yoga2')
                                                .document(dateselected)
                                                .updateData({'howmuch': int.parse(resyoga2) -1});
                                            Firestore.instance
                                                .collection('yoga2')
                                                .document(dateselected)
                                                .updateData({widget.user.uid: FieldValue.delete()});
                                            Fluttertoast.showToast(
                                                msg:" 취소되었습니다.",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIos: 1,
                                                backgroundColor: Colors.yellow[50],
                                                textColor: Colors.black,
                                                fontSize: 16.0
                                            );}
                                          else{ Fluttertoast.showToast(
                                              msg: "취소할 수 없습니다.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.red[50],
                                              textColor: Colors.black,
                                              fontSize: 16.0
                                          );}
                                        }
                                        else{
                                          Fluttertoast.showToast(
                                              msg: "취소할 수 없습니다.",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.red[50],
                                              textColor: Colors.black,
                                              fontSize: 16.0
                                          );}
                                      }

                                      else{

                                        Fluttertoast.showToast(
                                            msg: "취소할 에약이 없습니다.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.yellow[200],
                                            textColor: Colors.black,
                                            fontSize: 16.0
                                        );
                                      }

                                    }  );

                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('확인'),
                                  onPressed: (){

                                    Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds) {
                                      setState(() {
                                        expiredate = ds['expiredate'];
                                      });
                                      if (yogadate <= expiredate) {
                                        Firestore.instance.collection('yoga2').document(dateselected)
                                            .get()
                                            .then((d) {
                                          if (!d.data.containsKey(widget.user.uid)) {
                                            if (today < yogadate) {
                                              if (int.parse(resyoga2) < limityoga2) {
                                                if (nowtime < 22) {
                                                  Firestore.instance
                                                      .collection('yoga2')
                                                      .document(dateselected)
                                                      .updateData(
                                                      {'howmuch': int.parse(resyoga2) + 1});

                                                  Firestore.instance
                                                      .collection('yoga2')
                                                      .document(dateselected)
                                                      .updateData({widget.user.uid: true});

                                                  Fluttertoast.showToast(
                                                      msg: "플라잉요가 오후" + yogatime2.toString() +
                                                          "에 예약되었습니다.",
                                                      toastLength: Toast.LENGTH_SHORT,
                                                      gravity: ToastGravity.BOTTOM,
                                                      timeInSecForIos: 1,
                                                      backgroundColor: Colors.yellow[50],
                                                      textColor: Colors.black,
                                                      fontSize: 16.0
                                                  );
                                                }
                                                else {
                                                  Fluttertoast.showToast(
                                                      msg: "저녁 10시이후 불가능합니다",
                                                      toastLength: Toast.LENGTH_SHORT,
                                                      gravity: ToastGravity.BOTTOM,
                                                      timeInSecForIos: 1,
                                                      backgroundColor: Colors.red[50],
                                                      textColor: Colors.black,
                                                      fontSize: 16.0
                                                  );
                                                }
                                              }
                                              else {
                                                Fluttertoast.showToast(
                                                    msg: "인원이 가득 찼습니다.",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIos: 1,
                                                    backgroundColor: Colors.yellow[50],
                                                    textColor: Colors.black,
                                                    fontSize: 16.0
                                                );
                                              }
                                            }
                                            else {
                                              Fluttertoast.showToast(
                                                  msg: "예약할 수 없습니다.",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIos: 1,
                                                  backgroundColor: Colors.yellow[200],
                                                  textColor: Colors.black,
                                                  fontSize: 16.0
                                              );
                                            }
                                          }

                                          else {
                                            Fluttertoast.showToast(
                                                msg: "예약할 수 없습니다.",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIos: 1,
                                                backgroundColor: Colors.yellow[200],
                                                textColor: Colors.black,
                                                fontSize: 16.0
                                            );
                                          }
                                        });
                                      }
                                      else {
                                        Fluttertoast.showToast(
                                            msg: "예약할 수 없습니다.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.yellow[200],
                                            textColor: Colors.black,
                                            fontSize: 16.0
                                        );
                                      }
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                              ],
                            );

                          },
                        );
                      },
                      child:
                      reservationYoga2(),


                    ),

                  ],
                ),
                Padding(padding: EdgeInsets.all(50),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 200,
                      child: Card(
                        child: Container(
                          color: Colors.blue[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text('이번주 플라잉요가 예약정보',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'yangjin'

                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(padding: EdgeInsets.all(10),),
                              Container(
                                  child:
                                  Flexible(child:
                                  reservationinfo(),)
                              ),
                              Padding(padding: EdgeInsets.all(10),),
                              Container(
                                  child:
                                  Flexible(child:
                                  reservationinfo2(),)
                              ),
                              Padding(padding: EdgeInsets.all(10),),


                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10),),
                    Container(
                      width: 350,
                      height: 200,
                      child: Card(
                        child: Container(
                          color: Colors.yellow[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(10),),
                              Text('이번주 번지플라이 예약정보',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'yangjin'
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(padding: EdgeInsets.all(10),),
                              Container(
                                  child:
                                  Flexible(child:
                                  reservationinfobungee(),)
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(20),),
              ],
            ),
          )),
          new Scaffold(body: Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10),),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
                  ),
                  child: Text('회전'),
                  onPressed: () {

                    if(imagerotate == 2) {
                      setState(() {
                        imagerotate = 1;
                      });
                    }
                    else{ setState(() {
                      imagerotate = 2;
                    });}
                  },),
                Padding(padding: EdgeInsets.all(50),),
                Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                rotationImage(),
                Padding(padding: EdgeInsets.all(0),),

                /////
              ],
            ),
              ]
          ))),
          new Scaffold(body: Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 200,
                  child: Card(
                    child: Container(
                      color: Colors.yellow[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('이번주 플라잉요가 예약정보',
                            style: TextStyle(
                            fontSize: 20, fontFamily: 'yangjin'

                          ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.all(10),),
                          Container(
                            child:
                            Flexible(child:
                            reservationinfo(),)
                          ),
                          Padding(padding: EdgeInsets.all(10),),
                          Container(
                              child:
                              Flexible(child:
                              reservationinfo2(),)
                          ),
                          Padding(padding: EdgeInsets.all(10),),


                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                Container(
                  width: 350,
                  height: 200,
                  child: Card(
                    child: Container(
                      color: Colors.blue[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10),),
                          Text('이번주 번지플라이 예약정보',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'yangjin'
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(padding: EdgeInsets.all(10),),
                          Container(
                              child:
                              Flexible(child:
                              reservationinfobungee(),)
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          new Scaffold(body: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Text(''),
              ],
            ),
          )),
          new Scaffold(body: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
              ],
            ),
          )),
        ],
      ),
    );
  }


  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(" 만료 기간이 얼마 남지 않았습니다.\n기간 내에 데스크에 문의하시면\n재등록할인 받으실 수 있습니다.",style:TextStyle(fontSize: 15),textAlign: TextAlign.center,),
          content: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(onPressed: () {
                  Navigator.pop(context);

                },child: Text('확인'),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)
                  ),),
              ]
          ),
        ));
    alerttrigger1 = false;
    alerttrigger2 = false;
  }


  Widget bodyComponent(){
    return Container(
      height: 500,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10),),
    Image(image: AssetImage('assets/main.png'),)
    /*  Center(
            child:  Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height-400,
              child: Image(image:  AssetImage('assets/main.png')),
            new Swiper(
                itemWidth: 300,
                layout: SwiperLayout.STACK,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return new Center(

                    child: Card(
                      color: Colors.white,
                      child:
                      Padding(

                        child:
                        Center(
                          child: cardviewer(index),
                        ), padding: EdgeInsets.only(left: 10,right:10),

                      ),

                    ),
                  );
                },
                itemCount: howmuchpics,
                viewportFraction: 0.8,
                scale: 0.9,
              ),

            ),
          ),*/
        ],
      ),

    );

  }
String reservinfo;
  String reservinfo2;
  String reservinfobungee;
var tempword;
Widget reservationinfo(){
  return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('yoga').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');

        switch (snapshot.connectionState) {

          default:
            reservinfo = "오전타임 :\n";
            snapshot.data.documents.forEach((DocumentSnapshot ds){
              if(ds.data.containsKey(widget.user.uid)){
                  reservinfo = reservinfo + thisweek(ds.documentID, textofdateyoga1)  + "\n";
              }
              else{reservinfo = "오전타임 : \n";}
              });

       return Text(""+reservinfo, style: TextStyle(fontFamily: 'yangjin'),);




        }

      });
}
  Widget reservationinfo2(){
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('yoga2').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if(snapshot.data == null){
            return Text('');
          }
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');

          switch (snapshot.connectionState) {

            default:
              reservinfo2 = "오후타임 :\n";
              snapshot.data.documents.forEach((DocumentSnapshot ds){
                if(ds.data.containsKey(widget.user.uid)){
                  reservinfo2 = reservinfo2 + thisweek(ds.documentID, textofdateyoga2) + " \n";
                }
                else{reservinfo2 = "";}
              });
              return Text("오후타임 : \n"+reservinfo2, style: TextStyle(fontFamily: 'yangjin'));




          }

        });
  }
  Widget reservationinfobungee(){
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('bungeeflying').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if(snapshot.data == null){
            return Text('');
          }
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');

          switch (snapshot.connectionState) {

            default:
              reservinfobungee = "";
              snapshot.data.documents.forEach((DocumentSnapshot ds){
                if(ds.data.containsKey(widget.user.uid)){
                  reservinfobungee = reservinfobungee + thisweek(ds.documentID, textofdate) + "\n";

                }
                else{reservinfobungee = "";}
              });
              return Text(reservinfobungee, style: TextStyle(fontFamily: 'yangjin'));




          }

        });
  }

Widget cardviewer(int index){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('mainpage').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');

        switch (snapshot.connectionState) {
          
          default:

              return Image.network(
                
                  snapshot.data.documents[0].data.values.elementAt(index));


        }

      });



        }

  Widget timetable(int index){
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('timetable').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if(snapshot.data == null){
            return Text('');
          }
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            default:
              switch(index) {
                case 1:
              return Image.network(
                  snapshot.data.documents[0].data.values.elementAt(
                      snapshot.data.documents[0].data.values
                          .toList()
                          .length - 1));
                case 2:      return Image.network(

                    snapshot.data.documents[0].data.values.elementAt(
                        snapshot.data.documents[0].data.values
                            .toList()
                            .length - 1),

                  fit: BoxFit.cover,
                  width: 480,
                );

          }

          }

        });



  }

  Widget distinger(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {

          default:
            Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds){
              setState(() {
                disting = ds['disting'];
              });
            });

            if(disting != null){
              return new Text(disting ,style: TextStyle(fontFamily: 'nanumgothic',fontSize: 17),);}
            else{return new Text('정보 없음' ,style: TextStyle(fontFamily: 'nanumgothic'),);}


        }
      },
    );
  }
  Widget availnumyoga(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          default:
            Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds){
              setState(() {
                expiredate = ds['expiredate'];
              });
            });

            if(expiredate != null && (expiredate- today) >= 0){

              return new Text("플라잉요가 : " + (expiredate-today).toString() + "일 " ,style: TextStyle(fontFamily: 'nanumgothic'),);}
            else{return new Text('플라잉요가 정보없음' ,style: TextStyle(fontFamily: 'nanumgothic'),);}


        }
      },
    );
  }
  Widget availnum(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          default:
            Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds){
              setState(() {
                availnums = ds['availnums'];
                expiredatebungee = ds['expiredatebungee']-today;
                maximumbungee = ds['maximumbungee'];
              });
            });

            if(availnums != null && expiredatebungee >= 0){
              return new Text("번지플라이 : " + availnums.toString()+"/"+maximumbungee.toString() +"("+ expiredatebungee.toString() + "일)" ,style: TextStyle(fontFamily: 'nanumgothic'),);}
            else{return new Text('번지플라이 정보 없음' ,style: TextStyle(fontFamily: 'nanumgothic'),);}


        }
      },
    );
  }

  bool datetriggerbungee = false;
  bool datetriggeryoga = false;
  bool datetriggeryoga2 = false;
  Widget reservationYoga(){
if(noshow){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('yoga').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          default:


            Firestore.instance.collection('yoga').document(dateselected).get().then((DocumentSnapshot ds){
              if(ds.data != null){


                if(
                ds.data.containsKey(widget.user.uid)
                ){
                  setState(() {

                    whichcoloryoga = 2;
                  });
                }
                else{
                  setState(() {

                    whichcoloryoga = 0;
                  });
                }
                  setState(() {
                    datetriggeryoga = true;
                  });
                ds.data.forEach((key,value){
                if(key == 'howmuch')
                {
                  setState(() {
                    resyoga= ds['howmuch'].toString();
                    limityoga = ds['limit'];
                  });

                }
              });}
              else{

                setState(() {
                  datetriggeryoga = false;
                });
              }
            });
            if(datetriggeryoga) {

              return new
              Container(width: 350,
                child: Card(child: Container
                  (
                    color: colorswitch(whichcoloryoga),
                    child: ListTile(

                      leading: Icon(Icons.flight_takeoff),
                      title: Text("플라잉요가 오전 "+yogatime+"\n예약 회원 : " + resyoga +"/"+limityoga.toString(),textAlign: TextAlign.center,),),),),);
            }
            else{
              return Text('');}

        }
      },
    );}
else{return Container();}
  }
  Widget reservationYoga2(){

    if(noshow){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('yoga2').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {

          default:


            Firestore.instance.collection('yoga2').document(dateselected).get().then((DocumentSnapshot ds){
              if(ds.data != null){

                if(
                ds.data.containsKey(widget.user.uid)
                ){
                  setState(() {

                    whichcoloryoga2 = 2;
                  });
                }
                else{
                  setState(() {

                    whichcoloryoga2 = 0;
                  });
                }
                setState(() {
                  datetriggeryoga2 = true;
                });
                ds.data.forEach((key,value){
                  if(key == 'howmuch')
                  {
                    setState(() {
                      resyoga2= ds['howmuch'].toString();
                      limityoga2 = ds['limit'];
                    });

                  }
                });}
              else{
                setState(() {
                  datetriggeryoga2 = false;
                });
              }
            });
            if(datetriggeryoga2 && noshow) {
              return new
              Container(width: 350,
                child: Card(child: Container
                  (
                  color: colorswitch(whichcoloryoga2),
                  child: ListTile(

                    leading: Icon(Icons.flight_takeoff),
                    title: Text("플라잉요가 오후 "+yogatime+"\n예약 회원 : " + resyoga2 +"/"+limityoga2.toString(),textAlign: TextAlign.center,),),),),);
            }
            else{return Text('');}

        }
      },
    );}
    else{return Container();}
  }
  Widget reservationBungee(){

    if(noshow){
    return StreamBuilder<QuerySnapshot>(

      stream: Firestore.instance.collection('bungeeflying').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          default:

            Firestore.instance.collection('bungeeflying').document(dateselected).get().then((DocumentSnapshot ds){
              if(ds.data != null){

                if(
                ds.data.containsKey(widget.user.uid)
                ){
                  whichcolor = 1;
                }
                else{
                  whichcolor = 0;
                }


                  setState(() {
                    datetriggerbungee = true;
                  });
                ds.data.forEach((key,value){
                  if(key == 'howmuch')
                  {
                    setState(() {
                      limitbungee = ds['limit'];
                      res= ds['howmuch'].toString();
                    });

                  }
                });}
              else{ setState(() {
                datetriggerbungee = false;
              });
              }
            });


            if(datetriggerbungee && noshow) {
              return new
              Container(width: 350,
                child: Card(child: Container(
                  color: colorswitch(whichcolor),
                  child: ListTile(
                  leading: Icon(Icons.accessibility_new),
                  title: Text("번지플라이 "+bungeetime+"\n예약회원수 : " + res + "/"+limitbungee.toString(),textAlign: TextAlign.center,),),)),);
            }
            else{return Text('');}

        }
      },
    );}
    else{return Container();}
  }

  Widget dataform(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('notify').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new Card(
                
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10),),
                        Icon(Icons.notification_important),
                        Padding(padding: EdgeInsets.all(20),),
                        Container(
                          width: 250,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(10),),
                              Flexible(child: new Text(document['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                              Flexible(child: new Text(document['script'],style: TextStyle(fontSize: 15,),),),
                              Padding(padding: EdgeInsets.all(10),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );


  }
  Widget dataformcelebs(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('celebs').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          default:
            return new ListView(

              children: snapshot.data.documents.map((DocumentSnapshot document) {

                return new Card(

                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10),),
                        Padding(padding: EdgeInsets.all(20),),
                        Container(
                          width: 250,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.all(10),),
                              Flexible(child: new Text(document['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Padding(padding: EdgeInsets.all(10),),
                              Image.network(document['image']),
                              Padding(padding: EdgeInsets.all(10),),
                              Flexible(child: new Text(document['script'],style: TextStyle(fontSize: 15,),),
                              ),
                              Padding(padding: EdgeInsets.all(10),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );


  }
  Widget qna(){
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance.collection('qna').document(widget.user.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {

          default:
            var icon = Icons.notifications_none;
            if(snapshot.data.data != null){
            return new ListView(
              children: snapshot.data.data.values.map((r) {
                if(r['reply']!=""){
                  icon = Icons.notifications;
                }
                return new
//
                Card(
                 child:  Column(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Padding(padding: EdgeInsets.all(10),),
                     ExpandablePanel(
                       collapsed:
                       Row(
                     children: <Widget>[
                       Padding(padding: EdgeInsets.all(10),),
                       Icon(icon),
                       Padding(padding: EdgeInsets.all(10),),
                       Container(alignment: Alignment.center,child: Text(r['title'],textAlign: TextAlign.center,style: TextStyle(fontSize: 14),),),
                     ],
                     )
                       ,expanded: Container(
                         child: Row(
                           children: <Widget>[
                             Padding(padding: EdgeInsets.all(10),),
                             Padding(padding: EdgeInsets.all(20),),
                             Container(
                               width: 250,
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: <Widget>[

                                   Padding(padding: EdgeInsets.all(10),),

                                   Flexible(child: Text(r['subtitle'],style: TextStyle(fontSize: 25,fontFamily: 'nanumgothic'),),),
                                   Padding(padding: EdgeInsets.all(10),),
                                   Flexible(child: Text(r['reply'],style: TextStyle(fontSize: 20,fontFamily: 'nanumgothic',color: Colors.black45),),),
                                   /*                 // <-- Driven by ExpandableController from ExpandableNotifier
                                */
                                   Padding(padding: EdgeInsets.all(10),),
                                   RaisedButton(
                                     color: Colors.white,
                                     shape: RoundedRectangleBorder(
                                         borderRadius: new BorderRadius.circular(18.0),
                                         side: BorderSide(color: Colors.black)
                                     ),
                                     onPressed: () {
                                       snapshot.data.data.forEach((v,k){
                                         if(k == r){
                                           snapshot.data.reference.updateData({v.toString():FieldValue.delete()});
                                         }

                                       });
                                      // snapshot.data.data.remove();
                                       
                                     },
                                   child: Text('지우기'),),
                                   Padding(padding: EdgeInsets.all(10),),
                                 ],
                               ),
                             ),

                           ],
                         ),
                       ),
                     )
                   ],
                 ));
              }).toList(),
            );}
            else{return Container();}
        }
      },
    );


  }


  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  Widget verified(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          default:
            Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds){
              if(ds['verify']== '승인됨'){
                setState(() {
                  verify = '승인됨';
                });
              }
              else{setState(() {
                verify = '미승인 계정';
              }); }
            });

            return Text("승인여부 : " +verify,style: TextStyle(fontFamily: 'nanumgothic'),);

        }
      },
    );
  }

  Widget namedata(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if(snapshot.data == null){
          return Text('');
        }
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          default:
            Firestore.instance.collection('users').document(widget.user.uid).get().then((DocumentSnapshot ds){
              if(ds['name']!= null){
                setState(() {
                  namefromserver = ds['name'];
                });
              }


            });

            return Text(namefromserver + ' 회원님  ' ,style:TextStyle(fontFamily: 'yangjin',fontSize: 20));

        }
      },
    );
  }
  Widget rotationImage(){
    switch(imagerotate){
      case 1:
        return Container(

          alignment: Alignment.center,
          child: timetable(1),);
        break;
      case 2:
        return Center(
            child: RotatedBox(
              quarterTurns: 5,
              child: timetable(2),

            ));
        break;

    }
  }

}
