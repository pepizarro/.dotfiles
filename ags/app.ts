import { App } from "astal/gtk3";
import style from "./scss/main.scss";
import Bar from "./widget/Bar";
import Planner from "./widget/Planner";

App.start({
  css: style,
  instanceName: "js",
  requestHandler(request, res) {
    print(request);
    res("ok");
  },
  main() {
    Bar(0);
    Planner();
  },
});
