import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
              Text("Profile", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
              Text("Edit Profile", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue))
            ],),
            Row(children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                height: 70,
                width: 70,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/newavacf.jpg")), shape: BoxShape.circle),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                Text("Nguyễn Tiến Duy", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("0969 696 969", style: TextStyle(color: Color.fromARGB(128, 0, 0, 0)),)
              ],)
            ],),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(children: [
                menuMet("My Account", Icons.credit_card_outlined, Colors.blue),
                menuMet("Address", Icons.location_on_outlined, Colors.purple),
                menuMet("Setting", Icons.settings_outlined, Colors.orange),
                menuMet("Help Center", Icons.help_outline, Colors.purple),
                menuMet("Contact", Icons.call_outlined, Colors.blue)
              ],)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 226, 236),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Log out", style:TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
                ],
              )
            ),
          ],)
        )
      ),
    );
  }
  Widget menuMet(String content, IconData icon, Color color,) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
                child: Icon(icon, color: Colors.white)
              ),
              Text(content, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Icon(Icons.chevron_right)
      ],),
    );
  }
}
