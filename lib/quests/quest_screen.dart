import 'package:flutter/material.dart' hide Action;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learntech/models/quest_category.dart';
import 'package:learntech/quests/quest_card_view.dart';
import 'package:learntech/store/quest_store.dart';
import 'package:learntech/store/questlevel_store.dart';
import 'package:mobx/mobx.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen(this.category);

  final QuestCategory category;

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final questLevelStore = QuestLevelStore();
  final questStore = QuestStore();

  @override
  void initState() {
    questLevelStore.init(widget.category);
    questStore.init(widget.category);
    super.initState();
  }

  @override
  void dispose() {
    questLevelStore.dispose();
    questStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          if (questLevelStore.loader.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text(questLevelStore.basicLevel.description);
        }),
      ),
      body: Observer(builder: (context) {
        final loaderStatus = questStore.questLoader?.status;
        if (loaderStatus == null || loaderStatus == FutureStatus.pending) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue)),
          );
        } else if (questStore.allQuests?.isNotEmpty == true) {
          var quest = questStore.allQuests.first;
          if (quest.answers?.isNotEmpty == true) {
            return QuestCardView(quest);
          } else if (questStore.answersLoader != FutureStatus.pending) {
            questStore.loadAnswers(widget.category, quest);
          }
          return Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red)),
          );
        } else {
          return Text("Loading...");
        }
      }),
    );
  }
}
