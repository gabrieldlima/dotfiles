// imports
// -----------------------------------------------------------------------------
const hyprland = await Service.import("hyprland")


// variables
// -----------------------------------------------------------------------------
const dateVar = Variable("", {
  poll: [1000, 'date "+%a %b %d %I:%M %P"'],
})


// widgets
// -----------------------------------------------------------------------------
const clientTitle = () => {
  return Widget.Label({
    className: "clientTitle",
    label: hyprland.active.client.bind("class"),
  })
}

const date = () => {
  return Widget.Label({
    className: "date",
    label: dateVar.bind()
  })
}


// bar layout
// -----------------------------------------------------------------------------
const left = () => {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Label("NixOS")
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
      date()
    ],
  })
}


// the ags bar
// -----------------------------------------------------------------------------
function bar(monitor: number = 0) {
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
  style: "./style.scss",
  windows: [
    bar(0),
  ],
})

export { }
