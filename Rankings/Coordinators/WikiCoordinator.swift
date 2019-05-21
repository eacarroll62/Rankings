//
//  WikiCoordinator.swift
//  Rankings
//
//  Created by Eric Carroll on 5/19/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class WikiCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let viewController: WikiViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        viewController = WikiViewController.instantiate()
    }
    
    func start() {
        viewController!.coordinator = self
        navigationController.pushViewController(viewController!, animated: true)
    }
    
    func configureViewController(schoolName: String) {
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts",
            "exintro" : "",
            "explaintext" : "",
            "titles" : schoolName,
            "indexpageids" : "",
            "redirects" : "1",
        ]
        
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                self.viewController?.wikiLabel.text = "Franklin College"
            }
        }
    }
}
