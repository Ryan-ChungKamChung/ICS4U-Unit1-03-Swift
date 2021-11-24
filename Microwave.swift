//
//  Energy.swift
//
//  Created by Ryan Chung
//  Created on 2021-11-18
//  Version 1.0
//  Copyright (c) 2020 Ryan Chung. All rights reserved.
//
//  This program calculates the amount of energy produced by a given mass.
//

import Foundation

let subHeatingTime = 60.0
let soupHeatingTime = 105.0
let pizzaHeatingTime = 45.0

let twoItemMultiplier = 1.5
let threeItemMultiplier = 2.0

let secsInMin = 60

let oneItem = 1
let twoItems = 2
let threeItems = 3

var totalSecondsToCook: Double

// User prompt
print("What food item would you like to heat up? (soup, sub or pizza): ", terminator: "")

// Gathers the user input and makes sure it isn't empty
guard let foodItemInput = readLine(), !foodItemInput.isEmpty else {
    print("Please enter a correct input.")
    exit(001)
}

switch foodItemInput.lowercased() {
case "soup": totalSecondsToCook = soupHeatingTime
case "sub": totalSecondsToCook = subHeatingTime
case "pizza": totalSecondsToCook = pizzaHeatingTime
default: print("Not a valid food item from the list."); exit(002)
}

print("How many items would you like to heat up? ", terminator: "")

guard let quantityInputString = readLine(), !quantityInputString.isEmpty else {
    print("Please enter a correct input.")
    exit(001)
}

if let quantityInput = Int(quantityInputString) {

    switch quantityInput {
    case oneItem: break
    case twoItems: totalSecondsToCook *= twoItemMultiplier
    case threeItems: totalSecondsToCook *= threeItemMultiplier
    default: print("Not a valid quantity"); exit(003)
    }

    let minutesToCook = totalSecondsToCook / 60
    let secondsToCook =
    Double(totalSecondsToCook).truncatingRemainder(dividingBy: 60)

    print("It would take "
                    + String(format: "%.0f", floor(minutesToCook))
                    + " minutes and "
                    + String(format: "%.01f", secondsToCook)
                    + " seconds to cook.")
} else {
    print("That wasn't a number.")
}

print("\nDone.")
