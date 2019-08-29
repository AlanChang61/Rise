//
//  DataModel.swift
//  Rise
//
//  Created by Alan Chang on 3/30/19.
//  Email: alangcha@usc.edu
//  Copyright © 2019 ITP342. All rights reserved.
//

import Foundation

//Singleton for weather data
class DataModel {
    static let sharedInstance = DataModel()
    
    var weatherDescription: String = "";
    var currentTemp: Int = 0;
    var dayHigh: Int = 0;
    var dayLow: Int = 0;
    var windspeed: Double = 0.0;
}
