//
//  AlertController.swift
//  GitHubTestProject
//
//  Created by Asmins on 17.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {

    func alertControllerWith(_ title: String, message: String) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(okButton)
        return controller
    }
    
}
