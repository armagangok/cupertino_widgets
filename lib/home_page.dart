import 'package:cupertino_widgets/pages/fruits_page/fruit_page.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Home'),
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                CupertinoListSection(
                  header: const Text("Cupertino Action Widgets"),
                  children: [
                    CupertinoListTile(
                      leading: const Icon(CupertinoIcons.hand_draw_fill),
                      title: const Text("Cupertino Action Sheet"),
                      subtitle: const Text("Fruit picker example"),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute<Widget>(
                            settings: const RouteSettings(arguments: "Home"),
                            builder: (BuildContext context) {
                              return const FruitPage();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
