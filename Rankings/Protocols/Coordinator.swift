//
//  Coordinator.swift
//  Rankings
//
//  Created by Eric Carroll on 5/7/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
