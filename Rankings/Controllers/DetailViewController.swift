//
//  DetailViewController.swift
//  Rankings
//
//  Created by Eric Carroll on 5/6/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController, Storyboarded {
    weak var coordinator: DetailCoordinator?
//    var result: [Statistics] = [Statistics]()
//    var data: Stats?
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
/*
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinish()
    }
*/
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Team Record"
        } else {
            return "Scoring"
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data: Stats = Stats(result: results)
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 3
        formatter.minimumIntegerDigits = 1
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "games", for: indexPath)
            
            let gamesWonHome = data.getNumberOfGames(win: true, position: row!, locale: Location.home.rawValue)
            let gamesWonAway = data.getNumberOfGames(win: true, position: row!, locale: Location.away.rawValue)
            let gamesLostHome = data.getNumberOfGames(win: false, position: row!, locale: Location.home.rawValue)
            let gamesLostAway = data.getNumberOfGames(win: false, position: row!, locale: Location.away.rawValue)
            let gamesWon = gamesWonHome + gamesWonAway
            let gamesLost = gamesLostHome + gamesLostAway
            
            let winPct = formatter.string(from: NSNumber(value: Double(gamesWon)/Double(gamesWon + gamesLost)))
            
            cell.textLabel?.text = "W-L: \(gamesWon)-\(gamesLost) (H: \(gamesWonHome)-\(gamesLostHome)  A: \(gamesWonAway)-\(gamesLostAway))    Pct: \(winPct!)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "points", for: indexPath)
            
            let pointsForWin = results.filter {$0.Team1ID == row! + 1}.map {$0.Team1Score}.reduce(0, +)
            let pointsForLose = results.filter {$0.Team2ID == row! + 1}.map {$0.Team2Score}.reduce(0, +)
            let pointsFor = pointsForWin + pointsForLose
            
            let pointsAgainstWin = results.filter {$0.Team1ID == row! + 1}.map {$0.Team2Score}.reduce(0, +)
            let pointsAgainstLose = results.filter {$0.Team2ID == row! + 1}.map {$0.Team1Score}.reduce(0, +)
            let pointsAgainst = pointsAgainstWin + pointsAgainstLose
            
            let pointsForWinHome = results.filter {$0.Team1ID == row! + 1 && $0.Team1Ad == 1}.map {$0.Team1Score}.reduce(0, +)
            let pointsForLoseHome = results.filter {$0.Team2ID == row! + 1 && $0.Team2Ad == 1}.map {$0.Team2Score}.reduce(0, +)
            let pointsForHome = pointsForWinHome + pointsForLoseHome
            
            let pointsAgainstWinHome = results.filter {$0.Team1ID == row! + 1 && $0.Team1Ad == 1}.map {$0.Team2Score}.reduce(0, +)
            let pointsAgainstLoseHome = results.filter {$0.Team2ID == row! + 1 && $0.Team2Ad == 1}.map {$0.Team1Score}.reduce(0, +)
            let pointsAgainstHome = pointsAgainstWinHome + pointsAgainstLoseHome
            
            let pointsForWinAway = results.filter {$0.Team1ID == row! + 1 && $0.Team1Ad == -1}.map {$0.Team1Score}.reduce(0, +)
            let pointsForLoseAway = results.filter {$0.Team2ID == row! + 1 && $0.Team2Ad == -1}.map {$0.Team2Score}.reduce(0, +)
            let pointsForAway = pointsForWinAway + pointsForLoseAway
            
            let pointsAgainstWinAway = results.filter {$0.Team1ID == row! + 1 && $0.Team1Ad == -1}.map {$0.Team2Score}.reduce(0, +)
            let pointsAgainstLoseAway = results.filter {$0.Team2ID == row! + 1 && $0.Team2Ad == -1}.map {$0.Team1Score}.reduce(0, +)
            let pointsAgainstAway = pointsAgainstWinAway + pointsAgainstLoseAway
            
            cell.textLabel?.text = "PF-PA: \(pointsFor)-\(pointsAgainst) H: \(pointsForHome)-\(pointsAgainstHome) A: \(pointsForAway)-\(pointsAgainstAway)"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.parentCoordinator?.showSchedule(row: row!)
    }
}


