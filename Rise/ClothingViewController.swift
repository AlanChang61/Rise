//
//  ClothingViewController.swift
//  Rise
//
//  Created by Alan Chang on 3/30/19.
//  Email: alangcha@usc.edu
//  Copyright © 2019 ITP342. All rights reserved.
//

import UIKit

class ClothingViewController: UIViewController {
    
    //IBOutlets for clothing recommendations
    @IBOutlet weak var shirtImage: UIImageView!
    @IBOutlet weak var pantImage: UIImageView!
    @IBOutlet weak var shoesImage: UIImageView!
    
    //Labels for clothing recommendation
    @IBOutlet weak var shirtLabel: UILabel!
    @IBOutlet weak var pantLabel: UILabel!
    @IBOutlet weak var shoesLabel: UILabel!
    
    //Additional Items Image Outlets
    @IBOutlet weak var additionalImage1: UIImageView!
    @IBOutlet weak var additionalImage2: UIImageView!
    @IBOutlet weak var additionalImage3: UIImageView!
    @IBOutlet weak var additionalImage4: UIImageView!
    
    //Initialize variables to store weather data    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //If the weather for the day has rain
        if (DataModel.sharedInstance.weatherDescription.lowercased().contains("rain") || DataModel.sharedInstance.weatherDescription.lowercased().contains("thunderstorm")) {
            shirtImage.image = UIImage(named: "Jacket");
            pantImage.image = UIImage(named: "LongPants");
            shoesImage.image = UIImage(named: "Boots");
            
            shirtLabel.text = "Raincoat or Jacket";
            pantLabel.text = "Long Pants";
            shoesLabel.text = "Rain Boots";
            
            additionalImage1.image = UIImage(named: "Umbrella");
            
            if (DataModel.sharedInstance.dayLow <= 65) {
                additionalImage2.image = UIImage(named: "Scarf");
                additionalImage3.image = UIImage(named: "Mittens");
                additionalImage4.image = nil;
            }
            else {
                additionalImage2.image = nil;
                additionalImage3.image = nil;
                additionalImage4.image = nil;
            }
        }
        //All other weather conditiosns
        else {
            //Recommendations for a hot day
            if (DataModel.sharedInstance.dayHigh >= 80) {
                shirtImage.image = UIImage(named: "Shirt");
                pantImage.image = UIImage(named: "Shorts");
                shoesImage.image = UIImage(named: "Sneakers");
                
                shirtLabel.text = "Short-Sleeved Shirt";
                pantLabel.text = "Shorts";
                shoesLabel.text = "Sneakers";
                
                additionalImage1.image = UIImage(named: "SunGlasses");
                additionalImage2.image = UIImage(named: "Hat");
                additionalImage3.image = nil;
                additionalImage4.image = nil;
                
                if (DataModel.sharedInstance.weatherDescription.lowercased().contains("rain") || DataModel.sharedInstance.weatherDescription.lowercased().contains("thunderstorm")) {
                    shirtImage.image = UIImage(named: "Jacket");
                    pantImage.image = UIImage(named: "LongPants");
                    shoesImage.image = UIImage(named: "Boots");
                    
                    shirtLabel.text = "Raincoat or Jacket";
                    pantLabel.text = "Long Pants";
                    shoesLabel.text = "Rain Boots";
                    
                    additionalImage3.image = UIImage(named: "Umbrella");
                }
            }
            //Recommendations for a colder day
            else {
                shirtImage.image = UIImage(named: "Jacket");
                pantImage.image = UIImage(named: "LongPants");
                shoesImage.image = UIImage(named: "Sneakers");
                
                shirtLabel.text = "Jacket or Sweater";
                pantLabel.text = "Jeans or Sweats";
                shoesLabel.text = "Sneakers or Boots";
                
                if (DataModel.sharedInstance.dayLow <= 65) {
                    additionalImage1.image = UIImage(named: "Scarf");
                    additionalImage2.image = UIImage(named: "Mittens");
                    additionalImage3.image = nil;
                    additionalImage4.image = nil;
                    if (DataModel.sharedInstance.weatherDescription.lowercased().contains("rain") || DataModel.sharedInstance.weatherDescription.lowercased().contains("thunderstorm")) {
                        shirtImage.image = UIImage(named: "Jacket");
                        pantImage.image = UIImage(named: "LongPants");
                        shoesImage.image = UIImage(named: "Boots");
                        
                        shirtLabel.text = "Raincoat or Jacket";
                        pantLabel.text = "Long Pants";
                        shoesLabel.text = "Rain Boots";
                        
                        additionalImage3.image = UIImage(named: "Umbrella");
                    }
                }
                else {
                    additionalImage1.image = UIImage(named: "Scarf");
                    additionalImage2.image = nil;
                    additionalImage3.image = nil;
                    additionalImage4.image = nil;
                    if (DataModel.sharedInstance.weatherDescription.lowercased().contains("rain") || DataModel.sharedInstance.weatherDescription.lowercased().contains("thunderstorm")) {
                        shirtImage.image = UIImage(named: "Jacket");
                        pantImage.image = UIImage(named: "LongPants");
                        shoesImage.image = UIImage(named: "Boots");
                        
                        shirtLabel.text = "Raincoat or Jacket";
                        pantLabel.text = "Long Pants";
                        shoesLabel.text = "Rain Boots";
                        
                        additionalImage2.image = UIImage(named: "Umbrella");
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad();
    }
}
