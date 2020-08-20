//
//  currentWeatherModel.swift
//  Hava Durumu
//
//  Created by iMac on 28.06.2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import Foundation
import UIKit

struct currentWeatherModel{
    let bilgi : String
    let resim : UIImage
    let sicaklik :  String
    let nemOrani : String
    let yagmurIhtimali : String


init (data : currentWeather) {
    self.bilgi = "\(data.bilgi)"
    self.resim = data.iconImage
    self.sicaklik = "\(Int(data.sicaklik))℃"
    self.nemOrani = "%\(data.nemOrani)"
    self.yagmurIhtimali = "%\(data.yagmurIhtimali)"
    }}
