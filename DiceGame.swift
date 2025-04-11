//
//  GuessingGame.swift
//
//  Created by Santiago Hewett
//  Created on 2025/02/26
//  Version 1.0
//  Copyright (c) Santiago Hewett. All rights reserved.
//
//  This program is a simple number guessing game where the user must guess
//  a randomly generated number between 1 and 6.
import Foundation
// Constants
let MIN_VALUE: Int = 1
let MAX_VALUE: Int = 6
func guessingGame() {
    // Generate random number between MIN_VALUE and MAX_VALUE
    let targetNumber = Int.random(in: MIN_VALUE...MAX_VALUE)
    // Welcome message
    print("Welcome to the Guessing Game!")
    print("I have chosen a integer between \(MIN_VALUE) and \(MAX_VALUE). Try to guess it!")
    // Variables for user input and attempt count
    var guess: Int?
    var attempts: Int = 0
    // Repeat until the correct number is guessed
    repeat {
        // Ask for user input
        print("Enter your guess:")
        // Read user input safely
        guard let userInput = readLine() else {
            print("Invalid input. Please enter a integer between \(MIN_VALUE) and \(MAX_VALUE).")
            continue
        }
        // Attempt to convert input to an integer
        guard let guessLoop = Int(userInput) else {
            print("Invalid input: \(userInput). Please enter a valid integer between \(MIN_VALUE) and \(MAX_VALUE).")
            continue
        }
        // Check if guess is within valid range
        if guessLoop < MIN_VALUE || guessLoop > MAX_VALUE {
            print("Invalid guess: \(guessLoop). Please enter a integer between \(MIN_VALUE) and \(MAX_VALUE).")
            continue
        }
        // Store valid guess and increment attempt count
        guess = guessLoop
        attempts += 1
        // Provide feedback on guess
        if guess! < targetNumber {
            print("Too low! Try again.")
        } else if guess! > targetNumber {
            print("Too high! Try again.")
        }
    } while guess != targetNumber
    // Display success message
    print("Congratulations! You guessed the number in \(attempts) attempts.")
}
// Call function
guessingGame()
