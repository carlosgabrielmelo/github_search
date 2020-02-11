import 'package:github_search/src/app.dart';
import 'package:catcher/catcher_plugin.dart';



void main(){
  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["recipient@email.com"])
  ]);

  Catcher(App(), debugConfig: debugOptions, releaseConfig: releaseOptions);
}