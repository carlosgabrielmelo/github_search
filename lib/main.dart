import 'package:github_search/src/app.dart';
import 'package:catcher/catcher_plugin.dart';
//import 'package:github_search/src/constants/CatcherConfig.dart';

void main(){
  CatcherOptions debugOptions =
    CatcherOptions(
      DialogReportMode(), 
      [ConsoleHandler(),/*EmailManualHandler([EMAIL_DEBUG])*/], 
      localizationOptions: [
        LocalizationOptions("pt",
          notificationReportModeTitle: "Vixe! Ocorreu um erro.",
          notificationReportModeContent:
              "Ocorreu um erro na aplicação, a equipe de suporte já foi notificada e vamos providenciar uma correção o mais rápido possível.",
          dialogReportModeTitle: "Vixe! Ocorreu um erro.",
          dialogReportModeDescription:
              "Ocorreu um erro na aplicação, a equipe de suporte já foi notificada e vamos providenciar uma correção o mais rápido possível.",
          dialogReportModeAccept: "Ok",
          dialogReportModeCancel: "Cancelar",
          pageReportModeTitle: "Vixe! Ocorreu um erro.",
          pageReportModeDescription:
              "Ocorreu um erro na aplicação, a equipe de suporte já foi notificada e vamos providenciar uma correção o mais rápido possível.",
          pageReportModeAccept: "Ok",
          pageReportModeCancel: "Cancelar"
        )
      ]
    );
  CatcherOptions releaseOptions = 
    CatcherOptions(
      DialogReportMode(), 
      [/*EmailManualHandler([EMAIL_RELEASE])*/],
      localizationOptions: [
        LocalizationOptions("pt",
          notificationReportModeTitle: "Vixe! Ocorreu um erro.",
          notificationReportModeContent:
              "Ocorreu um erro na aplicação, a equipe de suporte já foi notificada e vamos providenciar uma correção o mais rápido possível.",
          dialogReportModeTitle: "Vixe! Ocorreu um erro.",
          dialogReportModeDescription:
              "Ocorreu um erro na aplicação, a equipe de suporte já foi notificada e vamos providenciar uma correção o mais rápido possível.",
          dialogReportModeAccept: "Ok",
          dialogReportModeCancel: "Cancelar",
          pageReportModeTitle: "Vixe! Ocorreu um erro.",
          pageReportModeDescription:
              "Ocorreu um erro na aplicação, a equipe de suporte já foi notificada e vamos providenciar uma correção o mais rápido possível.",
          pageReportModeAccept: "Ok",
          pageReportModeCancel: "Cancelar"
        )
      ]
    );

  Catcher(App(), debugConfig: debugOptions, releaseConfig: releaseOptions);
}