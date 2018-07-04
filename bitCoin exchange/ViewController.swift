//
//  ViewController.swift
//  bitCoin exchange
//
//  Created by George Livas on 04/07/2018.
//  Copyright © 2018 George Livas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyInput: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyImg: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var currencySelector: UISegmentedControl!
    
    let apiURL = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD")
    
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
    
//    guard let data = data, error == nil else {
//    completion(nil)
//    print(error?.localizedDescription ?? "")
//    return
//    }
    
    
//    do {
//    guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
//    let value = json["USD"] as? NSNumber else {
//    completion(nil)
//    return
//    }
//    completion(value)
//    } catch {
//    completion(nil)
//    print(error.localizedDescription)
//    }
//
}

