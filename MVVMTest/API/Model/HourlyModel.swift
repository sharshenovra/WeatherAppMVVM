import Foundation

class HourlyModelElement: Codable {
    var dateTime: String?
    var epochDateTime, weatherIcon: Int?
    var iconPhrase: String?
    var hasPrecipitation, isDaylight: Bool?
    var temperature: Temperature?
    var precipitationProbability: Int?
    var mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
        case epochDateTime = "EpochDateTime"
        case weatherIcon = "WeatherIcon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case isDaylight = "IsDaylight"
        case temperature = "Temperature"
        case precipitationProbability = "PrecipitationProbability"
        case mobileLink = "MobileLink"
        case link = "Link"
    }

    init(dateTime: String?, epochDateTime: Int?, weatherIcon: Int?, iconPhrase: String?, hasPrecipitation: Bool?, isDaylight: Bool?, temperature: Temperature?, precipitationProbability: Int?, mobileLink: String?, link: String?) {
        self.dateTime = dateTime
        self.epochDateTime = epochDateTime
        self.weatherIcon = weatherIcon
        self.iconPhrase = iconPhrase
        self.hasPrecipitation = hasPrecipitation
        self.isDaylight = isDaylight
        self.temperature = temperature
        self.precipitationProbability = precipitationProbability
        self.mobileLink = mobileLink
        self.link = link
    }
}

class Temperature: Codable {
    var value: Double?
    var unit: String?
    var unitType: Int?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }

    init(value: Double?, unit: String?, unitType: Int?) {
        self.value = value
        self.unit = unit
        self.unitType = unitType
    }
}

typealias HourlyModel = [HourlyModelElement]
