//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Hom, Kenneth on 9/20/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    enum ComputerMove: Int {case rock = 0, paper, scissors}

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultsViewController
        
        if segue.identifier == "playPaper" {
            controller.resultsText = "You played paper!"
        } else if segue.identifier == "playScissors" {
            controller.resultsText = "You played scissors!"
        }
    }
    
    private func generateRandomSelection() -> ComputerMove {
        let random = Int(arc4random() % 3)
        return ComputerMove(rawValue: random)!
    }
    
    @IBAction func playRock(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        controller.resultsText = "You played rock!"
        present(controller, animated: true, completion: nil)
    }
    

    @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "playPaper", sender: self)
    }
}

