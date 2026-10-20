# Liturgical calendar data

Free, ready-to-use data for the Catholic liturgical day, in **both the Ordinary Form and the 1962 Missal**, for **2026 and 2027**, in **English, Spanish and Portuguese**. One small JSON file per day, served free over a CDN, so a TV launcher, app or widget can fetch today in a single request.

Made for TV home screens like [Glass Home](docs/prompts/02-launcher.md), but useful anywhere.

## What's in a day

```json
{
  "date": "2026-12-08",
  "form": "1962",
  "calendar": "united-states",
  "season": { "code": "advent", "name": { "en": "Advent", "es": "Adviento", "pt-BR": "Advento" }, "week": null },
  "celebration": {
    "title": { "en": "The Immaculate Conception of Our Lady", "es": "…", "pt-BR": "…" },
    "rank":  { "code": "class-1", "name": { "en": "Feast of the I Class", "es": "…", "pt-BR": "…" } },
    "color": "white"
  },
  "alternatives": [ { "title": { "en": "Feria of the 2nd Week of Advent", "…": "…" }, "rank": { "code": "commemoration", "…": "…" } } ],
  "status": { "code": "holy-day-of-obligation", "text": { "en": "This is a Holy Day of Obligation.", "…": "…" } },
  "readings": [
    { "id": "epistle", "citation": "Proverbs 8:22-35", "passages": [ … ] },
    { "id": "gospel",  "citation": "Luke 1:26-28",     "passages": [ … ] }
  ]
}
```

| Field | Meaning |
|---|---|
| `season` | Liturgical season, with its week in the Ordinary Form |
| `celebration` | The day's main celebration: title, rank and vestment colour (`green`, `violet`, `rose`, `red`, `white`, `black`, `gold`) |
| `alternatives` | Optional memorials (Ordinary Form) or commemorations (1962) |
| `status` | At most one tag: holy day of obligation, fasting, abstinence, penance, recommended fasting/abstinence, or Ember Day, with the rule it comes from |
| `readings` | Reading **citations only** (no texts): first reading, psalm, second reading and gospel in the Ordinary Form; epistle, gospel and lessons in the 1962 Missal |

The full definition is in [schema/day.schema.json](schema/day.schema.json); where each field comes from is in [PROVENANCE.md](PROVENANCE.md).

## Calendars

| `form` | `calendar` values |
|---|---|
| `ordinary` | `general-roman`, `united-states`, `brazil`, `mexico` |
| `1962` | `general-roman`, `united-states`, `brazil`, `mexico` |

Each country's calendar applies its own feasts, transfers (Epiphany, Ascension, Corpus Christi) and holy days and penance rules. The 1962 calendar is the universal one everywhere; only its `status` follows the country, the way the [ambo](https://ambo.today) app does.

## How to use it

Base URL (free, via [jsDelivr](https://www.jsdelivr.com)):

```
https://cdn.jsdelivr.net/gh/igoraguiar/liturgical-calendar-data@v1
```

| What | Path |
|---|---|
| One day | `/data/v1/{form}/{calendar}/{year}/{YYYY-MM-DD}.json` |
| A whole year | `/data/v1/{form}/{calendar}/{year}.json` |
| What's available | `/data/v1/index.json` |
| Background pictures | `/images/{color}.png`, listed in `/images/images.json` |
| Colour palette | `/palette.json` |

Today in the 1962 Missal, United States:

```bash
curl -s "https://cdn.jsdelivr.net/gh/igoraguiar/liturgical-calendar-data@v1/data/v1/1962/united-states/$(date +%Y)/$(date +%F).json"
```

More examples in [examples/](examples): JavaScript, Python, Kotlin (Android) and Swift.

Tips:
- Fetch once a day and cache it. Each day file is about 1–2 KB.
- Use the date in the viewer's local time zone.
- The `@v1` in the URL is the data version: it only changes if the format changes in a way that would break existing apps.

## Background pictures

Eight 3840 × 2160 PNGs, one per vestment colour, plus `default.png` for any colour without its own. The subject sits on the right, and the left side and bottom are dark so text and app icons can sit on top. Darken the left and bottom a little more in your app if your text needs it.

## Colour palette

[palette.json](palette.json) gives each vestment colour as `base` (for light backgrounds), `onDark` (for dark backgrounds) and `wash` (a deep background tint), so apps that use this data look consistent.

## Build your own TV home screen

The prompts used to debloat a Fire TV and build Glass Home with an AI coding assistant are in [docs/prompts](docs/prompts):
1. [Debloat and first launcher](docs/prompts/01-debloat.md): links to the original project.
2. [Glass Home, the liturgical home screen](docs/prompts/02-launcher.md): the design and how to connect it to this data.

## Corrections

Spotted a wrong colour, rank, holy day or citation? [Open a data correction](../../issues/new?template=data-correction.yml), with the date, missal and calendar, and a source if you have one.

## License

MIT, for the data, the images and the examples. See [LICENSE](LICENSE).
