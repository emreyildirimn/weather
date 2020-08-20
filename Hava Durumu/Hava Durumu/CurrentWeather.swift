//
//  CurrentWeather.swift
//  Hava Durumu
//
//  Created by iMac on 28.06.2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import Foundation
import UIKit

struct currentWeather{
    let sicaklik : Double
    let yagmurIhtimali : Double
    let bilgi : String
    let nemOrani : Double
    let resim : String
    init(sicaklik : Double, yagmurIhtimali : Double, bilgi : String, nemOrani : Double, resim : String ){
        self.sicaklik=sicaklik
        self.yagmurIhtimali=yagmurIhtimali
        self.bilgi=bilgi
        self.nemOrani=nemOrani
        self.resim=resim
    }	
}

extension currentWeather{
    var iconImage : UIImage {
        switch resim {
        case "clear sky":return  #imageLiteral(resourceName: "01d")
        case "few clouds": return  #imageLiteral(resourceName: "02d")
        case "scattered clouds": return #imageLiteral(resourceName: "03d")
        case "broken clouds": return #imageLiteral(resourceName: "04d")
        case "shower rain": return #imageLiteral(resourceName: "09d")
        case "rain": return #imageLiteral(resourceName: "10d")
        case "thunder storm": return #imageLiteral(resourceName: "11d")
        case "snow": return #imageLiteral(resourceName: "13d")
        case "mist": return #imageLiteral(resourceName: "50d")
        default : return  #imageLiteral(resourceName: "01d")
        }
    }
}

extension currentWeather{
    struct Key {
        static let sicaklik = "sicaklik"
        static let resim = "resim"
        static let bilgi = "bilgi"
        static let nemOrani = "nemOrani"
        static let yagmurIhtimali = "yagmurIhtimali"
    }
    init?(json : [String : AnyObject]) {
        guard let temp = json[Key.sicaklik] as? Double,
        let iconStr = json[Key.resim] as? String,
        let sum = json[Key.bilgi] as? String,
        let hum = json[Key.nemOrani] as? Double,
        let precipProb = json[Key.yagmurIhtimali] as? Double else{
            return nil
        }
        self.bilgi = sum
        self.sicaklik = temp
        self.yagmurIhtimali = precipProb
        self.nemOrani = hum
        self.resim = iconStr
    }
}
