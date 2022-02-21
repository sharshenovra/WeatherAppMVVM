import Foundation

// MARK: - WeatherModel
class WeatherModel: Codable {
    var headline: Headline?
    var dailyForecasts: [DailyForecast]?

    enum CodingKeys: String, CodingKey {
        case headline = "Headline"
        case dailyForecasts = "DailyForecasts"
    }

    init(headline: Headline?, dailyForecasts: [DailyForecast]?) {
        self.headline = headline
        self.dailyForecasts = dailyForecasts
    }
}

// MARK: - DailyForecast
class DailyForecast: Codable {
    var date: String?
    var epochDate: Int?
    var sun: Sun?
    var moon: Moon?
    var temperature, realFeelTemperature, realFeelTemperatureShade: RealFeelTemperature?
    var hoursOfSun: Double?
    var degreeDaySummary: DegreeDaySummary?
    var airAndPollen: [AirAndPollen]?
    var day, night: Day?
    var sources: [String]?
    var mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case epochDate = "EpochDate"
        case sun = "Sun"
        case moon = "Moon"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
        case hoursOfSun = "HoursOfSun"
        case degreeDaySummary = "DegreeDaySummary"
        case airAndPollen = "AirAndPollen"
        case day = "Day"
        case night = "Night"
        case sources = "Sources"
        case mobileLink = "MobileLink"
        case link = "Link"
    }

    init(date: String?, epochDate: Int?, sun: Sun?, moon: Moon?, temperature: RealFeelTemperature?, realFeelTemperature: RealFeelTemperature?, realFeelTemperatureShade: RealFeelTemperature?, hoursOfSun: Double?, degreeDaySummary: DegreeDaySummary?, airAndPollen: [AirAndPollen]?, day: Day?, night: Day?, sources: [String]?, mobileLink: String?, link: String?) {
        self.date = date
        self.epochDate = epochDate
        self.sun = sun
        self.moon = moon
        self.temperature = temperature
        self.realFeelTemperature = realFeelTemperature
        self.realFeelTemperatureShade = realFeelTemperatureShade
        self.hoursOfSun = hoursOfSun
        self.degreeDaySummary = degreeDaySummary
        self.airAndPollen = airAndPollen
        self.day = day
        self.night = night
        self.sources = sources
        self.mobileLink = mobileLink
        self.link = link
    }
}

// MARK: - AirAndPollen
class AirAndPollen: Codable {
    var name: String?
    var value: Int?
    var category: String?
    var categoryValue: Int?
    var type: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case category = "Category"
        case categoryValue = "CategoryValue"
        case type = "Type"
    }

    init(name: String?, value: Int?, category: String?, categoryValue: Int?, type: String?) {
        self.name = name
        self.value = value
        self.category = category
        self.categoryValue = categoryValue
        self.type = type
    }
}

// MARK: - Day
class Day: Codable {
    var icon: Int?
    var iconPhrase: String?
    var hasPrecipitation: Bool?
    var shortPhrase, longPhrase: String?
    var precipitationProbability, thunderstormProbability, rainProbability, snowProbability: Int?
    var iceProbability: Int?
    var wind, windGust: Wind?
    var totalLiquid, rain, snow, ice: Evapotranspiration?
    var hoursOfPrecipitation, hoursOfRain, hoursOfSnow, hoursOfIce: Int?
    var cloudCover: Int?
    var evapotranspiration, solarIrradiance: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case shortPhrase = "ShortPhrase"
        case longPhrase = "LongPhrase"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case wind = "Wind"
        case windGust = "WindGust"
        case totalLiquid = "TotalLiquid"
        case rain = "Rain"
        case snow = "Snow"
        case ice = "Ice"
        case hoursOfPrecipitation = "HoursOfPrecipitation"
        case hoursOfRain = "HoursOfRain"
        case hoursOfSnow = "HoursOfSnow"
        case hoursOfIce = "HoursOfIce"
        case cloudCover = "CloudCover"
        case evapotranspiration = "Evapotranspiration"
        case solarIrradiance = "SolarIrradiance"
    }

    init(icon: Int?, iconPhrase: String?, hasPrecipitation: Bool?, shortPhrase: String?, longPhrase: String?, precipitationProbability: Int?, thunderstormProbability: Int?, rainProbability: Int?, snowProbability: Int?, iceProbability: Int?, wind: Wind?, windGust: Wind?, totalLiquid: Evapotranspiration?, rain: Evapotranspiration?, snow: Evapotranspiration?, ice: Evapotranspiration?, hoursOfPrecipitation: Int?, hoursOfRain: Int?, hoursOfSnow: Int?, hoursOfIce: Int?, cloudCover: Int?, evapotranspiration: Evapotranspiration?, solarIrradiance: Evapotranspiration?) {
        self.icon = icon
        self.iconPhrase = iconPhrase
        self.hasPrecipitation = hasPrecipitation
        self.shortPhrase = shortPhrase
        self.longPhrase = longPhrase
        self.precipitationProbability = precipitationProbability
        self.thunderstormProbability = thunderstormProbability
        self.rainProbability = rainProbability
        self.snowProbability = snowProbability
        self.iceProbability = iceProbability
        self.wind = wind
        self.windGust = windGust
        self.totalLiquid = totalLiquid
        self.rain = rain
        self.snow = snow
        self.ice = ice
        self.hoursOfPrecipitation = hoursOfPrecipitation
        self.hoursOfRain = hoursOfRain
        self.hoursOfSnow = hoursOfSnow
        self.hoursOfIce = hoursOfIce
        self.cloudCover = cloudCover
        self.evapotranspiration = evapotranspiration
        self.solarIrradiance = solarIrradiance
    }
}

