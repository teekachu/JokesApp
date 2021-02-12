//
//  Joke.swift
//  DadJokes
//
//  Created by Ting Becker on 2/11/21.
//

import Foundation

struct Joke: Codable {
    var content: String
    var downvotes: Int
    var id: String
    var nsfw: Int
    var upvotes: Int
}
