//
//  RepositoriesViewModel.swift
//  GitHubTestProject
//
//  Created by Asmins on 16.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation
import UIKit

protocol RepositoryActionViewController : ActionFromViewController {
    func openIssuesViewController(_ issues: [Issues])
}

class RepositoriesViewModel: ViewModel {

    private let requestService = RequestService.sharedInstance
    private let parserService = ParserService.sharedInstance

    fileprivate var repositories = [Repository]()

    weak var delegate: RepositoryActionViewController?

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryTableViewCell", for: indexPath) as! ReposTableViewCell
        cell.settingCell(repositories[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func getListIssues(_ repositoryName: String) {
        let parameters: [String: Any] = ["state":"all"]

        self.requestService.getListIssues(repositoryName, parameters: parameters, headers: [:], result: {( data, error ) in
            if error == nil {
                self.parserService.parseListIssues(data!)
            } else {
                self.delegate?.showAlertWith("Error", message: (error?.localizedDescription)!)
            }
        })
    }

    func getData(_ repositories: [Repository]) {
        self.repositories = repositories
        self.parserService.delegateIssues = self
    }
}

extension RepositoriesViewModel: TransferListIssues {
    func transferListIssues(_ issues: [Issues]) {
        self.delegate?.openIssuesViewController(issues)
    }
}
