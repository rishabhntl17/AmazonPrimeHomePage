//
//  ViewController.swift
//  AmazonPrimeHomePage
//
//  Created by Appinventiv on 2/27/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 250
        }
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 0
        }
        else
        {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let views = UIView(frame: CGRect(x: 0, y: 0 , width: UIScreen.main.bounds.width, height: 20))
        let label = UILabel(frame: CGRect(x: 20, y: 20 , width: 300, height: 20))
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = label.font.withSize(22)
        if section == 1
        {
            label.text = "Watch Next TV and Movies"
        }
        if section == 2
        {
            label.text = "Latest Movies"
        }
        if section == 3
        {
            label.text = "Discover"
        }
        if section == 4
        {
            label.text = "Music"
        }
        if section == 5
        {
            label.text = "Favourites"
        }
        views.addSubview(label)
        return views
            }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "tvpagecell", for: indexPath) as! TVPageCell
            return cell
        }
        else if indexPath.section > 0
        {
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "tvwatchnextcell", for: indexPath) as! TVWatchNextCell
            cell.sec = indexPath.section
            return cell
        }
        return UITableViewCell()
    }
    
    
}

