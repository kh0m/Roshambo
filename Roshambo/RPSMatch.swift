//
//  RPSMatch.swift
//  Roshambo
//
//  Created by Ken Hom on 10/6/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import Foundation

struct RPSMatch {
    
    // MARK: Properties
    
    let p1: RPS
    let p2: RPS
    
    // MARK: Initializer
    
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    // MARK: Computed Properties
    
    var winner: RPS {
        return p1.defeats(opponent: p2) ? p1 : p2
    }
    
    var loser: RPS {
        return p1.defeats(opponent: p2) ? p2 : p1
    }
}
