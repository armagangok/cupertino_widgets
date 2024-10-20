import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'fruit_enum.dart';
import 'fruit_selection_feature.dart';

class FruitPage extends StatefulWidget {
  const FruitPage({super.key});

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> with SingleTickerProviderStateMixin {
  Fruit? selectedFruit;

  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final previousTitleName = ModalRoute.of(context)?.settings.arguments as String;
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                // This title is visible in both collapsed and expanded states.
                // When the "middle" parameter is omitted, the widget provided
                // in the "largeTitle" parameter is used instead in the collapsed state.
                previousPageTitle: previousTitleName,
                largeTitle: const Text('Fruit Page'),
              ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SafeArea(
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    selectedFruit?.fruitName ?? "Please select a fruit...",
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  selectedFruit == null
                                      ? const SizedBox.shrink()
                                      : Text(
                                          selectedFruit!.fruitIcon,
                                          style: const TextStyle(
                                            fontSize: 50,
                                          ),
                                        )
                                ],
                              )
                                  .animate(
                                    controller: _controller,
                                    autoPlay: false,
                                    delay: 100.ms,
                                  )
                                  .scale(
                                    duration: 200.ms,
                                    begin: const Offset(1, 1),
                                    end: const Offset(1.25, 1.25),
                                  )
                                  .then(delay: 50.ms)
                                  .blur(
                                      delay: 20.ms,
                                      begin: const Offset(0, 0), // No blur initially
                                      end: const Offset(5, 5), // End with blur
                                      duration: 300.ms,
                                      curve: Curves.easeIn)
                                  .then(delay: 50.ms)
                                  .scale(
                                    duration: 200.ms,
                                    begin: const Offset(1.25, 1.25),
                                    end: const Offset(1, 1),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: CupertinoButton.filled(
                  onPressed: () async {
                    final fruitList = [
                      Fruit.apple,
                      Fruit.banana,
                      Fruit.mango,
                    ];

                    final response = await openFruitActionSheet(context, fruitList);

                    if (selectedFruit == response) return;

                    await _controller.forward(from: 0).whenComplete(() => _controller.reset());

                    setState(() {
                      selectedFruit = response;
                    });
                  },
                  child: const Text("Select A Fruit!"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
