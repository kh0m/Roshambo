//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Hom, Kenneth on 9/20/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: Properties
    
    var movesText: String?
    var resultsText: String?
    var image: UIImage?
    var history: [RPSMatch]?
    
    // MARK: Outlets
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let movesText = movesText {
            movesLabel.text = movesText
        }
        if let resultsText = resultsText {
            resultsLabel.text = resultsText
        }
        
        imageView.image = image
    }

    @IBAction func playAgain(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHistory" {
            let destination = segue.destination as! HistoryViewController
            destination.history = history
        }
    }
    

}
