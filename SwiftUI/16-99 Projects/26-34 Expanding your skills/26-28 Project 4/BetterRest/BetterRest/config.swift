//
//  config.swift
//  BetterRest
//
//  Created by Nicolas Florencio Felipe on 25/11/23.
//

import Foundation
import CoreML

do {
    let config = MLModelConfiguration()
    let model = try SleepCalculator(configuration: config)
    let component = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
    let hour = (component.hour ?? 0) * 60 * 60
    let minute = (component.minute ?? 0) * 60 * 60
    let predication = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount+1))
    let sleepTime = wakeUp - predication.actualSleep
    
} catch {
    //something went wrong!
}
