//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Hom, Kenneth on 9/20/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var movesText: String?
    var resultsText: String?
    var image: UIImage?
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
