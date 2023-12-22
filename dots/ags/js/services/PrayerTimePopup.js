import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import PopupWindow from '../misc/PopupWindow.js';
import options from '../options.js';
import prayerService from './PrayerTimesService.js';


export default () => PopupWindow({
    name: 'prayertime',
    connections: [[options.bar.position, self => {
        self.anchor = ['left', options.bar.position.value];
        if (options.bar.position.value === 'top')
            self.transition = 'slide_down';

        if (options.bar.position.value === 'bottom')
            self.transition = 'slide_up';
    }]],
    child: Widget.Box({
        vertical: true,
        class_name: 'sliders-box vertical',
        children: [
            Widget.Box({
                class_name: 'prayer-times vertical',
                vertical: true,
                connections: [[prayerService, box => box.children =
                    prayerService.allPrayerTimes.map(pr => Widget.Label(pr.name + " : " + pr.time))
                ]],
            }),
        ],
    }),
});
