import 'package:cupertino_widgets/pages/fruits_page/fruit_enum.dart';
import 'package:flutter/cupertino.dart';

Future<Fruit?> openFruitActionSheet(BuildContext context, List<Fruit> fruitList) async {
  final List<Widget> actions = [];

  for (var fruit in fruitList) {
    actions.add(
      CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context, fruit);
        },
        child: Text(fruit.fruitName),
      ),
    );
  }

  final response = await showCupertinoModalPopup<Fruit>(
    context: context,
    builder: (contextFromBuilder) {
      return CupertinoActionSheet(
        title: const Text("Select Fruit"),
        message: const Text("Select your favorite fruit (:"),
        actions: actions,
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(contextFromBuilder);
          },
          child: const Text("Cancel"),
        ),
      );
    },
  );

  return response;
}
