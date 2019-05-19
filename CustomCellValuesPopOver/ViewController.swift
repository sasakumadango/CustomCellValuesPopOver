// 
//  ViewController.swift
//  CustomCellValuesPopOver
//
//  Created by Yuta S. on 2019/05/19.
//  Copyright © 2019 Yuta S. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController {
    
    var popButtonTextList: [String] = [String](repeating: "-", count: 50)
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedButton(_ sender: CustomCellPopButton) {
        let contentVC = PopOverTableViewController()
        contentVC.popHandler = { [unowned self] value in
            sender.setTitle(value, for: .normal)
            self.popButtonTextList[sender.tag] = value
        }
        contentVC.modalPresentationStyle = .popover
        contentVC.preferredContentSize = CGSize(width: 50, height: 130)
        contentVC.popoverPresentationController?.sourceView = tableView
        let y = sender.cellRect.midY
        contentVC.popoverPresentationController?.sourceRect = CGRect(x: sender.frame.minX, y: y, width: sender.frame.width, height: sender.frame.height)
        contentVC.popoverPresentationController?.permittedArrowDirections = [.up, .down]
        contentVC.popoverPresentationController?.delegate = self
        present(contentVC, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    // iPhoneで表示させる場合に必要
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popButtonTextList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.customLavel.text = "row: \(indexPath.row)"
        cell.customButton.tag = indexPath.row
        cell.customButton.setTitle(popButtonTextList[indexPath.row], for: .normal)
        let cellRect = tableView.rectForRow(at: indexPath)
        cell.customButton.cellRect = cellRect
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("indexPath: \(indexPath)")
    }
}
