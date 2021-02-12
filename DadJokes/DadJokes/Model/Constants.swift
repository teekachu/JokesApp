//
//  Constants.swift
//  DadJokes
//
//  Created by Ting Becker on 2/11/21.
//

import Foundation

// New way
enum GFError: String, Error {
    // raw values
    case invalidUsername = "Url created by this username is invalid. Please try again"
    
    case badInternetConnection = "Unable to complete your request. Please check your internet connection"
    
    case invalidResponseFromServer = "Invalid response from server, please try again"
    
    case invalidDataReceived = "Data received from server was invalid, please try again."
    
    case errorJSONParsing = "JSON Parcing was unsuccessful, please try again."
    
    case urlInvalid = "The url attached to this user is invalid"
    
}
