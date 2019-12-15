import 'package:flutter/material.dart';

class _PageSelector extends StatelessWidget {
  const _PageSelector({this.cards});

  final List<Card> cards;

  void _handleArrowButtonPress(BuildContext context, int delta) {
    final TabController controller = DefaultTabController.of(context);
    if (!controller.indexIsChanging)
      controller
          .animateTo((controller.index + delta).clamp(0, cards.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    final Color color = Theme.of(context).accentColor;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  color: color,
                  onPressed: () {
                    _handleArrowButtonPress(context, -1);
                  },
                  tooltip: 'Page back',
                ),
                TabPageSelector(controller: controller),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  color: color,
                  onPressed: () {
                    _handleArrowButtonPress(context, 1);
                  },
                  tooltip: 'Page forward',
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 60),
              height: 560,
              width: 360,
              child: TabBarView(
                children: cards.map<Widget>((Card cards) {
                  return cards;
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  static const String routeName = '/material/page-selector';

  List cardList(BuildContext context) {
    final List<Card> cards = <Card>[
      Cards(imgPath: 'images/Login1.jpeg', path: '/login1').build(context),
      Cards(imgPath: 'images/Login2.png', path: '/login2').build(context),
      Cards(imgPath: 'images/Login3.jpeg', path: '/login3').build(context),
      Cards(imgPath: 'images/Login4.png', path: '/login4').build(context)
    ];
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: cardList(context).length,
        child: _PageSelector(cards: cardList(context)),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String imgPath;
  final String path;
  Cards({this.imgPath, this.path});
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          Container(
            width: 400,
            height: 450,
            child: Image.asset(imgPath, fit: BoxFit.cover),
          ),
          SizedBox(
            height: 18,
          ),
          Center(
            child: RaisedButton(
                elevation: 5,
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.open_in_new,
                  size: 20,
                  color: Colors.white,
                ),
                color: Colors.grey[600],
                onPressed: () {
                  Navigator.pushNamed(context, path);
                },
                shape: CircleBorder()),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
