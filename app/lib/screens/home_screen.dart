import 'package:flutter/material.dart';
import 'package:app/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Scanner App"),
      ),
      body: Padding(
          padding:const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            CustomButton(text: "Scan Report", onPressed: (){
              //navigation later
            },
            ),
            const SizedBox(height: 12),
            CustomButton(text: "Upload Document", onPressed: (){
              //later
            },
            ),

          ]
        ),

      ),
    );
  }
}