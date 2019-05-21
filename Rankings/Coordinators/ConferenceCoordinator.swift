//
//  ConferenceCoordinator.swift
//  Rankings
//
//  Created by Eric Carroll on 5/18/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class ConferenceCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let viewController: ConferenceViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        viewController = ConferenceViewController.instantiate()
    }
    
    func start() {
        viewController!.coordinator = self
        viewController!.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        navigationController.pushViewController(viewController!, animated: true)
    }
    
    func configureViewController(row: Int) {
        //        vc!.result = results
        viewController!.row = row + 1
    }
}
