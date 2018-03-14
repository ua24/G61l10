//
//  ViewController.swift
//  G61l10
//
//  Created by Ivan Vasilevich on 3/9/18.
//  Copyright © 2018 RockSoft. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
	
	@IBOutlet weak var greenBox: UIView!
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		func showAnimation() {
			let touchPos = touches.first!.location(in: self.view)
//			UIView.animate(withDuration: 0.3) {
//
//			}
			
			
			UIView.transition(with: self.view, duration: 1, options: .transitionCrossDissolve, animations: {
				self.greenBox.center = touchPos
			}) { (finished) in
				if finished {
					self.greenBox.isHidden = !self.greenBox.isHidden
				}
			}
		}
		
		showAnimation()
		func parseCars() {
			do {
				let path = Bundle.main.path(forResource: "norms_2018-02-24", ofType: "txt")!
				let source = try String.init(contentsOfFile: path)
				var element = source.components(separatedBy: "\r\n").first!
				for _ in 0..<4 {
					element = element.replacingOccurrences(of: "  ", with: " ")
				}
				let elementsOfCar = element.components(separatedBy: " ")
				let articul = elementsOfCar[1]
				let position = elementsOfCar[2]
				let name = elementsOfCar[3]
				
				print(name, articul, position)
			}
			catch {
				print(error)
			}
			
			//try
			//documents dir
		}
//		addCar()
		parseCars()
	}
	
	func addWatch() {
		let myWathch = PFObject(className: "Watch")
		print("watch created")
		myWathch["name"] = "Ivan's casio watch"
		myWathch["price"] = 599
		myWathch["size"] = 12
		print("watch filled with data")
		myWathch.saveEventually { (success, error) in
			if success {
				print("successfuly saved watch")
			}
			else {
				print(error!)
			}
		}
		
		print("Ivan Vasilevich")
	}
	
	func addCar() {
		let myWathch = PFObject(className: "Car")
		
		myWathch["name"] = "Ivan's casio watch"
		myWathch["price"] = 599
		myWathch["size"] = 12
		print("watch filled with data")
		myWathch.saveEventually { (success, error) in
			if success {
				print("successfuly saved watch")
			}
			else {
				print(error!)
			}
		}
		
		print("Ivan Vasilevich")
	}

}