// MARK: - Evapotranspiration
class Evapotranspiration: Codable {
    var value: Double?
    var unit: String?
    var unitType: Int?
    var phrase: String?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
        case phrase = "Phrase"
    }

    init(value: Double?, unit: String?, unitType: Int?, phrase: String?) {
        self.value = value
        self.unit = unit
        self.unitType = unitType
        self.phrase = phrase
    }
}

// MARK: - Wind
class Wind: Codable {
    var speed: Evapotranspiration?
    var direction: Direction?

    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
        case direction = "Direction"
    }

    init(speed: Evapotranspiration?, direction: Direction?) {
        self.speed = speed
        self.direction = direction
    }
}

// MARK: - Direction
class Direction: Codable {
    var degrees: Int?
    var localized, english: String?

    enum CodingKeys: String, CodingKey {
        case degrees = "Degrees"
        case localized = "Localized"
        case english = "English"
    }

    init(degrees: Int?, localized: String?, english: String?) {
        self.degrees = degrees
        self.localized = localized
        self.english = english
    }
}

// MARK: - DegreeDaySummary
class DegreeDaySummary: Codable {
    var heating, cooling: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case heating = "Heating"
        case cooling = "Cooling"
    }

    init(heating: Evapotranspiration?, cooling: Evapotranspiration?) {
        self.heating = heating
        self.cooling = cooling
    }
}

// MARK: - Moon
class Moon: Codable {
    var rise: String?
    var epochRise: Int?
    var moonSet: String?
    var epochSet: Int?
    var phase: String?
    var age: Int?

    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case moonSet = "Set"
        case epochSet = "EpochSet"
        case phase = "Phase"
        case age = "Age"
    }

    init(rise: String?, epochRise: Int?, moonSet: String?, epochSet: Int?, phase: String?, age: Int?) {
        self.rise = rise
        self.epochRise = epochRise
        self.moonSet = moonSet
        self.epochSet = epochSet
        self.phase = phase
        self.age = age
    }
}

// MARK: - RealFeelTemperature
class RealFeelTemperature: Codable {
    var minimum, maximum: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }

    init(minimum: Evapotranspiration?, maximum: Evapotranspiration?) {
        self.minimum = minimum
        self.maximum = maximum
    }
}

// MARK: - Sun
class Sun: Codable {
    var rise: String?
    var epochRise: Int?
    var sunSet: String?
    var epochSet: Int?

    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case sunSet = "Set"
        case epochSet = "EpochSet"
    }

    init(rise: String?, epochRise: Int?, sunSet: String?, epochSet: Int?) {
        self.rise = rise
        self.epochRise = epochRise
        self.sunSet = sunSet
        self.epochSet = epochSet
    }
}

// MARK: - Headline
class Headline: Codable {
    var effectiveDate: String?
    var effectiveEpochDate, severity: Int?
    var text, category, endDate: String?
    var endEpochDate: Int?
    var mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case effectiveDate = "EffectiveDate"
        case effectiveEpochDate = "EffectiveEpochDate"
        case severity = "Severity"
        case text = "Text"
        case category = "Category"
        case endDate = "EndDate"
        case endEpochDate = "EndEpochDate"
        case mobileLink = "MobileLink"
        case link = "Link"
    }

    init(effectiveDate: String?, effectiveEpochDate: Int?, severity: Int?, text: String?, category: String?, endDate: String?, endEpochDate: Int?, mobileLink: String?, link: String?) {
        self.effectiveDate = effectiveDate
        self.effectiveEpochDate = effectiveEpochDate
        self.severity = severity
        self.text = text
        self.category = category
        self.endDate = endDate
        self.endEpochDate = endEpochDate
        self.mobileLink = mobileLink
        self.link = link
    }
}
