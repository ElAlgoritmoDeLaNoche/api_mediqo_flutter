import 'package:api_mediqo_flutter/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final GameController gameController = Get.put(GameController());

  Future<void> _pullRefresh() async {
    gameController.readGame();
  }

  Future<void> _onEdit(int id) async {
    gameController.id.value = id;
    gameController.toEditPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Obx(
          () => RefreshIndicator(
            onRefresh: _pullRefresh,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      child: Expanded(
                        child: ListView(
                          children: gameController.dataGame.map(
                            (e) {
                              var index = gameController.dataGame.indexOf(e);
                              index++;
                              return Container(
                                height: 60,
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: e.question.content ==
                                        'ANAMNESIS ALIMENTARIA'
                                    ? Text(
                                        e.question.content,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  index.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white12,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.question.content,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      e.content,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () => _onEdit(
                                                  int.tryParse(
                                                    e.id,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1,
                                          ),
                                        ],
                                      ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
