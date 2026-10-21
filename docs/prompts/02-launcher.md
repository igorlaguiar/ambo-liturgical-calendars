# 2. Glass Home: a liturgical TV home screen

Give this prompt to your AI coding assistant after the debloat and basic launcher from [step 1](01-debloat.md). Edit the parts in **[brackets]**.

---

Redesign my TV launcher as a reverent, beautiful home screen built around the day in the Church's calendar. Work on the real TV over ADB and check every change with a screenshot pulled from it.

**Data.** Use the liturgical calendar data at
`https://cdn.jsdelivr.net/gh/igorlaguiar/ambo-liturgical-calendars@v1`
(format in its README and `schema/day.schema.json`). Fetch today's file for both forms, `ordinary` and `1962`, for the calendar **[united-states]** in **[en]**, once a day, and cache it on the device so the screen works offline. Also download the background pictures from `images/` and `palette.json`.

**Layout (1920 × 1080, dark):**
- Top left: a greeting ("Good evening, [Name]"), a large thin clock, and the date followed by the season ("Monday, October 19 – Ordinary Time").
- Under the date: the day's `status` text, if any, as a small gold-outlined tag.
- Left side, aligned with the clock: the rank in spaced gold capitals, a thin rule and the missal's name in gold italics ("Ordinary Form" / "1962 Missal"); the celebration title in a large classical serif (Cormorant Garamond); an italic line with the weekday of the season or the first optional memorial or commemoration; and the gospel citation with a small "GOSPEL" label, on the same baseline.
- Background: the picture for the day's `celebration.color`, full screen, darkened on the left and bottom so the text stays readable. Without a picture, a deep wash of the colour.
- **Alternate** between the Ordinary Form and the 1962 Missal every **[9]** seconds with a gentle crossfade of the text, the season and the picture. Pause while another app is open.
- Top right: two small round icon buttons, Inputs (a dropdown of HDMI, AV and Live TV) and Settings (a dropdown of the settings screens the TV lets apps open). Each dropdown is aligned to the right edge of its button.
- Bottom right: every app as a white glyph made from its icon plus its name, four rows visible, scrolling one row at a time, with faint chevrons when more apps are hidden above or below. The focused app is full white and slightly larger; the others are dimmed. My first four: **[YouTube, Rumble, Quick Player, Formed]**, then the rest A–Z.

**Navigation.** Deterministic D-pad: Up and Down move one app; Up from the first app goes to the top buttons; Left from the apps or from the first top button selects the date line, which shows ‹ › chevrons, and Left and Right then browse other days (the browsed date in gold; OK or Back returns to today). Remember the last focused app.

**Keep it light.** No blur, no video, no polling: update on the minute tick and when the date changes.

**Previews.** Accept an intent extra to preview any date (it should set the date line too), so I can check feasts like Christmas, Ash Wednesday, Gaudete, Good Friday and All Souls.

---

The calendar data is open; corrections are welcome as issues on the [data repo](https://github.com/igorlaguiar/ambo-liturgical-calendars).
