//
//  Router.swift
//  GitHubTestProject
//
//  Created by Asmins on 17.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation
import UIKit

enum ViewControllers {
    case reposotoryViewController
}

class Router {

    fileprivate let storyboard = UIStoryboard(name: "Main", bundle: nil)

    func openViewController(_ type: ViewControllers) -> UIViewController {
        switch type {
        case .reposotoryViewController :
            return storyboard.instantiateViewController(withIdentifier: "reposViewController") as! RepositoriesViewController
        default:
            print("Error")
        }
    }
}
