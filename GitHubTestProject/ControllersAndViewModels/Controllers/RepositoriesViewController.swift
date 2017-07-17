//
//  RepositoriesViewController.swift
//  GitHubTestProject
//
//  Created by Asmins on 16.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {

    var viewModel = FactoryViewModel().createViewModel(.repositories) as? RepositoriesViewModel

    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }

    private func setupView() {
        self.viewModel?.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Repository"
        self.tableView.registerCell("ReposTableViewCell", identifier: "repositoryTableViewCell")
    }

}

extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (self.viewModel?.tableView(tableView, cellForRowAt: indexPath))!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.viewModel?.tableView(tableView, numberOfRowsInSection: section))!
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! ReposTableViewCell
        tableView.deselectRow(at: indexPath, animated: true)
        self.viewModel?.getListIssues(selectedCell.nameRepositoryLabel.text!)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension RepositoriesViewController: RepositoryActionViewController {
    func showAlertWith(_ title: String, message: String) {
        let alertController = UIAlertController().alertControllerWith(title, message: message)
        self.present(alertController, animated: true, completion: nil)
    }

    func openIssuesViewController(_ issues: [Issues]) {
        let controller = Router().openViewController(.issuesViewController) as! IssuesViewController
        controller.viewModel.getListIssues(issues)
        self.navigationController?.show(controller, sender: self)
    }
}
