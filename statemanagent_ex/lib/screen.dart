import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  final _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Hello'),
          TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  context
                      .read<Items>()
                      .addItem(AnhTaiTextField(_textFieldController.text));
                  _textFieldController.clear();
                },
              ),
            ),
          ),
          for (int index = 0;
              index < context.watch<Items>().items.length;
              index++)
            Column(
              children: [
                TextFormField(
                  initialValue: context.watch<Items>().items[index].initContent,
                  //onChanged: (value) {chan},
                ),
                Text('Hello'),
                Text(context.watch<Items>().items[index].attfController.text),
              ],
            ),
          ...context
              .watch<Items>()
              .items
              .map(
                (e) => Column(
                  children: [
                    TextFormField(
                      initialValue: e.initContent,
                      //onChanged: (value) {chan},
                    ),
                    Text('Hello'),
                    Text(e.attfController.text),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
