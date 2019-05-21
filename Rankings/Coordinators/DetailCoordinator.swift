//
//  DetailCoordinator.swift
//  Rankings
//
//  Created by Eric Carroll on 5/10/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class DetailCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let viewController: DetailViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        viewController = DetailViewController.instantiate()
    }
    
    func start() {
        viewController?.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        viewController!.coordinator = self
        navigationController.pushViewController(viewController!, animated: true)
    }
/*
    func configureViewController(result: [Statistics], row: Int) {
        vc!.result = result
        vc!.row = row
    }
*/
    func configureViewController(row: Int) {
 //       vc!.results = results
        viewController!.row = row
    }
/*
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
 */
}
