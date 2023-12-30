import App from 'resource:///com/github/Aylur/ags/app.js';
import Clock from '../../misc/Clock.js';
import PanelButton from '../PanelButton.js';

export default ({ format = '%a %e %b 󰧟 %H:%M' } = {}) => PanelButton({
    class_name: 'dashboard panel-button',
    on_clicked: () => App.toggleWindow('dash'),
    window: 'dash',
    content: Clock({ format }),
});
