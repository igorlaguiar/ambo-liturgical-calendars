// Today's celebration in the browser or Node 18+.
const BASE = "https://cdn.jsdelivr.net/gh/igoraguiar/liturgical-calendar-data@v1";
const date = new Date().toLocaleDateString("en-CA"); // YYYY-MM-DD in local time
const url = `${BASE}/data/v1/ordinary/united-states/${date.slice(0, 4)}/${date}.json`;
const day = await (await fetch(url)).json();
console.log(day.celebration.title.en, "·", day.celebration.color, "·", day.status?.text.en ?? "");
