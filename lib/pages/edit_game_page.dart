import 'package:api_mediqo_flutter/controllers/game_controller.dart';
import 'package:api_mediqo_flutter/model/data_game_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditGamePage extends StatelessWidget {
  final GameController gameController = Get.put(GameController());
  final Question content;
  final Question question;

  EditGamePage({this.content, this.question});

  void _editGame(int id) {
    gameController.editGame(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                question.content,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: gameController.titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.green,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                  ),
                ),
                onPressed: () => _editGame(gameController.id.value),
                child: Text('Edit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
