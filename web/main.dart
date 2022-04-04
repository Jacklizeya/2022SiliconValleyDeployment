import 'package:angular/angular.dart';
import 'package:http/browser_client.dart';
import 'package:ngcomponents/angular_components.dart';
import 'package:hello_again/app_component.template.dart' as ng;

import 'main.template.dart' as self;
import 'package:http/http.dart';

// Example of a [root injector](https://angulardart.xyz/guide/dependency-injection#root-injector-providers)
// [popupModule] is used in [MaterialTooltipDirective]
@GenerateInjector([popupModule, ClassProvider(Client, useClass: BrowserClient)])
final InjectorFactory rootInjector = self.rootInjector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: rootInjector);
}
