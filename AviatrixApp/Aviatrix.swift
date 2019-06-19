//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    var author = ""
    var running = false
    var data = AviatrixData()
    var location : String
    var distanceTraveled = 0.0
    var maxFuel = 5000.0
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    var intake = 0.0
    
    init (newAuthor : String, current : String){
        author = newAuthor
        location = current
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() {
        intake = maxFuel - fuelLevel
        fuelLevel = maxFuel
        fuelCost += data.fuelPrices[plane.location]!
    }
    
    func flyTo(destination : String, target : String) {
        distanceTraveled += Double(plane.distanceTo(target: destination, location: location))
        fuelLevel -= distanceTraveled / milesPerGallon
        location = destination
    }
    
    func distanceTo(target : String, location : String) -> Int {
        return data.knownDistances[location]![target]!
    }
    
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC", "SF"]
    }
}
