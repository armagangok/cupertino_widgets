import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> _settingsItems = [
    'Wi-Fi',
    'Bluetooth',
    'Airplane Mode',
    'Notifications',
    'Privacy',
    'Battery',
    'General',
    'About',
    'Sound & Haptics',
    'Privacy',
    'Battery',
    'General',
    'About',
    'Sound & Haptics',
  ];

  List<String> _filteredSettingsItems = [];

  @override
  void initState() {
    super.initState();
    _filteredSettingsItems = _settingsItems;
  }

  void _onSearchChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _filteredSettingsItems = _settingsItems;
      } else {
        _filteredSettingsItems = _settingsItems.where((item) => item.toLowerCase().contains(value.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Settings'),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SearchBarDelegate(
              CupertinoSearchTextField(
                padding: EdgeInsets.zero,
                prefixInsets: const EdgeInsets.only(left: 8),
                suffixInsets: EdgeInsets.zero,
                onChanged: _onSearchChanged,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CupertinoListTile(
                  padding: EdgeInsets.zero,
                  onTap: () {},
                  title: CupertinoFormRow(
                    prefix: Text(_filteredSettingsItems[index]),
                    helper: const Text("Helper"),
                    error: const Text("error"),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "data",
                      ),
                    ),
                  ),
                  trailing: const CupertinoListTileChevron(),
                );
              },
              childCount: _filteredSettingsItems.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final CupertinoSearchTextField searchField;

  _SearchBarDelegate(this.searchField);

  @override
  double get minExtent => 52.0;

  @override
  double get maxExtent => 52.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Make sure the search field doesn't exceed the defined extents.
    return Container(
      height: maxExtent,
      padding: const EdgeInsets.all(8.0),
      child: searchField,
    );
  }

  @override
  bool shouldRebuild(_SearchBarDelegate oldDelegate) {
    return searchField != oldDelegate.searchField;
  }
}





// @override
  // Widget build(BuildContext context) {
  //   return CupertinoPageScaffold(
  //     // navigationBar: const CupertinoNavigationBar(
  //     //   middle: Text("Settings"),
  //     //   previousPageTitle: "Home",
  //     // ),
  //     child: CustomScrollView(
  //       slivers: <Widget>[
  //         const CupertinoSliverNavigationBar(
  //           stretch: true,
  //           // This title is visible in both collapsed and expanded states.
  //           // When the "middle" parameter is omitted, the widget provided
  //           // in the "largeTitle" parameter is used instead in the collapsed state.
  //           largeTitle: Text('Settings'),

  //           trailing: Icon(CupertinoIcons.add_circled),
  //         ),
  //         // This widget fills the remaining space in the viewport.
  //         // Drag the scrollable area to collapse the CupertinoSliverNavigationBar.
  //         SliverFillRemaining(
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 CupertinoFormSection(
  //                   header: const Text("Header 1"),
  //                   children: [
  //                     CupertinoListTile(
  //                       onTap: () {},
  //                       title: const Text("Settings1"),
  //                     ),
  //                   ],
  //                 ),
  //                 CupertinoFormSection(
  //                   header: const Text("Header 2"),
  //                   children: [
  //                     CupertinoListTile(
  //                       leading: const Icon(
  //                         CupertinoIcons.wifi,
  //                       ),
  //                       onTap: () {},
  //                       title: const Text("Wifi"),
  //                       subtitle: const Text("Enabled"),
  //                       trailing: const CupertinoListTileChevron(),
  //                     ),
  //                     CupertinoListTile(
  //                       onTap: () {},
  //                       title: const Text("Settings1"),
  //                     ),
  //                     CupertinoListTile(
  //                       onTap: () {},
  //                       title: const Text("Settings1"),
  //                     ),
  //                     CupertinoListTile(
  //                       onTap: () {},
  //                       title: const Text("Settings1"),
  //                     ),
  //                     CupertinoListTile(
  //                       onTap: () {},
  //                       title: const Text("Settings1"),
  //                     ),
  //                     CupertinoListTile(
  //                       onTap: () {},
  //                       title: const Text("Settings1"),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }