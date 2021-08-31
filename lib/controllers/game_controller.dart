import 'dart:convert';
import 'package:api_mediqo_flutter/domain/request.dart';
import 'package:api_mediqo_flutter/model/data_game_model.dart';
import 'package:api_mediqo_flutter/model/select_game_model.dart';
import 'package:api_mediqo_flutter/pages/edit_game_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  RxBool loading = false.obs;
  Map<String, dynamic> body;
  RxList<Object> dataGame = <Object>[].obs;
  Rx<SelectGame> listSelectGame = SelectGame().obs;
  RxString titleGame = ''.obs;

  TextEditingController titleController = TextEditingController();

  RxInt id = 0.obs;

  @override
  void onInit() {
    super.onInit();
    readGame();
  }

  void readGame() async {
    Request request = Request(url: urlBase);
    request.get().then((value) {
      if (value.statusCode == 200) {
        List jsonResponse = jsonDecode(value.body)['objects'];
        dataGame.value = jsonResponse.map((e) => Object.fromJson(e)).toList();
        print(dataGame.map((e) => e.content));
      } else {
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void toEditPage() async {
    selectGame(id.value);
    Get.to(() => EditGamePage());
  }

  void editGame(int id) async {
    Request request = Request(url: urlBase, body: {
      'id': id.toString(),
      'content': titleController.text,
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      if (value.statusCode == 200) {
        if (body['status'] == 'Success') {
          print('success');
          readGame();
        }
      } else {
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void selectGame(int id) async {
    Request request = Request(url: urlBase, body: {
      'id': id.toString(),
    });
    request.post().then((value) {
      body = jsonDecode(value.body)['objects'];
      print(body);
      if (value.statusCode == 200) {
        listSelectGame.value = SelectGame.fromJson(body);
        if (listSelectGame.value.data != []) {
          listSelectGame.value.data.map((e) {
            titleController.text = e.content;
          }).first;
        }
      } else {
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }
}
