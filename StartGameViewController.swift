//
//  StartGameViewController.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/12/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit
import AVFoundation

class StartGameViewController: UIViewController {
    
    @IBOutlet var startGameLabel: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playSound(file: "seagulls" , ext: "mp3")
        loadDefaults()
        preparingNarrativeForComplier()
        startingGame()
        
        // print(UserDefaults.standard.dictionaryRepresentation())
        // userDefault.removeObject(forKey: "currentStage")
    }
    
    func startingGame() {
        if currentChapter == 1 && currentStage == 1 {
            startGameLabel.setTitle("Start Game", for: .normal)
        } else {
            startGameLabel.setTitle("Resume Game", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
