const Left = () => {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Label("Hello from Left")
    ],
  })
}

const Center = () => {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Label("Hello from Center")
    ],
  })
}

const Right = () => {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
      Widget.Label("Hello from right")
    ],
  })
}

function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    layer: "bottom",
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  })
}

App.config({
  style: "./style.css",
  windows: [
    Bar(),
  ],
})

export { }
