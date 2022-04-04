import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';


class DataService {
  final apiUrl = Uri.parse("https://siliconvalleydeployment-default-rtdb.firebaseio.com/deploymenttask.json");
  final _headers = {'Content-type' : 'application/json; charset=UTF-8'};
  final Client _client;

  DataService(this._client);
  // Post request
  Future<void> addTask(taskName, note) async {
    try {
      await _client.post(apiUrl, headers: _headers, body: json.encode({
        taskName: note
      }));
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateTask(dynamic task, dynamic updatedTaskName, dynamic updatedNote) async {
    try {
      var updateUri = Uri.parse("https://siliconvalleydeployment-default-rtdb.firebaseio.com/deploymenttask/${task['id']}.json");
      await _client.patch(updateUri, headers: _headers, body: json.encode({
        updatedTaskName: updatedNote
      }));
    } catch (error) {
      print(error);
    }
  }

  Future<void> removeTask(id) async {
    var deleteUri = Uri.parse("https://siliconvalleydeployment-default-rtdb.firebaseio.com/deploymenttask/${id}.json");
    try {
      await _client.delete(deleteUri);
    } catch (error) {
      print(error);
    }
  }

  // Get request
  Future<List<dynamic>> getTasks() async {
    try {
      final response = await _client.get(apiUrl);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final returnArray = [];

      // Transform the original data to something readable
      extractedData.forEach((key, value) {
        var element = <String,dynamic> {};
        element['id'] = key;
        value.forEach((key, value) {
          element['taskName'] = key;
          element['note'] = value;
        });
        returnArray.add(element);
      });

      return returnArray;
    } catch (error) {
      print(error);
    }
  }

}