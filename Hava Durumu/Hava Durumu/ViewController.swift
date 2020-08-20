//
//  ViewController.swift
//  Hava Durumu
//
//  Created by iMac on 28.06.2020.
//  Copyright © 2020 iMac. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var dereceLbl: UILabel!
    @IBOutlet weak var bilgiLbl: UILabel!
    @IBOutlet weak var localization: UILabel!
    @IBOutlet weak var durumImage: UIImageView!
    @IBOutlet weak var nemLbl: UILabel!
    override func viewDidLoad() {
        getData(from: link)
        super.viewDidLoad()
        
    }
    
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
            self.localization.text = apiCity
            self.bilgiLbl.text = json.weather[0].description.uppercased()
            self.durumImage.image = UIImage(named:json.weather[0].icon)
            self.dereceLbl.text = "\(String(Int(json.main.temperature-273.15)))°C"
            self.nemLbl.text = "%\(String(Int(json.main.humidity)))"
            

        }
            })
        task.resume()
    
}}
