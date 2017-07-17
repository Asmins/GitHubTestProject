
//
//  FactoryViewModels.swift
//  GitHubTestProject
//
//  Created by Asmins on 16.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation

enum TypeViewModel {
    case home
    case repositories
    case issues
}

class FactoryViewModel {

    func createViewModel(_ typeViewModel: TypeViewModel) -> ViewModel {
        switch typeViewModel {
        case .home:
            return HomeViewModel()
        case .repositories:
            return RepositoriesViewModel()
//        case .issues:
//        Must to create issuesModel
        default:
            print("Error")
        }
    }

}
