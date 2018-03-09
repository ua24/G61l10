//
//  GoodsTVC.swift
//  G61l10
//
//  Created by Ivan Vasilevich on 3/9/18.
//  Copyright © 2018 RockSoft. All rights reserved.
//

import UIKit
import Parse

class GoodsTVC: UITableViewController {
	
	var goods = [PFObject]()

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		fetchData()
	}
	
	func fetchData() {
		
		let query = PFQuery(className: "Watch")
		
		query.whereKey("price", greaterThan: 400)
		
		query.findObjectsInBackground { (objects, error) in
			if let goods = objects {
				self.goods = goods
				self.tableView.reloadData()
			}
		}
	}

	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return goods.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goodCell", for: indexPath)

		let good = goods[indexPath.row]
        // Configure the cell...
		cell.textLabel?.text = good["name"] as? String ?? "NIXERA"
		cell.detailTextLabel?.text = "$" + (good["price"] as? Int ?? 1000).description 

        return cell
    }
	

}
