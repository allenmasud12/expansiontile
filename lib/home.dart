import 'package:flutter/material.dart';

class BasicTile {
  final String title;
  final List<BasicTile> titles;

  BasicTile({required this.title, this.titles = const []});
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final basicTile = <BasicTile>[
    BasicTile(
      title: "Fruits",
      titles: [
        BasicTile(title: "Apple"),
        BasicTile(title: "Orange"),
        BasicTile(title: "Banana"),
        BasicTile(title: "Lemon"),
        BasicTile(title: "Mango"),
      ],
    ),
    BasicTile(
      title: "Continent",
      titles: [
        BasicTile(
          title: "Asia",
          titles: [
            BasicTile(title: "Afghanistan"),
            BasicTile(title: "Iran"),
          ],
        ),
        BasicTile(
          title: "Europe",
          titles: [
            BasicTile(title: "Denmark"),
            BasicTile(title: "Italy"),
          ],
        ),
        BasicTile(
          title: "Africa",
          titles: [
            BasicTile(title: "Nigeria"),
            BasicTile(title: "Kenya"),
          ],
        ),
        BasicTile(
          title: "America",
          titles: [
            BasicTile(title: "United States"),
            BasicTile(title: "Brazil"),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: basicTile.map((tile) => buildTile(context, tile)).toList(),
      ),
    );
  }
}

Widget buildTile(BuildContext context, BasicTile tile, {double leftPadding = 16}) {
  if (tile.titles.isEmpty) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: leftPadding),
      title: Text(tile.title),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(tile: tile.title),
        ),
      ),
    );
  }else{
    return ExpansionTile(
      tilePadding: EdgeInsets.only(left: leftPadding),
      trailing: const SizedBox.shrink(),
      leading: Icon(Icons.keyboard_arrow_right_outlined),
      title: Text(tile.title),
      children: tile.titles.map((tile) => buildTile(context, tile, leftPadding: 16 + leftPadding)).toList(),
    );
  }

}

class DetailsPage extends StatelessWidget {
  final String tile;

  DetailsPage({Key? key, required this.tile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tile)),
      body: Center(child: Text("Details for $tile")),
    );
  }
}


