//
//  ConferenceViewController.swift
//  Rankings
//
//  Created by Eric Carroll on 5/18/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class ConferenceViewController: UITableViewController, Storyboarded {
    weak var coordinator: ConferenceCoordinator?
    var row: Int?
    var listOfConferences: [String]?
    var tableViewData = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfConferences = conferences.map {$0.Conference}.removingDuplicates().sorted()
        for i in 0..<listOfConferences!.count {
            tableViewData.append(CellData(isOpened: false, title: listOfConferences![i], sectionData: conferences.filter {$0.Conference == listOfConferences![i]}.map {$0.School}))
        }
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Division III Football Conferences"
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return listOfConferences!.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].isOpened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].isOpened == true {
                tableViewData[indexPath.section].isOpened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableViewData[indexPath.section].isOpened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        } else {
            coordinator?.parentCoordinator?.addConferenceCoordinator()
            coordinator?.parentCoordinator?.requestInfo(schoolName: "Franklin College")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
                let labelAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
                let labelString = NSAttributedString(string: tableViewData[indexPath.section].title, attributes: labelAttributes)
                cell.textLabel?.attributedText = labelString
                cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
                let labelAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
                let labelString = NSAttributedString(string: tableViewData[indexPath.section].sectionData[indexPath.row - 1], attributes: labelAttributes)
                cell.textLabel?.attributedText = labelString
                cell.textLabel?.text = "     " + tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
}
