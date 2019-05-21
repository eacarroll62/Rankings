//
//  WikiViewController.swift
//  Rankings
//
//  Created by Eric Carroll on 5/19/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, Storyboarded {
    weak var coordinator: WikiCoordinator?
    
    @IBOutlet weak var wikiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
