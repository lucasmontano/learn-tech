import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learntech/models/quest_answer.dart';

class AnswerListView extends StatelessWidget {
  const AnswerListView(this.answers);

  final List<QuestAnswer> answers;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView.builder(
          itemCount: answers.length,
          itemBuilder: (context, index) {
            final answer = answers[index];

            return ListTile(
              onTap: () {
                // TODO toggle answer check status
              },
              title: Observer(
                builder: (context) => Text(answer.description),
              ),
            );
          },
        );
      },
    );
  }
}
