//
//  ViewController.swift
//  bitCoin exchange
//
//  Created by George Livas on 04/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import UIKit
// import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var currencyInput: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyImg: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var currencySelector: UISegmentedControl!
    
    
    // let urlString = URL(string: "https://api.cryptonator.com/api/ticker/btc-usd")
   
    
//    func makeGetCallWithAlamofire() {
//        let todoEndpoint: String = "https://api.cryptonator.com/api/ticker/btc-usd"
//        Alamofire.request(todoEndpoint)
//            .responseJSON { response in
//                // check for errors
//                guard response.result.error == nil else {
//                    // got an error in getting the data, need to handle it
//                    print("error calling GET on /todos/1")
//                    print(response.result.error!)
//                    return
//                }
//
//                // make sure we got some JSON since that's what we expect
//                guard let json = response.result.value as? [String: Any] else {
//                    print("didn't get todo object as JSON from API")
//                    if let error = response.result.error {
//                        print("Error: \(error)")
//                    }
//                    return
//                }
//
//                // get and print the title
//                guard let todoTitle = json["title"] as? String else {
//                    print("Could not get todo title from JSON")
//                    return
//                }
//                print("The title is: " + todoTitle)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let rates : [String: Double] = [
        "usd": 0.00015,
        "eur": 0.00017,
        "gbp": 0.00020
        
    ]
    
    var currency = "usd"
    
    func calculate() {
        guard let billAmountText = self.currencyInput.text,
            let billAmount = Double(billAmountText) else {
                return
        }
        let rate = rates[currency]
        
        outputLabel.text = String(billAmount * rate!)
    }
    
    @IBAction func changeAmount(_ sender: UITextField) {
        calculate()
    }
    
    
    @IBAction func currencyChanged(_ sender: UISegmentedControl) {
        
        switch currencySelector.selectedSegmentIndex {
        case 0:
            currency = "usd"
            currencyLabel.text = "USD"
            currencyInput.placeholder = "$0.00"
            currencyImg.image = UIImage(named: "usd")

            calculate()
        case 1:
            currency = "eur"
            currencyLabel.text = "EUR"
            currencyInput.placeholder = "€0.00"
            currencyImg.image = UIImage(named: "eur")
            
            calculate()
        case 2:
            currency = "gbp"
            currencyLabel.text = "GBP"
            currencyInput.placeholder = "£0.00"
            currencyImg.image = UIImage(named: "gbp")

            calculate()
        default:
            currency = "usd"
            currencyLabel.text = "USD"
            currencyInput.placeholder = "$0.00"
            currencyImg.image = UIImage(named: "usd")

            calculate()
        }
    }
}

