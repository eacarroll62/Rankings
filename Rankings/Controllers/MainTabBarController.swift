//
//  MainTabBarController.swift
//  Rankings
//
//  Created by Eric Carroll on 5/18/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    let home = MainCoordinator(navigationController: UINavigationController())
    let conference = ConferenceCoordinator(navigationController: UINavigationController())
    let schedule = ScheduleCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        home.start()
        conference.start()
        schedule.start()
        viewControllers = [home.navigationController, conference.navigationController, schedule.navigationController]
        
    }
}
