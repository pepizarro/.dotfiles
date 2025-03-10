import { App, Astal } from "astal/gtk3";
import Calendar from "./Calendar";
import Todo from "./Todo";

export const PlannerWindowName = "plannerWindow";

export default function Planner() {
  return (
    <window
      className="Planner"
      name={PlannerWindowName}
      visible={false}
      setup={(self) => App.add_window(self)}
      exclusivity={Astal.Exclusivity.NORMAL}
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
      margin={5}
    >
      <box vertical={true}>
        <box>
          <Calendar />
        </box>
        <box>
          <Todo />
        </box>
      </box>
    </window>
  );
}
