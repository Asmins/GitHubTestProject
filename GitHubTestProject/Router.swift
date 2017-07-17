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
    case issuesViewController
}

class Router {

    fileprivate let storyboard = UIStoryboard(name: "Main", bundle: nil)

    func openViewController(_ type: ViewControllers) -> UIViewController {
        switch type {
        case .reposotoryViewController :
            return storyboard.instantiateViewController(withIdentifier: "reposViewController") as! RepositoriesViewController

        case .issuesViewController:
            return storyboard.instantiateViewController(withIdentifier: "issuesViewController") as! IssuesViewController
        default:
            print("Error")
        }
    }
}
