//
//  Microwave.swift
//
//  Created by Ryan Chung
//  Created on 2021-11-18
//  Version 1.0
//  Copyright (c) 2020 Ryan Chung. All rights reserved.
//
//  This program calculates the heating time of different food items and
//  quantities.
//

import Foundation

// Constant Declarations
// Heating times in seconds
let subHeatingTime = 60.0
let soupHeatingTime = 105.0
let pizzaHeatingTime = 45.0

// Extra time needed to heat up more than one food item at a time
let twoItemMultiplier = 1.5
let threeItemMultiplier = 2.0

// How many seconds there are in a minute
let secsInMin = 60

// User choice on one, two or three food items
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

// Checks what the user input was and assigns the proper food item heating time
switch foodItemInput.lowercased() {
case "soup": totalSecondsToCook = soupHeatingTime
case "sub": totalSecondsToCook = subHeatingTime
case "pizza": totalSecondsToCook = pizzaHeatingTime
default: print("Not a valid food item from the list."); exit(002)
}

// User prompt
print("How many items would you like to heat up? ", terminator: "")

// Gathers the user input and makes sure it isn't empty
guard let quantityInputString = readLine(), !quantityInputString.isEmpty else {
    print("Please enter a correct input.")
    exit(001)
}

// Checks if it is possible to cast the inputted quantity to Int.
if let quantityInput = Int(quantityInputString) {

    // Checks what the user input was and assigns the proper food item time
    // multiplier
    switch quantityInput {
    case oneItem: break
    case twoItems: totalSecondsToCook *= twoItemMultiplier
    case threeItems: totalSecondsToCook *= threeItemMultiplier
    default: print("Not a valid quantity"); exit(003)
    }

    // Calculates the minutes and seconds that are required to heat up the food
    // item(s)
    let minutesToCook = totalSecondsToCook / 60
    let secondsToCook =
    Double(totalSecondsToCook).truncatingRemainder(dividingBy: 60)

    // Outputs the calculations
    print("It would take "
                    + String(format: "%.0f", floor(minutesToCook))
                    + " minutes and "
                    + String(format: "%.01f", secondsToCook)
                    + " seconds to cook.")
} else {
    print("That wasn't a number.")
}

print("\nDone.")
