//
//  GameHandler.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import Foundation

class GameHandler {
    var score:Int?
    var highScore:Int?
    var brains:Int?
    var startBrains:Int!
    var motionOn:Bool!
    var boundariesOn:Bool!
    
    var playerHealth:Int!
    var startBadFish:Int!
    var badFish:Int?
    var startGoodFish:Int!
    var goodFish:Int?
    
    var lvlData:NSDictionary?
    
    var playerIMG:String!
    
    var endGameState:String?
    
    class var sharedInstance:GameHandler {
        struct Singleton {
            static let instance = GameHandler()
        }
        
        return Singleton.instance
    }
    
    init() {
        score = 0
        highScore = 0
        brains = 0
        playerHealth = 100
        badFish = 0
        startBadFish = 0
        startGoodFish = 0
        goodFish = 0
        endGameState = ""
        
        motionOn = false
        boundariesOn = false
        playerIMG = "player"
        
        let user = UserDefaults.standard
        
        highScore = user.integer(forKey: "highScore")
        startBrains = user.integer(forKey: "brains")
        startBadFish = user.integer(forKey: "badFish")
        startGoodFish = user.integer(forKey: "goodFish")
        
        if let path =  Bundle.main.path(forResource: "Level01", ofType: "plist") {
            if let level = NSDictionary(contentsOfFile: path) {
                lvlData = level
            }
        }
    }
    
    func saveGame() {
        highScore = max(score!,highScore!)
        
        let user = UserDefaults.standard
        let xBrains = brains! + startBrains
        let xBadFish = badFish! + startBadFish
        let xGoodFish = goodFish! + startGoodFish
        
        user.set(highScore, forKey: "highScore")
        user.set(xBrains, forKey: "brains")
        user.set(xBadFish, forKey : "badFish")
        user.set(xGoodFish, forKey: "goodFish")
        
        startBrains = xBrains
        startBadFish = xBadFish
        startGoodFish = xGoodFish
        
        user.synchronize()
    }
    
    func clearStats() {
        highScore = 0
        score = 0
        brains = 0
        startBrains = 0
        badFish = 0
        goodFish = 0
        startBadFish = 0
        startGoodFish = 0
        goodFish = 0
        
        saveGameFresh()
    }
    
    func setMotionOn() {
        if motionOn == true {
            motionOn = false
        } else {
            motionOn = true
        }
    }
    
    func setBoundariesOn() {
        if boundariesOn == true {
            boundariesOn = false
        } else {
            boundariesOn = true
        }
    }
    
    func brainsEatenTotal() -> Int {
        let user = UserDefaults.standard
        return user.integer(forKey: "brains")
    }
    
    func badFishEatenTotal() -> Int {
        let user = UserDefaults.standard
        return user.integer(forKey: "badFish")
    }
    
    func goodFishEatenTotal() -> Int {
        let user = UserDefaults.standard
        return user.integer(forKey: "goodFish")
    }
    
    func changePlayerImg(img: String) {
        playerIMG = img
    }
    
    func changePlayerImg2(img: String) {
        playerIMG = img
    }
    
    func changePlayerImg3(img: String) {
        playerIMG = img
    }
    
    func saveGameFresh() {
        let user = UserDefaults.standard
        
        user.set(highScore, forKey: "highScore")
        user.set(brains, forKey: "brains")
        user.set(badFish, forKey: "badFish")
        user.set(goodFish, forKey: "goodFish")
        user.synchronize()
    }
    
    
    
}
