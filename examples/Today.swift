// Apple platforms (Swift): decode just the fields you need.
import Foundation

struct Day: Decodable {
    struct Text: Decodable { let en: String }
    struct Celebration: Decodable { let title: Text; let color: String? }
    struct Status: Decodable { let text: Text }
    let celebration: Celebration
    let status: Status?
}

let base = "https://cdn.jsdelivr.net/gh/igorlaguiar/ambo-liturgical-calendars@v1"
let date = ISO8601DateFormatter.string(from: .now, timeZone: .current, formatOptions: [.withFullDate])
let url = URL(string: "\(base)/data/v1/1962/united-states/\(date.prefix(4))/\(date).json")!
let (data, _) = try await URLSession.shared.data(from: url)
let day = try JSONDecoder().decode(Day.self, from: data)
print(day.celebration.title.en, day.celebration.color ?? "", day.status?.text.en ?? "")
