//
//  CountryData.swift
//  GuessTheFlag
//
//  Created by Nicolas Florencio Felipe on 01/11/23.
//

import Foundation

let url = Bundle.main.url(forResource: "countries", withExtension: "json")!
let data = try! Data(contentsOf: url)

let countriesData = try! JSONDecoder().decode([Country].self, from: data)
