//
//  ViewController.swift
//  wayFarer
//
//  Created by Mats Hammarqvist on 2018-01-07.
//  Copyright © 2018 Mats Hammarqvist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnApa(_ sender: Any) {
        
        
        // TODO: make a better function to read network of towns
        let myHometown = townNode(cityName: "Oskarshamn", connectedTo: ["Mönsterås":3, "Västervik":7,"Kristdala":3]) //(cityName: "Oskarshamn", connectedTo: ["Mönsterås":3, "Västervik":7,"Kristdala":3])
        let myHometown1 = townNode(cityName: "Nybro", connectedTo: ["Kalmar":3, "Hultsfred":7,"Orrefors":3]) //(cityName: "Oskarshamn", connectedTo: ["Mönsterås":3, "Västervik":7,"Kristdala":3])
        let myHometown2 = townNode(cityName: "Kalmar", connectedTo: ["Mönsterås":3, "Nybro":3,"Hultsfred":7]) //(cityName: "Oskarshamn", connectedTo: ["Mönsterås":3, "Västervik":7,"Kristdala":3])
        let myHometown3 = townNode(cityName: "Västervik", connectedTo: ["Hultsfred":3, "Oskarshamn":7]) //(cityName: "Oskarshamn", connectedTo: ["Mönsterås":3, "Västervik":7,"Kristdala":3])
        let myHometown4 = townNode(cityName: "Kristdala", connectedTo: ["Hultsfred":3, "Oskarshamn":3]) //(cityName: "Oskarshamn", connectedTo: ["Mönsterås":3, "Västervik":7,"Kristdala":3])
        let myHometown5 = townNode(cityName: "Mönsterås", connectedTo: ["Oskarshamn":3, "Kalmar":4]) //(cityName: "Oskarshamn", connectedTo: ["Mönsterås":3, "Västervik":7,"Kristdala":3])
        let myHometown6 = townNode(cityName: "Hultsfred", connectedTo: ["Nybro":3,"Kristdala":3, "Västervik":3]) //(cityName: "Oskarshamn", connectedTo: ["Mönsterås":3, "Västervik":7,"Kristdala":3])
        let test = townNode(cityName: "Orrefors", connectedTo: ["Nybro":3])
        
        
        // MARK: mapNetworkCreation
        var myMap = Set<townNode>()
        
        myMap.insert(myHometown)
        myMap.insert(myHometown1)
        myMap.insert(myHometown2)
        myMap.insert(myHometown3)
        myMap.insert(myHometown4)
        myMap.insert(myHometown5)
        myMap.insert(myHometown6)
        myMap.insert(test)
        
        // myMap.remove(MyDestination)
        
        print(GraphSearch(myMap: myMap, startIn: "Västervik", lookFor: "Orrefors"))
        
        
    }
    
}

