// 
//  PopOverTableViewController.swift
//  CustomCellValuesPopOver
//
//  Created by Yuta S. on 2019/05/19.
//  Copyright © 2019 Yuta S. All rights reserved.
//
//

import UIKit

class PopOverTableViewController: UITableViewController {
    
    let values = ["0", "1", "2"]
    
    var popHandler: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.showsVerticalScrollIndicator = false
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()//tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        cell.textLabel?.text = values[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let handler = self.popHandler {
            handler(values[indexPath.row])
        }
        self.dismiss(animated: true)
    }
}
