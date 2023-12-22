import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import DateColumn from './DateColumn.js';
import NotificationColumn from './NotificationColumn.js';
import PopupWindow from '../misc/PopupWindow.js';
import options from '../options.js';

export default () => PopupWindow({
    name: 'notPanel',
    connections: [[options.bar.position, self => {
        self.anchor = ['right',options.bar.position.value];
        if (options.bar.position.value === 'top')
            self.transition = 'slide_left';

        if (options.bar.position.value === 'bottom')
            self.transition = 'slide_left';
    }]],
    child: Widget.Box({
    css: 'min-height: 38em; min-width: 10em; margin-left: 1em',
        children: [
            NotificationColumn(),
            // Widget.Separator({ orientation: 1 }),
            // DateColumn(),
        ],
    }),
});
