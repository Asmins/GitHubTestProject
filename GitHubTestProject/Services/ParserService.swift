//
//  ParserService.swift
//  GitHubTestProject
//
//  Created by Asmins on 16.07.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol TransferResult: class {
    func transferResult(_ repositories: [Repository])
    func transferListIssues(_ issues: [Issues])
}

class ParserService {

    weak var delegate: TransferResult?

    private static var instance: ParserService?
    private init() {}

    static let sharedInstance: ParserService = {
        if instance == nil {
            instance = ParserService()
        }
        return instance!
    }()

    func parseRepositoryiesData(_ data: Data) {
        let json = JSON(data: data)
        var repositories = [Repository]()
        for i in 0..<json.count {
            let repository = Repository()
            repository.name = json[i]["name"].stringValue
            repository.open_issues = json[i]["open_issues"].intValue
            repository.language = json[i]["language"].stringValue
            repositories.append(repository)
        }
        self.delegate?.transferResult(repositories)
    }

    func parseListIssues(_ data: Data) {
        let json = JSON(data: data)
        var arrayIssues = [Issues]()
        for i in 0..<json.count {
            let issues = Issues()
            issues.author = json[i]["user"]["login"].stringValue
            issues.title = json[i]["title"].stringValue
            issues.state = json[i]["state"].stringValue
            issues.comments = json[i]["comments"].intValue
            issues.body = json[i]["body"].stringValue
            arrayIssues.append(issues)
        }

        if arrayIssues.count != 0 {
            self.delegate?.transferListIssues(arrayIssues)
        } else {
            self.delegate?.transferListIssues([Issues]())
        }
    }
}
