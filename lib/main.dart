import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Máy tính',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int so1,so2;
  late String opp;
  late String ketqua,text="";

  void btnclicked(String btnText){
    if(btnText=="C"){
      ketqua="";
      text="";
      so1=0;
      so2=0;
    }
    else if(btnText =="+" || btnText =="-" || btnText =="x" || btnText =="/" ){
      so1=int.parse(text);
      ketqua="";
      opp=btnText;

    }
    else if(btnText =="="){
      so2=int.parse(text);
     
      if(opp=="+"){
        ketqua=(so1+so2).toString();
      }
      else if(opp=="-"){
        ketqua=(so1-so2).toString();
      }
      else if(opp=="x"){
        ketqua=(so1*so2).toString();
      }
      else if(opp=="/"){
        ketqua=(so1~/so2).toString();
      }
    }
    else{
      ketqua=int.parse(text+btnText).toString();
    }
    setState(() {
      text=ketqua;
    });
  }
  Widget customOutlined(String value) {
    return Expanded(
      child: Padding(
       
        padding: EdgeInsets.all(25),
        child: OutlinedButton(
          
            onPressed: ()=> btnclicked(value),
            child: Text(value,
                style: TextStyle(fontSize: 25, color: Colors.black))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Máy tính')),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(10),
                child: Text(
                 text,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
            Row(
              children: [
                customOutlined("9"),
                customOutlined("8"),
                customOutlined("7"),
                customOutlined("+"),
              ],
            ),
            Row(
              children: [
                customOutlined("6"),
                customOutlined("5"),
                customOutlined("4"),
                customOutlined("-"),
              ],
            ),
            Row(
              children: [
                customOutlined("3"),
                customOutlined("2"),
                customOutlined("1"),
                customOutlined("x"),
              ],
            ),
            Row(
              children: [
                customOutlined("C"),
                customOutlined("0"),
                customOutlined("="),
                customOutlined("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
