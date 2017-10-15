//
//  UserDefaults.swift
//  ALensStory
//
//  Created by Joe's Computer on 9/25/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import Foundation

let userDefault = UserDefaults.standard
let userDefaultSound = true
var userDefaultDarkMode = false
var userDefaultStoryMode = false


func loadDefaults() {
    if userDefault.value(forKey: "currentStage") != nil {
        if userDefault.value(forKey: "currentStage") as! Int > 1 {
            currentStage = userDefault.value(forKey: "currentStage") as! Int
            print("Saved stage is \(userDefault.value(forKey: "currentStage") ?? 0)")
        }
    }
    if userDefault.value(forKey: "darkMode") != nil {
        print("Dark mode is \(String(describing: userDefault.value(forKey: "darkMode")))")
    }
    if userDefault.value(forKey: "storyModeOnly") != nil {
        print("Dark mode is \(String(describing: userDefault.value(forKey: "storyModeOnly")))")
    }
}

func preparingNarrativeForComplier() {
    print("Current chapter: \(currentChapter)")
    print("Current stage: \(currentStage)")
    return
}


