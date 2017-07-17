//
//  IssuesViewModel.swift
//  GitHubTestProject
//
//  Created by Asmins on 17.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation
import UIKit

class IssuesViewModel: ViewModel {

    fileprivate var issues: [Issues]!

    func getListIssues(_ issues: [Issues]) {
        self.issues = issues
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "issuesTableViewCell", for: indexPath) as! IssuesTableViewCell
        cell.settingCell(issues[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
}
