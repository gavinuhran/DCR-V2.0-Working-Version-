//
//  ViewController.swift
//  DCR
//
//  Created by Gavin Uhran on 6/28/17.
//  Copyright © 2017 Gavin Uhran. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController
{
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var hunterButtonProperties: UIButton!
    @IBOutlet weak var titanButtonProperties: UIButton!
    @IBOutlet weak var warlockButtonProperties: UIButton!
    
    var jsonHunter = JSON(String.self)
    var jsonWarlock = JSON(String.self)
    var jsonTitan = JSON(String.self)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let headers = ["X-API-Key": "84190c23570a4facb028c9e596b18d82"]
        Alamofire.request("http://www.bungie.net/Platform/Destiny/Stats/1/4611686018438291723/2305843009301984531", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                self.jsonHunter = JSON(value)
                print("JSON: \(self.jsonHunter)")
            case .failure(let error):
                print(error)
            }
        }
        
        Alamofire.request("http://www.bungie.net/Platform/Destiny/Stats/1/4611686018438291723/2305843009438962140", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                self.jsonWarlock = JSON(value)
                print("JSON: \(self.jsonWarlock)")
            case .failure(let error):
                print(error)
            }
        }
        Alamofire.request("http://www.bungie.net/Platform/Destiny/Stats/1/4611686018435748893/2305843009439029087", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                self.jsonTitan = JSON(value)
                print("JSON: \(self.jsonTitan)")
            case .failure(let error):
                print(error)
            }
        }
        hunterButtonProperties.backgroundColor = UIColor.blue
        titanButtonProperties.backgroundColor = UIColor.blue
        warlockButtonProperties.backgroundColor = UIColor.blue
    }
    
    func parseKD(data: JSON)
    {
        let kd = data["Response"]["allPvP"]["allTime"]["killsDeathsRatio"]["basic"]["displayValue"].stringValue
        amountLabel.text = "\(kd) KD"
        if Double(kd)! < 1.25
        {
            image.image = #imageLiteral(resourceName: "down")
        }
        if Double(kd)! >= 1.25 && Double(kd)! < 1.4
        {
            image.image = #imageLiteral(resourceName: "flat")
        }
        if Double(kd)! >= 1.4
        {
            image.image = #imageLiteral(resourceName: "up")
        }
    }
    @IBAction func hunterButton(_ sender: UIButton)
    {
        parseKD(data: self.jsonHunter)
        hunterButtonProperties.backgroundColor = UIColor.green
        titanButtonProperties.backgroundColor = UIColor.blue
        warlockButtonProperties.backgroundColor = UIColor.blue
    }
    @IBAction func warlockButton(_ sender: UIButton)
    {
        parseKD(data: self.jsonWarlock)
        hunterButtonProperties.backgroundColor = UIColor.blue
        titanButtonProperties.backgroundColor = UIColor.blue
        warlockButtonProperties.backgroundColor = UIColor.green
    }
    @IBAction func titanButton(_ sender: UIButton)
    {
        parseKD(data: self.jsonTitan)
        hunterButtonProperties.backgroundColor = UIColor.blue
        titanButtonProperties.backgroundColor = UIColor.green
        warlockButtonProperties.backgroundColor = UIColor.blue
    }
}
