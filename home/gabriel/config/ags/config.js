// imports
// -----------------------------------------------------------------------------
const hyprland = await Service.import("hyprland")


// widgets
// -----------------------------------------------------------------------------
const clientTitle = () => {
  return Widget.Label({
    className: "clientTitle",
    label: hyprland.active.client.bind("class"),
  })
}


// bar layout
// -----------------------------------------------------------------------------
const left = () => {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Label("Hello from Left")
    ],
  })
}

const center = () => {
  return Widget.Box({
    spacing: 8,
    children: [
      clientTitle()
    ],
  })
}

const right = () => {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
      Widget.Label("Hello from right")
    ],
  })
}


// the ags bar
// -----------------------------------------------------------------------------
function bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`,
    className: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    layer: "bottom",
    child: Widget.CenterBox({
      startWidget: left(),
      centerWidget: center(),
      endWidget: right(),
    }),
  })
}

App.config({
  style: "./style.css",
  windows: [
    bar(),
  ],
})

export { }
