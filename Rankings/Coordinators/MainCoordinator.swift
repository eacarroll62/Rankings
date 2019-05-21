//
//  MainCoordinator.swift
//  Rankings
//
//  Created by Eric Carroll on 5/7/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let viewController = ViewController.instantiate()
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        if let detailViewController = fromViewController as? DetailViewController {
            childDidFinish(detailViewController.coordinator)
        }
        
        if let scheduleViewController = fromViewController as? ScheduleViewController {
            childDidFinish(scheduleViewController.coordinator)
        }
        
        if let conferenceViewController = fromViewController as? ConferenceViewController {
            childDidFinish(conferenceViewController.coordinator)
        }
        
        if let wikiViewController = fromViewController as? WikiViewController {
            childDidFinish(wikiViewController.coordinator)
        }
    }
/*
    func showDetails(results: [Statistics], position: Int) {
        let child = DetailCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.configureViewController(result: results, row: position)
        child.start()
    }
*/
    func showDetails(row: Int) {
        let child = DetailCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.configureViewController(row: row)
        child.start()
    }
    
    func showSchedule(row: Int) {
        let child = ScheduleCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.configureViewController(row: row)
        child.start()
    }
    
    func showTeamFromConference(row: Int) {
        let child = DetailCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.configureViewController(row: row)
        child.start()
    }
    
    func addConferenceCoordinator() {
        let child = ConferenceCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
//        child.start()
    }
    
    func requestInfo(schoolName: String) {
        let child = WikiCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.configureViewController(schoolName: schoolName)
        child.start()
    }
}
