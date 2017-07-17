
//
//  IssuesViewController.swift
//  GitHubTestProject
//
//  Created by Asmins on 17.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

class IssuesViewController: UIViewController {

    let viewModel = FactoryViewModel().createViewModel(.issues) as! IssuesViewModel

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingView()
    }

    private func settingView() {
        self.title = "Issues"
        self.navigationController!.navigationBar.topItem!.title = "Back"
        self.navigationController!.navigationBar.tintColor = UIColor.black
        self.tableView.registerCell("IssuesTableViewCell", identifier: "issuesTableViewCell")

        let addNewIssuesButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addNewIssues))
        navigationItem.rightBarButtonItem = addNewIssuesButton

    }

    @objc fileprivate func addNewIssues() {

    }
}

extension IssuesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.viewModel.tableView(tableView, cellForRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.tableView(tableView, numberOfRowsInSection: section)
    }
}

extension IssuesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }

}
