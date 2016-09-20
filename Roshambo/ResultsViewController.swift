//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Hom, Kenneth on 9/20/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var resultsText: String?
    
    @IBOutlet weak var imageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let resultsText = resultsText {
            imageLabel.text = resultsText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
