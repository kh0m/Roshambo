//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Hom, Kenneth on 9/20/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    // MARK: Properties
    
    var match: RPSMatch!
    var history = [RPSMatch]()
    
    // MARK: Outlets
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    
    // MARK: Actions
    
    @IBAction func makeYourMove(sender: UIButton) {
        
        // The RPS enum holds a player's move
        switch (sender) {
        case self.rockButton:
            throwDown(RPS.rock)
            
        case self.paperButton:
            throwDown(RPS.paper)
            
        case self.scissorsButton:
            throwDown(RPS.scissors)
            
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    
    
    
    // MARK: Play!
    
    func throwDown(_ playersMove: RPS) {
        // The RPS enum generates the opponent's move
        let computerChoice = RPS()
        
        // The RPSMatch struct stores the results of a match
        self.match = RPSMatch(p1: playersMove, p2: computerChoice)
        
        // Here we add a match to the history array.
        history.append(match)
        
        //Here are the 3 ways of presenting a View Controller
        
        // 1st Way: Programmatic View Controller Presentation
        if (playersMove == RPS.rock) {
            // Get the storyboard and ResultViewController
            let storyboard = UIStoryboard (name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            
            // set labels and image
            controller.movesText = "You played \(self.match.p1).\nComputer played \(self.match.p2)."
            
            switch self.match.p2 {
            case .rock:
                controller.resultsText = "It's a tie!"
                controller.image = #imageLiteral(resourceName: "itsATie")
            case .paper:
                controller.resultsText = "Paper covers rock! You lose!"
                controller.image = #imageLiteral(resourceName: "PaperCoversRock")
            case .scissors:
                controller.resultsText = "Rock crushes scissors! You win!"
                controller.image = #imageLiteral(resourceName: "RockCrushesScissors")
            }

            
            self.present(controller, animated: true, completion: nil)
        }
            
            // 2nd Way: Code plus Segue
        else if (playersMove == RPS.paper) {
            performSegue(withIdentifier: "playPaper", sender: self)
        }
        
        // 3rd Way: Segue Only, No code!
        // But don't forget to implement prepareForSegue.
    }
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! ResultsViewController
        
        controller.movesText = "You played \(self.match.p1).\nComputer played \(self.match.p2)."
        
        if segue.identifier == "playPaper" {
            // set labels and image
            switch self.match.p2 {
            case .rock:
                controller.resultsText = "Paper covers rock! You win!"
                controller.image = #imageLiteral(resourceName: "PaperCoversRock")
            case .paper:
                controller.resultsText = "It's a tie!"
                controller.image = #imageLiteral(resourceName: "itsATie")
            case .scissors:
                controller.resultsText = "Scissors cut paper! You lose!"
                controller.image = #imageLiteral(resourceName: "ScissorsCutPaper")
            }
            
        } else if segue.identifier == "playScissors" {
            // set labels and image
            switch self.match.p2 {
            case .rock:
                controller.resultsText = "Rock crushes scissors! You lose!"
                controller.image = #imageLiteral(resourceName: "RockCrushesScissors")
            case .paper:
                controller.resultsText = "Scissors cut paper! You win!"
                controller.image = #imageLiteral(resourceName: "ScissorsCutPaper")
            case .scissors:
                controller.resultsText = "It's a tie!"
                controller.image = #imageLiteral(resourceName: "itsATie")
            }
        }
    }
}

