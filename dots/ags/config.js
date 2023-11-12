import App from 'resource:///com/github/Aylur/ags/app.js';

const expectedVersion = '1.5.1';
let config = {};

if (pkg.version === expectedVersion) {
    config = (await import('./js/main.js')).default;
}
else {
    print('your ags version is ' + pkg.version);
    App.connect('config-parsed', app => app.Quit());
}

export default config;
