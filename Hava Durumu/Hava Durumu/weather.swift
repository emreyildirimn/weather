//
//  weather.swift
//  Hava Durumu
//
//  Created by iMac on 30.06.2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import Foundation
struct Weather {
    let currently : currentWeather
}

extension Weather {
    init?(json : [String : AnyObject]){
        guard let currentWeatherJson = json ["weather"] as? [String : AnyObject], let currentWeather = currentWeather(json: currentWeatherJson) else {
            return nil
        }
        self.currently = currentWeather
        print (currentWeatherJson)
    }

}
