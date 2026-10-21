# Today's celebration in both missals.
import datetime, json, urllib.request

BASE = "https://cdn.jsdelivr.net/gh/igorlaguiar/ambo-liturgical-calendars@v1"
d = datetime.date.today().isoformat()
for form in ("ordinary", "1962"):
    url = f"{BASE}/data/v1/{form}/general-roman/{d[:4]}/{d}.json"
    day = json.load(urllib.request.urlopen(url))
    gospel = next((r["citation"] for r in day["readings"] if r["id"].startswith("gospel")), "")
    print(form, "|", day["celebration"]["title"]["en"], "|", day["celebration"]["color"], "|", gospel)
