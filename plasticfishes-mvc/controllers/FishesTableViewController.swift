//
//  FishesTableViewController.swift
//  plasticfishes-mvc
//
//  Created by Luis Ezcurdia on 9/21/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

class FishesTableViewController: UITableViewController {
    var fishes = [Fish]()
    let cellId = "fishCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fishes"
        fishes = FishService.list_all()
        tableView.register(UINib(nibName: "FishesTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(74)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fishes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FishesTableViewCell
        
        let fish = fishes[indexPath.row]
        cell.titleFish.text = fish.name
        cell.descriptioFish.text = fish.webUrlString
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
