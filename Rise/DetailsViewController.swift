//
//  ViewController.swift
//  Rise
//
//  Created by Alan Chang on 3/30/19.
//  Email: alangcha@usc.edu
//  Copyright © 2019 ITP342. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView


class DetailsViewController: UIViewController,CLLocationManagerDelegate {
    //Declare outlets for details view controller
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var weatherIconView: UIImageView!
    
    @IBOutlet weak var tempHighLabel: UILabel!
    @IBOutlet weak var tempLowLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    
    @IBOutlet weak var tempHighDataLabel: UILabel!
    @IBOutlet weak var tempLowDataLabel: UILabel!
    @IBOutlet weak var windspeedDataLabel: UILabel!
    
    //Initliaze variables needed for program and API key
    let API_KEY = "18312e2d5b0b5b1e51a6f96eb27fa354";
    let locationManager = CLLocationManager();
    var activityIndicator: NVActivityIndicatorView!;
    var latitude = 34.0522;
    var longitude = 118.2437;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //Initialize acvitity indicator
        let indicatorSize: CGFloat = 70;
        let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2, y: (view.frame.height-indicatorSize)/2, width: indicatorSize, height: indicatorSize);
        activityIndicator = NVActivityIndicatorView(frame: indicatorFrame, type: .lineScale, color: UIColor.white, padding: 20.0);
        activityIndicator.backgroundColor = UIColor.black;
        view.addSubview(activityIndicator);
        self.activityIndicator.startAnimating();
        
        //Request user to access location
        locationManager.requestWhenInUseAuthorization();
        
        //If location is enables, get user location
        if(CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            locationManager.startUpdatingLocation();
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Gets current location and assigns latitude and longitude coordinates
        let location = locations[0];
        latitude = location.coordinate.latitude;
        longitude = location.coordinate.longitude;
        
        //Request to API for information
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)&units=metric").responseJSON { response in
            self.activityIndicator.stopAnimating();
            if let responseStr = response.result.value {
                //Parses JSON file for main categories
                let jsonResponse = JSON(responseStr);
                let jsonWeather = jsonResponse["weather"].array![0];
                let jsonTemp = jsonResponse["main"];
                let jsonWind = jsonResponse["wind"];
                
                //Parses JSON file for detailed data
                self.locationLabel.text = jsonResponse["name"].stringValue;
                
                let weatherDesc = jsonWeather["main"].stringValue;
                self.weatherDescriptionLabel.text = weatherDesc;
                DataModel.sharedInstance.weatherDescription = weatherDesc;
                
                if (weatherDesc.lowercased().contains("clouds")) {
                    self.weatherIconView.image = UIImage(named: "Cloud");
                }
                else if (weatherDesc.lowercased().contains("clear")) {
                    self.weatherIconView.image = UIImage(named: "Sunny");
                }
                else if (weatherDesc.lowercased().contains("rain") || weatherDesc.lowercased().contains("thunderstorm")) {
                    self.weatherIconView.image = UIImage(named: "Rain");
                }
                
                let temp1 = (Int(round(jsonTemp["temp"].doubleValue) * (9/5) + 32));
                self.temperatureLabel.text = "\(temp1)°F";
                DataModel.sharedInstance.currentTemp = temp1;
                let temp2 = (Int(round(jsonTemp["temp_max"].doubleValue) * (9/5) + 32));
                self.tempHighDataLabel.text = "\(temp2)°F";
                DataModel.sharedInstance.dayHigh = temp2;
                let temp3 = (Int(round(jsonTemp["temp_min"].doubleValue) * (9/5) + 32));
                self.tempLowDataLabel.text = "\(temp3)°F";
                DataModel.sharedInstance.dayLow = temp3;
                self.windspeedDataLabel.text = "\(Double(jsonWind["speed"].doubleValue))" + " mph/hr";
                DataModel.sharedInstance.windspeed = Double(jsonWind["speed"].doubleValue);
                
                //Determines and formats the current day of the week
                let date = Date();
                let dateFormatter = DateFormatter();
                dateFormatter.dateFormat = "EEEE";
                self.dayOfWeekLabel.text = dateFormatter.string(from: date);
            }
        }
    }
}

