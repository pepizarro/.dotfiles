import { readFile, Variable, writeFile } from "astal";
import { Gtk } from "astal/gtk3";

const todoPath = "/home/pedro/.local/share/bar/todo.json";

type Item = {
  id: number;
  task: string;
  done: boolean;
};

function load_tasks() {
  const file = readFile(todoPath);
  console.log("file: ", file);
  if (!file) return [];

  return JSON.parse(file) as Item[];
}

function write_tasks(items: Item[]) {
  console.log("writing tasks");
  const file = JSON.stringify(items, null, 2);
  writeFile(todoPath, file);
}

export default function () {
  //let items = load_tasks();
  const todo = Variable(load_tasks()) as Variable<Item[]>;

  todo.subscribe((items) => write_tasks(items));

  return (
    <box className="todo" vertical={true}>
      <label label="Todo" className="todo-h" halign={Gtk.Align.START} />

      <box className="todo-items" vertical={true}>
        {todo((items) =>
          items
            .sort((a, b) => (a.done === b.done ? 0 : a.done ? 1 : -1))
            .map((item) => (
              <box
                className={item.done ? "todo-item todo-item-done" : "todo-item"}
                hexpand
              >
                <button
                  onClicked={() => {
                    todo.set(
                      items.map((i) =>
                        i.id === item.id ? { ...i, done: !i.done } : i,
                      ),
                    );
                  }}
                  halign={Gtk.Align.START}
                  className="todo-check"
                >
                  {item.done ? <box></box> : ""}
                </button>
                <label
                  className={item.done ? "todo-done" : ""}
                  label={item.task}
                  halign={Gtk.Align.CENTER}
                />
                <button
                  className="todo-trash"
                  onClicked={() => {
                    //todo.set(items.filter((i) => i.id !== item.id));
                    console.log("deleting item");
                  }}
                  halign={Gtk.Align.END}
                  hexpand
                >
                  
                </button>
              </box>
            )),
        )}
      </box>
    </box>
  );
}
