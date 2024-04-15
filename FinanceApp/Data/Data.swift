//
//  Data.swift
//  FinanceApp
//
//  Created by GroupHappy on 04/13/2024.
//

import Foundation

let filters: [String] = ["1 Year", "6 Months", "Last Month", "This Week"]
let templetes:[Templete] = [
    Templete(name: "Insurance", amount: "$150.80", serialNumber: "401", colorPrimary: "OrangePrimary", colorSecondary: "OrangeSecondary"),
    Templete(name: "Tax", amount: "$1,250", serialNumber: "402", colorPrimary: "BluePrimary", colorSecondary: "BlueSecondary"),
]



struct Templete {
    let name: String
    let amount: String
    let serialNumber: String
    let colorPrimary: String
    let colorSecondary: String
}
