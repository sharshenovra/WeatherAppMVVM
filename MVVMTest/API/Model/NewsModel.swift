// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherModel = try? newJSONDecoder().decode(WeatherModel.self, from: jsonData)

import Foundation

// MARK: - WeatherModel
class WeatherModel: Codable {
    var location: Location?
    var current: Current?
    var forecast: Forecast?

    init(location: Location?, current: Current?, forecast: Forecast?) {
        self.location = location
        self.current = current
        self.forecast = forecast
    }
}

// MARK: - Current
class Current: Codable {
    var lastUpdatedEpoch: Int?
    var lastUpdated: String?
    var tempC, tempF: Double?
    var isDay: Int?
    var condition: Condition?
    var windMph, windKph: Double?
    var windDegree: Int?
    var windDir: WindDir?
    var pressureMB: Int?
    var pressureIn: Double?
    var precipMm, precipIn, humidity, cloud: Int?
    var feelslikeC, feelslikeF: Double?
    var visKM, visMiles, uv: Int?
    var gustMph: Double?
    var gustKph: Int?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }

    init(lastUpdatedEpoch: Int?, lastUpdated: String?, tempC: Double?, tempF: Double?, isDay: Int?, condition: Condition?, windMph: Double?, windKph: Double?, windDegree: Int?, windDir: WindDir?, pressureMB: Int?, pressureIn: Double?, precipMm: Int?, precipIn: Int?, humidity: Int?, cloud: Int?, feelslikeC: Double?, feelslikeF: Double?, visKM: Int?, visMiles: Int?, uv: Int?, gustMph: Double?, gustKph: Int?) {
        self.lastUpdatedEpoch = lastUpdatedEpoch
        self.lastUpdated = lastUpdated
        self.tempC = tempC
        self.tempF = tempF
        self.isDay = isDay
        self.condition = condition
        self.windMph = windMph
        self.windKph = windKph
        self.windDegree = windDegree
        self.windDir = windDir
        self.pressureMB = pressureMB
        self.pressureIn = pressureIn
        self.precipMm = precipMm
        self.precipIn = precipIn
        self.humidity = humidity
        self.cloud = cloud
        self.feelslikeC = feelslikeC
        self.feelslikeF = feelslikeF
        self.visKM = visKM
        self.visMiles = visMiles
        self.uv = uv
        self.gustMph = gustMph
        self.gustKph = gustKph
    }
}

// MARK: - Condition
class Condition: Codable {
    var text: String?
    var icon: Icon?
    var code: Int?

    init(text: String?, icon: Icon?, code: Int?) {
        self.text = text
        self.icon = icon
        self.code = code
    }
}

enum Icon: String, Codable {
    case cdnWeatherapiCOMWeather64X64Day113PNG = "//cdn.weatherapi.com/weather/64x64/day/113.png"
    case cdnWeatherapiCOMWeather64X64Night113PNG = "//cdn.weatherapi.com/weather/64x64/night/113.png"
    case cdnWeatherapiCOMWeather64X64Night116PNG = "//cdn.weatherapi.com/weather/64x64/night/116.png"
}

enum WindDir: String, Codable {
    case e = "E"
    case ene = "ENE"
    case ese = "ESE"
    case ne = "NE"
    case s = "S"
    case se = "SE"
    case sse = "SSE"
}

// MARK: - Forecast
class Forecast: Codable {
    var forecastday: [Forecastday]?

    init(forecastday: [Forecastday]?) {
        self.forecastday = forecastday
    }
}

// MARK: - Forecastday
class Forecastday: Codable {
    var date: String?
    var dateEpoch: Int?
    var day: Day?
    var astro: Astro?
    var hour: [Hour]?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }

    init(date: String?, dateEpoch: Int?, day: Day?, astro: Astro?, hour: [Hour]?) {
        self.date = date
        self.dateEpoch = dateEpoch
        self.day = day
        self.astro = astro
        self.hour = hour
    }
}

// MARK: - Astro
class Astro: Codable {
    var sunrise, sunset, moonrise, moonset: String?
    var moonPhase, moonIllumination: String?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }

    init(sunrise: String?, sunset: String?, moonrise: String?, moonset: String?, moonPhase: String?, moonIllumination: String?) {
        self.sunrise = sunrise
        self.sunset = sunset
        self.moonrise = moonrise
        self.moonset = moonset
        self.moonPhase = moonPhase
        self.moonIllumination = moonIllumination
    }
}

