//
//  RPS.swift
//  Roshambo
//
//  Created by Ken Hom on 10/6/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import Foundation

enum RPS {
    case rock, paper, scissors
    
    // choose random type on init
    init() {
        switch arc4random() % 3 {
        case 0: self = .rock
        case 1: self = .paper
        default: self = .scissors
        }
    }
    
    // defines who defeats whom
    func defeats(opponent: RPS) -> Bool {
        switch(self, opponent) {
        case (.paper, .rock), (.rock, .scissors), (.scissors, .paper):
            return true
        default:
            return false
        }
    }
}

// MARK: - RPS: CustomStringConvertible

extension RPS: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissors:
                return "Scissors"
            }
        }
    }
}
