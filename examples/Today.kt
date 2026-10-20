// Android (Kotlin): fetch today's day once, e.g. from a WorkManager job, and cache it.
import java.net.URL
import java.time.LocalDate
import org.json.JSONObject

const val BASE = "https://cdn.jsdelivr.net/gh/igoraguiar/liturgical-calendar-data@v1"

fun today(form: String = "ordinary", calendar: String = "united-states", lang: String = "en"): String {
    val d = LocalDate.now().toString()
    val day = JSONObject(URL("$BASE/data/v1/$form/$calendar/${d.take(4)}/$d.json").readText())
    val c = day.getJSONObject("celebration")
    return c.getJSONObject("title").getString(lang) + " (" + c.getString("color") + ")"
}
