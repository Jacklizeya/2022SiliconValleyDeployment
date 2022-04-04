import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'task.dart';

@Component(
    selector: 'task-form',
    directives: [coreDirectives, formDirectives],
    styleUrls: ['task_form_component.css'],
    templateUrl: 'task_form_component.html',
)

class TaskFormComponent {
    final title = 'TaskForm';
    Task sampleTask = Task('test task name', 'test task note');

    void clear () {
        sampleTask.taskName = '';
        sampleTask.note = '';
    }

}