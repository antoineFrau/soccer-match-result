//
//  ViewController.swift
//  FootResultat
//
//  Created by Antoine Frau on 13/11/2019.
//  Copyright © 2019 Antoine Frau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var safeArea: UILayoutGuide!
    
    var result: Result?
    private var mainConstraints: [NSLayoutConstraint] = []
    private var metrics: [String: CGFloat]?
    private var views = [String: Any]()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        if let path = Bundle.main.path(forResource: "scb_resultats", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as![String:Any]
                result = Result(json: jsonResult)
            } catch let error as NSError  {
                print(error)
            }
        }
        tableView.dataSource = self
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 60
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(MatchTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (result?.matchList.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MatchTableViewCell
        cell.imgDom.image = getImageByName(name: result?.matchList[indexPath.row].dom_logo_name)
        cell.nameDom.text = result?.matchList[indexPath.row].dom_name
        
        cell.imgExt.image = getImageByName(name: result?.matchList[indexPath.row].ext_logo_name)
        cell.nameExt.text = result?.matchList[indexPath.row].ext_name
        
        cell.date.text = result?.matchList[indexPath.row].date
        let score = result?.matchList[indexPath.row].score
        cell.score.text = score == "" ? " - " : score
        
        return cell
    }
    
    func getImageByName(name: String?) -> UIImage {
        var logoName = name ?? "logo_unknown.png"
        if logoName.isEmpty || logoName == "" {
            logoName = "logo_unknown.png"
        }
        return UIImage(named: logoName)!
    }
    
}
