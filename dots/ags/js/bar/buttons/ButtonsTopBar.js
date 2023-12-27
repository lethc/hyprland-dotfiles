import App from 'resource:///com/github/Aylur/ags/app.js';
import PanelButton from '../PanelButton.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';
import HoverRevealer from '../../misc/HoverRevealer.js';
import Notifications from 'resource:///com/github/Aylur/ags/service/notifications.js';
import icons from '../../icons.js';

const floatingButton = Widget.Button({
    class_name: 'mainButton',
    tooltip_text: 'Floating Window',
    onClicked: () => execAsync(`hyprctl dispatch togglefloating 1`),
    child: Widget.Label({
      class_name: "button-icon",
      label: '󰄶',
  })
})

const fullscreenButton = Widget.Button({
    class_name: 'mainButton',
    tooltip_text: 'Maximise Window',
    onClicked: () => execAsync(`hyprctl dispatch fullscreen 1`),
    child: Widget.Label({
      class_name: "button-icon",
      label: '',
  })
})

const closeButton = Widget.Button({
    class_name: 'mainButton',
    tooltip_text: 'Close Window',
    onClicked: () => execAsync(`hyprctl dispatch killactive 1`),
    child: Widget.Label({
      class_name: "button-icon",
      label: '',
  })
})
const buttonBox = Widget.Box({
    children: [ floatingButton, fullscreenButton, closeButton ],
})

// export default () => Widget.Box({
//     class_name: 'button-bar panel-button',
//     child: buttonBox
// });

export default ({ direction = 'right' } = {}) => HoverRevealer({
    class_name: 'button-bar panel-button',
    direction,
    indicator: Widget.Icon({
        binds: [['icon', Notifications, 'dnd', dnd => dnd
            ? icons.toggle.on
            : icons.toggle.on,
        ]],
    }),
    child: buttonBox
});
