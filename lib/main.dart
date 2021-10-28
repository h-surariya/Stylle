import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:journey_path/journey_path.dart' show JourneyPath;
import 'package:journey_path/models/models.dart' show ConnectedDot, ConnectedLine, InformationCard, InformationCardDetails, Timeline;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stelly App',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  List<dynamic> temp = [];
  List <Widget> lol = [];
  void initState(){
    super.initState();
    get_data();

  }
  @override
  // for the members grid


  void get_data() async{
    var response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    var data = jsonDecode(response.body);
    print(data['data']);
    temp = data['data'];Widget w = Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child:GridView.count(
          primary: false,
          padding: const EdgeInsets.all(1),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 5,
          shrinkWrap: true,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(2),
                child: Text('ID',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                color: Colors.teal[100],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(2),
                child: Text('Image',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                color: Colors.teal[200],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(2),
                child: Text('Email',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                color: Colors.teal[300],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(2),
                child: Text('First Name',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                color: Colors.teal[400],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(2),
                child: Text('Last Name',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                color: Colors.teal[400],
              ),
            ),
          ],
        ));
    lol.add(w);
    for (int i = 0; i< temp.length; i++){
      Widget w = Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child:GridView.count(
        primary: false,
        padding: const EdgeInsets.all(1),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 5,
        shrinkWrap: true,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Text(temp[i]['id'].toString()),
              color: Colors.teal[100],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Image.network(temp[i]['avatar'], fit: BoxFit.fitWidth, height: 20,),
              color: Colors.teal[200],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Text(temp[i]['email'],),
              color: Colors.teal[300],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Text(temp[i]['first_name']),
              color: Colors.teal[400],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Text(temp[i]['last_name']),
              color: Colors.teal[400],
            ),
          ),
        ],
      ));
      lol.add(w);
    }
  }

  // for the journey bar:

  final Timeline timeline = Timeline(
    color: Colors.grey,
    thickness: 2.0,
  );
  final ConnectedDot connectedDot = ConnectedDot(
    number: 4,
    edgeColor: Colors.red,
    spaceBetween: 150.0,
    edgeSize: 70,
    middleColorDots: Colors.green,
  );
  final ConnectedLine connectedLine = ConnectedLine(
    size: 30,
    color: Colors.grey,
  );
  final InformationCard informationCard = InformationCard(
    height: 60,
    width: 120,
    color: Colors.blue[100],
    list: [
      InformationCardDetails(name: 'name1', description: 'description1'),
      InformationCardDetails(name: 'name2', description: 'description2'),
      InformationCardDetails(name: 'name3', description: 'description3'),
      InformationCardDetails(name: 'name4', description: 'description4'),
    ],
  );



  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: ListView(
              children: [
                JourneyPath(
                  timeline: timeline,
                  connectedDot: connectedDot,
                  connectedLine: connectedLine,
                  listInformationCard: informationCard,
                ),

                FlatButton(onPressed: (){
                  setState(() {
                    get_data();
                    lol;
                  });

                }, child:Text(
                    'Members Details'
                ),
                ),
                Column(
                  children: lol,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}








//Row(
//         children: [
//         Text(temp[i]['id'].toString()),
//         Image.network(temp[i]['avatar'], fit: BoxFit.fitWidth, height: 20,),
//         Text(temp[i]['email']),
//         Text(temp[i]['first_name']),
//         Text(temp[i]['last_name']),
//       ],
//       );