//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Ken Hom on 10/6/16.
//  Copyright © 2016 Hom, Kenneth. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    var history: [RPSMatch]?
    
    // MARK: Private Methods
    
    private func generateWinText(match: RPSMatch) -> String {
        if match.p1 == match.p2 {
            return "Tie!"
        } else {
            return match.winner == match.p1 ? "Win!" : "Lose."
        }
    }
    
    // MARK: Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let history = history else {
            return 0
        }
        
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // set table view's data source
        tableView.dataSource = self
        
        // dequeue and decorate the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let match = history?[indexPath.row]
        cell.textLabel?.text = generateWinText(match: match!)
        cell.detailTextLabel?.text = match!.p1.description + " vs. " + match!.p2.description
        return cell
    }
    
    // MARK: Actions
    
    @IBAction func dismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
