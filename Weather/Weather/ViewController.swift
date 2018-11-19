//
//  ViewController.swift
//  Weather
//
//  Created by osama on 11/18/18.
//  Copyright © 2018 osama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var viewModel:WeatherViewModel!
    @IBAction func onGetTemperature(_ sender: Any) {
        print("dasdasdsa")
        viewModel = WeatherViewModel()
        viewModel.getWeather(place: searchTextField.text!) { temp in
            DispatchQueue.main.async {
                self.resultLabel.text = String( temp)
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

