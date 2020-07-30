import 'package:flutter/material.dart';
import 'package:learntech/models/quest.dart';

class QuestCardView extends StatelessWidget {
  const QuestCardView(this.quest);

  final Quest quest;

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Material(
                    elevation: 24.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(quest.description),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // TODO display answers
                          SizedBox(
                            width: double.infinity,
                            // height: double.infinity,
                            child: new RaisedButton(
                              color: Colors.blue,
                              child: Text(
                                "Done",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                  fontSize: 22.0,
                                ),
                              ),
                              // TODO load next quest
                              onPressed: () => print('Sign In'),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
