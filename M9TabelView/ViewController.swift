//
//  ViewController.swift
//  M9TabelView
//
//  Created by Faesy, Bradley C. on 4/2/26.


//  indexPath.Cell
//  indexPath.Section
//  Dalegate Pattern: One object allows another object to handle some of it's task
//  1.) Datat Source: Get data
//  2.) Delegate: Responce to user actions

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print ("#1.) ", #function)
		return 100
	}
	// Called repeatedly
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		print ("#1.) ", #function, indexPath)
		
		// #1.) Get or reuse a cell
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		// #2.) Put data into the cell
		if indexPath.row < 19 {
			cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row)"
		}
		
		// #3.)Return the cell
		return cell
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
}
