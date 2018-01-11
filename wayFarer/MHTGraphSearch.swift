//
//  File.swift
//  myTestHashable
//
//  Created by Mats Hammarqvist on 2018-01-10.
//  Copyright © 2018 Mats Hammarqvist. All rights reserved.
//

import Foundation


struct townNode: Hashable, Equatable{
    var cityName = ""
    var connectedTo = [String:Int]()
    var pathHierto = [String]()
    var totalCost = 0
    var geograficX: Int = 0
    var geograficY: Int = 0
    
    var hashValue: Int {
        get{return cityName.hashValue}
    }
    
    static func ==(lhs: townNode, rhs: townNode) -> Bool {
        return lhs.cityName == rhs.cityName
    }
    
    init (cityName:String, connectedTo:[String:Int] ){
        self.cityName = cityName
        self.connectedTo = connectedTo
    }
    
    init (cityName:String, connectedTo:[String:Int], geograficX:Int,geograficY:Int ){
        self.cityName = cityName
        self.connectedTo = connectedTo
        self.geograficX = geograficX
        self.geograficY = geograficY
    }
    
    init() {}
}

func GraphSearch(myMap:Set<townNode>, startIn: String, lookFor:String)-> [String]{
    
    var exploredNodes = Set<townNode>()
    var frontierSet = Set<townNode>()
    var foundGoal = false
    var foundStartInMap = false
    var foundGoalInMap = false
    var goalX = 0
    var goalY = 0
    
    //var path = [stadsNod]()
    var state = townNode()
    var currentPath = [String]()
    //var addToPath = ""
    var tempCost = 0
    
    
//lägg till startnod i frontier !!
    for stad in myMap {
                if stad.cityName == startIn {
                    frontierSet.insert(stad)
                    foundStartInMap = true
        }
                if stad.cityName == lookFor {
                   // frontierSet.insert(stad)
                    foundGoalInMap = true
                    goalX = stad.geograficX
                    goalY = stad.geograficY
        }
        
    }
    
//Trampa framåt tills frontier är tom eller vi hittat fram
    while !frontierSet.isEmpty && !foundGoal {
        
        // Hitta bästa punkt att titta närmare på
        var lowestCost = 0
        var firstTest = true
        var nodeToRemove = townNode()
        for frontierStd in frontierSet{
            let taxiDriverDistance = abs(frontierStd.geograficX - goalX) + abs(frontierStd.geograficY - goalY)
            if firstTest {
                
                lowestCost = frontierStd.totalCost + taxiDriverDistance/2 // + estimate! to goal
                firstTest = false
                nodeToRemove = frontierStd
            } else if frontierStd.totalCost < lowestCost {
                lowestCost = frontierStd.totalCost + taxiDriverDistance/2 // + estimate! to goal
                nodeToRemove = frontierStd
           
                }
        }
        // -------------------------
        
        //path.append(frontier.first!)
        state = frontierSet.remove(nodeToRemove)!
        //state = frontierSet.removeFirst() //val av nod att utveckla. Ta bort den ur frontier
        // Här ska vi egentligen hitta A* som är effektivare
     
        
        currentPath = state.pathHierto     //hur tog vi oss hit?
        tempCost = state.totalCost //vad har det kostat
        
        
        exploredNodes.insert(state) //lägg till nod till undersökta
        if state.cityName == lookFor { //Kontrollera om vi är framme??
            print(state.pathHierto)
            foundGoal = true
        }
        //om vi är framme behöver vi inte utveckla nya noder
        
        //utveckla nya noder och lägg till frontier!!
        for (connectedStad,distans) in state.connectedTo {
            print(connectedStad)
            print("---- found in connected to")
            var tempStad = townNode()
            for stad in myMap{
              //  print(stad.cityName)
              //  print("---- all in myMap")
                if stad.cityName == connectedStad{
                    print(connectedStad)
                    print("---- found in myMap")
                if !frontierSet.contains(stad) && !exploredNodes.contains(stad){
                    print(connectedStad)
                    print("---- not in explored and frontier")
                    tempStad = stad
                    tempStad.pathHierto = currentPath
                    tempStad.pathHierto.append(stad.cityName)
                    tempStad.totalCost = tempCost + distans
                    frontierSet.insert(tempStad)
                    
                    }}
            }}
        
    }
    
    
    if foundGoal {
        print("found goal")
    } else {
        print ( "oops")
    }
    
    return state.pathHierto
}

