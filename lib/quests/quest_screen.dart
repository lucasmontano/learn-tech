import 'package:flutter/material.dart' hide Action;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learntech/models/quest_category.dart';
import 'package:learntech/store/questlevel_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen(this.category);

  final QuestCategory category;

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final store = QuestLevelStore();

  @override
  void initState() {
    store.init(widget.category);
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          if (store.loader.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text(store.basicLevel.description);
        }),
        // TODO body: Add CardWidget showing the first Quest of this level
        // TODO body: Add AnswersListView
        // TODO body: Add Complete button to evaluate and go to next quest
      ),
    );
  }
}
