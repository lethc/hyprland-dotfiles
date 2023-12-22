import Service from "resource:///com/github/Aylur/ags/service.js";
import Soup from "gi://Soup?version=3.0";
import GLib from "gi://GLib";
import { interval } from "resource:///com/github/Aylur/ags/utils.js";
import icons from "../icons.js";

class WeatherService extends Service {
  static {
    Service.register(
      this,
      {},
      {
        "feels-like": ["int"],
        temp: ["int"],
        icon: ["string"],
        description: ["string"],
        city: ["string"],
        "weather-data": ["jsobject"],
      }
    );
  }

  _feels_like = 0;
  _temp = 0;
  _description = "";
  _icon = "";
  _city = "";
  _weather_data = {};
  _url = GLib.Uri.parse("http://wttr.in/?format=j1", GLib.UriFlags.NONE);
  _decoder = new TextDecoder();

  get feels_like() {
    return this._feels_like;
  }
  get temp() {
    return this._temp;
  }
  get icon() {
    return this._icon;
  }
  get description() {
    return this._description;
  }
  get weather_data() {
    return this._weather_data;
  }

  get city() {
    return this._city;
  }
  constructor() {
    super();
    interval(900000, this._getWeather.bind(this)); // every 15 min
  }

  _getWeather() {
    const session = new Soup.Session();
    const message = new Soup.Message({
      method: "GET",
      uri: this._url,
    });
    session.send_and_read_async(
      message,
      GLib.DEFAULT_PRIORITY,
      null,
      (_, result) => {
        const resp = this._decoder.decode(
          session.send_and_read_finish(result).get_data()
        );
        const weatherData = JSON.parse(resp);
        this.updateProperty("weather_data", weatherData);
        this.updateProperty(
          "feels_like",
          Number(weatherData["current_condition"][0]["FeelsLikeC"])
        );
        this.updateProperty(
          "temp",
          Number(weatherData["current_condition"][0]["temp_C"])
        );
        this.updateProperty(
          "description",
          weatherData["current_condition"][0]["weatherDesc"][0]["value"]
        );
        const weatherCode = weatherData["current_condition"][0]["weatherCode"];
        const sunriseHour =
          weatherData["weather"][0]["astronomy"][0]["sunrise"].split(":")[0];
        const sunsetHour =
          weatherData["weather"][0]["astronomy"][0]["sunset"].split(":")[0];
        const city = weatherData["nearest_area"][0]["areaName"][0]["value"];
        this.updateProperty("city", city);
        this.updateProperty("icon", icons.weather[weatherCode] || "");
      }
    );
  }
}

const service = new WeatherService();
export default service;