// MARK: - Day
class Day: Codable {
    var maxtempC, maxtempF, mintempC, mintempF: Double?
    var avgtempC, avgtempF, maxwindMph, maxwindKph: Double?
    var totalprecipMm, totalprecipIn, avgvisKM, avgvisMiles: Int?
    var avghumidity, dailyWillItRain, dailyChanceOfRain, dailyWillItSnow: Int?
    var dailyChanceOfSnow: Int?
    var condition: Condition?
    var uv: Int?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }

    init(maxtempC: Double?, maxtempF: Double?, mintempC: Double?, mintempF: Double?, avgtempC: Double?, avgtempF: Double?, maxwindMph: Double?, maxwindKph: Double?, totalprecipMm: Int?, totalprecipIn: Int?, avgvisKM: Int?, avgvisMiles: Int?, avghumidity: Int?, dailyWillItRain: Int?, dailyChanceOfRain: Int?, dailyWillItSnow: Int?, dailyChanceOfSnow: Int?, condition: Condition?, uv: Int?) {
        self.maxtempC = maxtempC
        self.maxtempF = maxtempF
        self.mintempC = mintempC
        self.mintempF = mintempF
        self.avgtempC = avgtempC
        self.avgtempF = avgtempF
        self.maxwindMph = maxwindMph
        self.maxwindKph = maxwindKph
        self.totalprecipMm = totalprecipMm
        self.totalprecipIn = totalprecipIn
        self.avgvisKM = avgvisKM
        self.avgvisMiles = avgvisMiles
        self.avghumidity = avghumidity
        self.dailyWillItRain = dailyWillItRain
        self.dailyChanceOfRain = dailyChanceOfRain
        self.dailyWillItSnow = dailyWillItSnow
        self.dailyChanceOfSnow = dailyChanceOfSnow
        self.condition = condition
        self.uv = uv
    }
}

// MARK: - Hour
class Hour: Codable {
    var timeEpoch: Int?
    var time: String?
    var tempC, tempF: Double?
    var isDay: Int?
    var condition: Condition?
    var windMph, windKph: Double?
    var windDegree: Int?
    var windDir: WindDir?
    var pressureMB: Int?
    var pressureIn: Double?
    var precipMm, precipIn, humidity, cloud: Int?
    var feelslikeC, feelslikeF, windchillC, windchillF: Double?
    var heatindexC, heatindexF, dewpointC, dewpointF: Double?
    var willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int?
    var visKM, visMiles: Int?
    var gustMph, gustKph: Double?
    var uv: Int?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }

    init(timeEpoch: Int?, time: String?, tempC: Double?, tempF: Double?, isDay: Int?, condition: Condition?, windMph: Double?, windKph: Double?, windDegree: Int?, windDir: WindDir?, pressureMB: Int?, pressureIn: Double?, precipMm: Int?, precipIn: Int?, humidity: Int?, cloud: Int?, feelslikeC: Double?, feelslikeF: Double?, windchillC: Double?, windchillF: Double?, heatindexC: Double?, heatindexF: Double?, dewpointC: Double?, dewpointF: Double?, willItRain: Int?, chanceOfRain: Int?, willItSnow: Int?, chanceOfSnow: Int?, visKM: Int?, visMiles: Int?, gustMph: Double?, gustKph: Double?, uv: Int?) {
        self.timeEpoch = timeEpoch
        self.time = time
        self.tempC = tempC
        self.tempF = tempF
        self.isDay = isDay
        self.condition = condition
        self.windMph = windMph
        self.windKph = windKph
        self.windDegree = windDegree
        self.windDir = windDir
        self.pressureMB = pressureMB
        self.pressureIn = pressureIn
        self.precipMm = precipMm
        self.precipIn = precipIn
        self.humidity = humidity
        self.cloud = cloud
        self.feelslikeC = feelslikeC
        self.feelslikeF = feelslikeF
        self.windchillC = windchillC
        self.windchillF = windchillF
        self.heatindexC = heatindexC
        self.heatindexF = heatindexF
        self.dewpointC = dewpointC
        self.dewpointF = dewpointF
        self.willItRain = willItRain
        self.chanceOfRain = chanceOfRain
        self.willItSnow = willItSnow
        self.chanceOfSnow = chanceOfSnow
        self.visKM = visKM
        self.visMiles = visMiles
        self.gustMph = gustMph
        self.gustKph = gustKph
        self.uv = uv
    }
}

// MARK: - Location
class Location: Codable {
    var name, region, country: String?
    var lat, lon: Double?
    var tzID: String?
    var localtimeEpoch: Int?
    var localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }

    init(name: String?, region: String?, country: String?, lat: Double?, lon: Double?, tzID: String?, localtimeEpoch: Int?, localtime: String?) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.tzID = tzID
        self.localtimeEpoch = localtimeEpoch
        self.localtime = localtime
    }
}
