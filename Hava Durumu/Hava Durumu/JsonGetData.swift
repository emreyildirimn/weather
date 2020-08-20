//
//  JsonGetData.swift
//  Hava Durumu
//
//  Created by mac on 18.08.2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import Foundation
    
    var localization : String?
    var bilgiLbl : String?
    var durumImage : UIImageView!
    var dereceLbl : String?
    var nemLbl : String?

    private func getData (from url : String){
       let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data , response , error in
            guard let data = data ,  error == nil else {
                print ("birşeyler ters gitti")
                return
            }
        var main : Response?
            do {
                main = try JSONDecoder().decode(Response.self , from: data)
            } catch{
                print ("bağlanmada hata var\(error.localizedDescription)")
            }
            guard let json = main else {
                return
            }
        DispatchQueue.main.async {
            localization = apiCity
            bilgiLbl = json.weather[0].description
            durumImage.image = UIImage(named:json.weather[0].icon)
            dereceLbl = "\(String(Int(json.main.temperature-273.15)))°C"
            nemLbl = "%\(String(Int(json.main.humidity)))"
            

        }
            })
        task.resume()
    
        
    
}
