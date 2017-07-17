//
//  HomeViewModel.swift
//  GitHubTestProject
//
//  Created by Asmins on 16.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation

protocol ActionFromViewController: class {
    func showAlertWith(_ title: String, message: String)
    func openRepostoriesView(_ repos: [Repository])
}

extension ActionFromViewController {
    func openRepostoriesView(_ repos: [Repository]) {}
}

class HomeViewModel: ViewModel {

    private let requestService = RequestService.sharedInstance
    private let parserService = ParserService.sharedInstance

    weak var delegate: ActionFromViewController?

    func getListRepositoriesFor(_ userName: String) {
        self.parserService.delegate = self

        if userName != "" || userName.characters.count >= 4 {
            self.requestService.getRepositoriesListFor(userName, parameters: [:], headers: [:], result: {(data, error) in
                UserDefaults.standard.set(userName, forKey: "userName")
                if data != nil {
                    self.parserService.parseRepositoryiesData(data!)
                } else {
                    self.delegate?.showAlertWith("Error", message: (error?.localizedDescription)!)
                }
            })
        } else {
            self.delegate?.showAlertWith("Error", message: "Short or empty name field")
        }
    }
}

extension HomeViewModel: TransferResult {
    func transferListIssues(_ issues: [Issues]) {
        /* I don`t know how do option method in protocol,sorry. Don`t work @objc + option */
    }

    func transferResult(_ repositories: [Repository]) {
        self.delegate?.openRepostoriesView(repositories)
    }
}
