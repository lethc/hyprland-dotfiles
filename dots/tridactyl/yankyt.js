// (() => {
//   var v = document.querySelector(".html5-main-video") || document.querySelector("video");
//   var t = v ? Math.floor(v.currentTime) : 0;
//   var u = new URL(document.location.href);
//   var id = u.searchParams.get("v") || u.pathname.slice(1);
//   return "https://youtu.be/" + id + (t > 0 ? "?t=" + t : "");
// })();
(() => {
  var v = document.querySelector(".html5-main-video") || document.querySelector("video");
  var t = v ? Math.floor(v.currentTime) : 0;
  var u = new URL(document.location.href);
  var id = u.searchParams.get("v") || u.pathname.slice(1);

  var h = Math.floor(t / 3600);
  var m = Math.floor((t % 3600) / 60);
  var s = t % 60;
  var pad = function(n) { return n < 10 ? "0" + n : "" + n; };
  var timeStr = h > 0 ? h + ":" + pad(m) + ":" + pad(s) : pad(m) + ":" + pad(s);

  var title = document.title.replace(/ - YouTube$/, "").replace(/^\(\d+\)\s*/, "");

  return "[" + title + " at " + timeStr + "](https://youtu.be/" + id + "?t=" + t + ")";
})();
