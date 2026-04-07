//
//  ViewController.swift
//  M9TabelView
//
//  Created by Faesy, Bradley C. on 4/2/26.

//indexPath.cell
//indexPath.section
//Delegate Pattern:
//one object allows another object to handle some of its task
//1) Datasource: get data
//2) Delegate: reponse to user actions

import UIKit

class ViewController: UIViewController {
	let fruits = ["Apple", "Banana", "Strawberry", "Mango", "Orange"]
	let vegetables = ["Carrot", "Tomato", "Broccoli", "Cabbage"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
}

extension ViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch indexPath.section {
		case 0:
			print("You selected \(fruits[indexPath.row])")
		case 1:
			print("You selected \(vegetables[indexPath.row])")
		default:
			break
		}
	}
}

extension ViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print("#1.",#function)
		switch section {
		case 0:
			return fruits.count
		case 1:
			return vegetables.count
		default:
			return 0
		}
	}
	//This method is called repeatedly
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		print("#1.", #function, indexPath)
		//#1. Get or reuse a cell
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		//#2. Put data into the cell
		switch indexPath.section {
		case 0:
			cell.textLabel?.text = fruits[indexPath.row]
		case 1:
			cell.textLabel?.text = vegetables[indexPath.row]
		default:
			break
		}
		
		//#3. Return the cell
		return cell //for a cell
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "Fruits"
		case 1:
			return "Vegetables"
		default:
			return nil
		}
	}
	
	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		switch section {
		case 0:
			return "\(fruits.count) fruits are good"
		case 1:
			return "\(vegetables.count) vegetables are good"
		default:
			return nil
		}

	}
}
