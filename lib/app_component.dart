import 'package:angular/angular.dart';
import 'package:hello_again/src/silicon_valley_component/silicon_valley_component.dart';
import 'package:hello_again/src/task_form_component/task_form_component.dart';

// AngularDart info: https://angulardart.xyz
// Components info: https://angulardart.xyz/components
//
// (If the links still point to the old Dart-lang repo, go here:
// https://pub.dev/ngcomponents)

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  directives: [
    coreDirectives,
    SiliconValleyComponent,
    TaskFormComponent
  ],
  templateUrl: 'app_component.html'

)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.

 }
