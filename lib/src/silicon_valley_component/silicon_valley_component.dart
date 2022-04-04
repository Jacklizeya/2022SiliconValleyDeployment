import 'package:angular/angular.dart';
import './dataService/dataService.dart';

@Component(
    selector: 'silicon-valley',
    directives: [coreDirectives],
    styleUrls: ['silicon_valley_component.css'],
    templateUrl: 'silicon_valley_component.html',
    providers: [ClassProvider(DataService)]
)

class SiliconValleyComponent implements OnInit {

  final DataService _dataService;

  List<dynamic> _tasks = [];
  List<dynamic> get tasks => _tasks;
  bool isEditing = false;
  // Inject a DataService into it

  SiliconValleyComponent(this._dataService);

  // Make it async, so won't block our code
  Future<void> sendData(String taskName, String notes) async {
    var addedTask = await _dataService.addTask(taskName, notes);
    // once it is done, refresh get all task
    _tasks = await _dataService.getTasks();
  }

  Future<void> deleteData(String id) async {
    await _dataService.removeTask(id);
    // once it is done, refresh get all task
    _tasks = await _dataService.getTasks();
  }

  void editData(task, taskName, note) {
    isEditing = true;
    taskName.value = task['taskName'];
    note.value = task['note'];
  }

  void updateData(dynamic task, dynamic taskName, dynamic note) async {
    await _dataService.updateTask(task, taskName.value, note.value);
    isEditing = false;
    _tasks = await _dataService.getTasks();
    //reset everything
    taskName.value = '';
    note.value = '';
  }

  @override
  void ngOnInit() async {
    _tasks = await _dataService.getTasks();
    print(_tasks);
    print(tasks);
  }
}