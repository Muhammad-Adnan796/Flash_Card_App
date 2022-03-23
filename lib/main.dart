import 'package:flutter/material.dart';
import 'package:flutter_app_flash_card_app/countries.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCountry_App(),
    );
  }
}

class MyCountry_App extends StatefulWidget {
  const MyCountry_App({Key? key}) : super(key: key);



  @override
  State<MyCountry_App> createState() => _MyCountry_AppState();
}

class _MyCountry_AppState extends State<MyCountry_App> {
  int score = 0;
  int totalAttempted = 0;
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      appBar: AppBar(
        title: Text("Guess the Capital City!"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(elevation: 20,
        child: const Text("Reset"),
        onPressed: () {
        setState(() {
          score = 0 ;
          totalAttempted = 0 ;
        });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Score ${score}/${totalAttempted}",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 200,
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        !showAnswer ? "Capital" : "Country",
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        !showAnswer ? countries[totalAttempted]["city"]! :
                        countries[totalAttempted]["country"]!,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.blueAccent),
                      )
                    ],
                  ),
                ),),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showAnswer = !showAnswer ;
                });
              },
              child: Text(
                "Show ${showAnswer ? "Answer" : "Question"}",
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(20),
                  shadowColor: MaterialStateProperty.all(Colors.grey),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent),),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(totalAttempted < countries.length-1) {
                      score++;
                      totalAttempted++;
                    }else{
                      Alert(
                        context: context,
                     title: "ALERT",
                      desc: "You already have reached to the end of list."
                      ).show();
                    }
                  },);
                },
                child: const Text(
                  "Correct",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(20),
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                    backgroundColor: MaterialStateProperty.all(Colors.green),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(totalAttempted < countries.length-1) {
                      totalAttempted++;
                    }else{
                      Alert(
                          context: context,
                          title: "ALERT",
                          desc: "You already have reached to the end of list."
                      ).show();
                    }
                  });
                },
                child: const Text(
                  "Wrong",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(20),
                    shadowColor: MaterialStateProperty.all(Colors.grey),
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
              ),
            ),
          ]),

          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if(totalAttempted>0) {
                   score--;
                    totalAttempted--;

                  }
                      else if(score==0 || totalAttempted==0){
                    Alert(
                        context: context,
                        title: "ALERT",
                        desc: "You already have reached to the start of list."
                    ).show();
                  }
                });
              },
              child: const Text(
                "Back",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(20),
                  shadowColor: MaterialStateProperty.all(Colors.grey),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
