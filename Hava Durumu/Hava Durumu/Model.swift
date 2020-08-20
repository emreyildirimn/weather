//
//  Model.swift
//  Hava Durumu
//
//  Created by mac on 18.08.2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import Foundation

struct Response: Codable {
    let weather: [Weather]
    let main: Main
}

struct Weather: Codable {
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case humidity
    }
    
    let temperature: Double
    let humidity: Double
}
