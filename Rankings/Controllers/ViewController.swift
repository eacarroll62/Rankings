//
//  TableViewController.swift
//  Rankings
//
//  Created by Eric Carroll on 5/6/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
//    var results = [Statistics]()
//    var teams = [Team]()
//    var conferences = [Conference]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        results = Bundle.main.decode([Statistics].self, from: "2019D3Football.json")
//        teams = Bundle.main.decode([Team].self, from: "2019D3Teams.json")
//        conferences = Bundle.main.decode([Conference].self, from: "D3Conferences.json")
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Alphabetical Listing of D3 Football Colleges"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        coordinator!.showDetails(results: results, position: indexPath.row)
        coordinator?.showDetails(row: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let team = conferences[indexPath.row]
        cell.textLabel?.text = String(team.ID) + ".  " + team.School + " " + team.Nickname
        cell.detailTextLabel?.text = team.Conference
        return cell
    }

    
}

