//
//  apiKey.swift
//  Hava Durumu
//
//  Created by mac on 18.08.2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import Foundation

var apiLink : String = "https://api.openweathermap.org/data/2.5/weather?q="
var apiKey : String = "tr&appid=00f63a1cff271776651468c0204c422c"
var apiCity : String = "ISTANBUL"
var link : String = "\(apiLink)\(apiCity),\(apiKey)"
