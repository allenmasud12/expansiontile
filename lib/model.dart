class BasicTile {
  final String title;
  final List<BasicTile> titles;

  const BasicTile({
    required this.title,
    this.titles = const [],
  });
}
