//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Hom, Kenneth on 9/20/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {    
    enum MoveChoice: Int {case rock = 0, paper, scissors}
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // computer moves
        let computerChoice = generateRandomSelection()
        
        // declare the controller
        let controller = segue.destination as! ResultsViewController
        
        if segue.identifier == "playPaper" {
            // set labels and image
            controller.movesText = "You played paper.\nComputer played \(computerChoice)."
            switch computerChoice {
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
            controller.movesText = "You played scissors.\nComputer played \(computerChoice)."
            switch computerChoice {
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
    
    private func generateRandomSelection() -> MoveChoice {
        let random = Int(arc4random() % 3)
        return MoveChoice(rawValue: random)!
    }
    
    @IBAction func playRock(_ sender: UIButton) {
        // computer moves
        let computerChoice = generateRandomSelection()
        
        // declare the controller
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        // set labels and image
        controller.movesText = "You played rock.\nComputer played \(computerChoice)."
        switch computerChoice {
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
        // present the view controller
        present(controller, animated: true, completion: nil)
    }
    

    @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "playPaper", sender: self)
    }
}

