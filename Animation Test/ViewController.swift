//
//  ViewController.swift
//  Animation Test
//
//  Created by Ameed Sayeh on 6/15/20.
//  Copyright © 2020 Ameed Sayeh. All rights reserved.
//

import UIKit

struct Task {
    var title:String
    var subTitle:String
    var imageName: String
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data: [Task] = [
        Task(title: "Track Weight", subTitle: "Enter your weight", imageName: "weight"),
        Task(title: "Track Sleep", subTitle: "Enter your Sleep hours", imageName: "sleep"),
        Task(title: "Track Steps", subTitle: "Enter the number of steps", imageName: "steps"),
        Task(title: "Track Exercise", subTitle: "Enter your burnt calories", imageName: "exercise"),
        Task(title: "Track Measurements", subTitle: "Enter your Body Measurements", imageName: "measurements")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        tableView.register(UINib(nibName: "FooterCell", bundle: nil), forCellReuseIdentifier: "FooterCell")
        
        tableView.backgroundColor = .clear
        tableView.separatorInset = .zero
        tableView.separatorColor = .clear
        
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        tableView.reloadData()
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        self.tableView.beginUpdates()
        self.tableView.moveRow(at: IndexPath(row: 1, section: 0), to: IndexPath(row: 5, section: 0))
        self.tableView.endUpdates()
        /*
        let element = self.data.randomElement()
        self.data.insert(element!, at: 0)
        let indexPath = IndexPath(row: 1, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .middle)
         */

    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
            
        } else if indexPath.row == (data.count + 1) {
            cell = tableView.dequeueReusableCell(withIdentifier: "FooterCell") as! FooterCell
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
            (cell as? TaskCell)?.setup(with: self.data[indexPath.row - 1])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 || indexPath.row == self.data.count + 1 {
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
}
