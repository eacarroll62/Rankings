//
//  ResultViewController.swift
//  Rankings
//
//  Created by Eric Carroll on 5/8/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class ScheduleViewController: UITableViewController, Storyboarded {
    weak var coordinator: ScheduleCoordinator?
 //   var result: [Statistics] = [Statistics]()
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let team = conferences[row!-1]
        let name = team.Nickname + " Schedule"
        
        return name
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.filter( {$0.Team1ID == row || $0.Team2ID == row}).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schedule = results.filter( {$0.Team1ID == row! || $0.Team2ID == row!})
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "schedule", for: indexPath) as? ScheduleTableViewCell else { fatalError("Could not get TableView Cell") }
        
        let year = schedule[indexPath.row].DatePlayed.prefix(4)
        let month = String(schedule[indexPath.row].DatePlayed[4...5])
        let day = schedule[indexPath.row].DatePlayed.suffix(2)
        
        cell.oppLabel?.text = day + "-" + month + "-" + year
        
        if schedule[indexPath.row].Team1ID == row! {
            if schedule[indexPath.row].Team1Ad == 1 {
                cell.score1Label.text = String(schedule[indexPath.row].Team1Score)
                cell.score2Label.text = String(schedule[indexPath.row].Team2Score)
                cell.locationLabel.text = conferences.filter {$0.ID == schedule[indexPath.row].Team2ID}[0].School
            } else {
                cell.score1Label.text = String(schedule[indexPath.row].Team1Score)
                cell.score2Label.text = String(schedule[indexPath.row].Team2Score)
                cell.locationLabel.text = "At " + conferences.filter {$0.ID == schedule[indexPath.row].Team2ID}[0].School
            }
        } else if schedule[indexPath.row].Team2ID == row! {
            if schedule[indexPath.row].Team2Ad == 1 {
                cell.score1Label.text = String(schedule[indexPath.row].Team2Score)
                cell.score2Label.text = String(schedule[indexPath.row].Team1Score)
                cell.locationLabel.text = conferences.filter {$0.ID == schedule[indexPath.row].Team1ID}[0].School
            } else {
                cell.score1Label.text = String(schedule[indexPath.row].Team2Score)
                cell.score2Label.text = String(schedule[indexPath.row].Team1Score)
                cell.locationLabel.text = "At " + conferences.filter {$0.ID == schedule[indexPath.row].Team1ID}[0].School
            }
        }
        return cell
    }
}

