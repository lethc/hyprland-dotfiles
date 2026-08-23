(() => {
  var u = new URL(document.location.href);
  var id = u.searchParams.get("v") || u.pathname.slice(1);
  var title = document.title.replace(/ - YouTube$/, "").replace(/^\(\d+\)\s*/, "");

  return "[" + title + "](https://youtu.be/" + id + ")";
})();
