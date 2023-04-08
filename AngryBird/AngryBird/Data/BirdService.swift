//
//  BirdService.swift
//  AngryBird
//
//  Created by Yijia chen on 2023/4/6.
//

import Foundation

class BirdService{
    
    func getBirds() ->[Bird]{
        return [
            Bird(named: "Orca", description: "killer whale"),
            Bird(named: "Blue Whale", description: "Largest whale"),
            Bird(named: "Sperm Whale", description: "Largest toothed predator"),
            Bird(named: "Gray Whale", description: "A type of baleen whale"),
            Bird(named: "Fin Whale", description: "Second largest mammal"),
            Bird(named: "Sperm Whale", description: "Largest toothed predator"),
            Bird(named: "North Atlantic Right Whale", description: "White calluses on its head"),
            Bird(named: "Blue Whale", description: "Biggest whale"),
            Bird(named: "Sperm Whale", description: "Largest toothed predator"),
            Bird(named: "Orca", description: "killer whale"),
            Bird(named: "Blue Whale", description: "Biggest whale"),
            Bird(named: "Sperm Whale", description: "Largest toothed predator"),
        ]
    }
}
