import App from 'resource:///com/github/Aylur/ags/app.js';
import PanelButton from '../PanelButton.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const floatingButton = Widget.Button({
    class_name: 'mainButton',
    onClicked: () => execAsync(`hyprctl dispatch togglefloating 1`),
    child: Widget.Label({
      class_name: "button-icon",
      label: '󰄶',
  })
})

const fullscreenButton = Widget.Button({
    class_name: 'mainButton',
    onClicked: () => execAsync(`hyprctl dispatch fullscreen 1`),
    child: Widget.Label({
      class_name: "button-icon",
      label: '',
  })
})

const closeButton = Widget.Button({
    class_name: 'mainButton',
    onClicked: () => execAsync(`hyprctl dispatch killactive 1`),
    child: Widget.Label({
      class_name: "button-icon",
      label: '',
  })
})
const buttonBox = Widget.Box({
    children: [ floatingButton, fullscreenButton, closeButton ],
})

export default () => Widget.Box({
    class_name: 'button-bar panel-button',
    child: buttonBox
});
