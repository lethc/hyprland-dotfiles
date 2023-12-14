import Applauncher from './applauncher/Applauncher.js';
import Dashboard from './dashboard/Dashboard.js';
import Desktop from './desktop/Desktop.js';
import FloatingDock from './dock/FloatingDock.js';
import Lockscreen from './lockscreen/Lockscreen.js';
import Notifications from './notifications/Notifications.js';
import OSD from './osd/OSD.js';
import Overview from './overview/Overview.js';
import PowerMenu from './powermenu/PowerMenu.js';
import QuickSettings from './quicksettings/QuickSettings.js';
import ScreenCorners from './screencorner/ScreenCorners.js';
import TopBar from './bar/TopBar.js';
import Verification from './powermenu/Verification.js';
// import About from './about/about.js';
import { init } from './settings/setup.js';
import { forMonitors } from './utils.js';
import options from './options.js';

const windows = () => [
    forMonitors(Desktop), // A Desktop Clock on top of the wallpaper and the right click's pop-up
    forMonitors(FloatingDock),
    // forMonitors(Lockscreen),
    forMonitors(Notifications), // Notification pop-ups
    forMonitors(OSD),
    forMonitors(ScreenCorners), // The rounded corners around the screen
    forMonitors(TopBar),
    Applauncher(),
    Dashboard(), // The Notification Panel
    Overview(), // Show all the workspaces by pressing the button on the left
    PowerMenu(), // Show Power options by pressing the button on the right
    QuickSettings(), // Show a small menu by pressing the wifi icon
    Verification(), // Show a Verification menu by pressing the Power button in the QuickSettings
    // About(),
];

export default {
    onConfigParsed: init,
    windows: windows().flat(1),
    maxStreamVolume: 1.05,
    cacheNotificationActions: true,
    closeWindowDelay: {
        'quicksettings': options.transition.value,
        'dashboard': options.transition.value,
    },
};
