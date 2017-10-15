//
//  NarrativeViewController.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/20/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit

class NarrativeViewController: UIViewController {
    
    var chapterSelected = 0
    var stageSelected = 0
    
    @IBOutlet var storyHeaderImage: UIImageView!
    @IBOutlet var storyHeaderLabel: UILabel!
    
    @IBOutlet var storyViewCard: UIView!
    @IBOutlet var storyLabel: UILabel!
    @IBOutlet var storyAdvanceRecommendation: UILabel!
    
    @IBOutlet var storyLabelContainer: CornerRadiusLabel!
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var startPhotoRequest: CornerRadiusButton!
    @IBAction func restartStoryButton(_ sender: Any) {
        resetNarrativeForCurrentStage()
    }
    @IBAction func skipStoryButton(_ sender: Any) {
    }
    
    @IBAction func panStoryCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizerState.ended {
            
            if storyViewCard.center.x < 75 {
                // Move off to the left side
                UIView.animate(withDuration: 0.3, animations: {
                    self.storyViewCard.center = CGPoint(x: self.storyViewCard.center.x - 200, y: self.storyViewCard.center.y + 75)
                    self.storyViewCard.alpha = 0
                })
                if currentNarrativeIteration < importStage(currentStage: stageSelected).count {
                    storyLabel.text = importStage(currentStage: stageSelected)[currentNarrativeIteration] as? String
                    if (importStage(currentStage: stageSelected)[currentNarrativeIteration] as AnyObject).contains("Photo Request: ") {
                        finishedStory()
                        currentNarrativeIteration -= 1
                    }
                    currentNarrativeIteration += 1
                } else {
                    storyLabel.text = "Could not load or finish story."
                    fatalError("Story failed to load or continue")
                }

                resetStoryCard()
                return
            } else if card.center.x > (view.frame.width - 75) {
                // Move off to the right
                UIView.animate(withDuration: 0.3, animations: {
                    self.storyViewCard.center = CGPoint(x: self.storyViewCard.center.x + 200, y: self.storyViewCard.center.y + 75)
                    self.storyViewCard.alpha = 0
                })
                if currentNarrativeIteration < importStage(currentStage: stageSelected).count {
                    storyLabel.text = importStage(currentStage: stageSelected)[currentNarrativeIteration] as? String
                    if (importStage(currentStage: stageSelected)[currentNarrativeIteration] as AnyObject).contains("Photo Request:") {
                        finishedStory()
                        currentNarrativeIteration -= 1
                    }
                    currentNarrativeIteration += 1
                } else {
                    storyLabel.text = "Could not load or finish story."
                    fatalError("Story failed to load or continue")
                }
                
                resetStoryCard()
                return
            }
            
        UIView.animate(withDuration: 0.2, animations: {
            card.center = self.view.center
            })
        }
    }
    
    func resetStoryCard() {
        self.storyViewCard.center = self.view.center
        UIView.animate(withDuration: 0.8 , animations: {
            self.storyViewCard.alpha = 1
        })
    }
    
    func resetNarrativeForCurrentStage() {
        currentNarrativeIteration = 1
        storyLabel.text = importStage(currentStage: stageSelected)[0] as? String
    }
    
    func finishedStory() {
        storyAdvanceRecommendation.text = "click below to continue"
        UIView.animate(withDuration: 1.0 , animations: {
            self.startPhotoRequest.alpha = 1
            
        })
    }
    
//    func darkMode() {
//        if userDefault.bool(forKey: "darkMode") == true {
//            storyLabel.backgroundColor = UIColor.black
//            storyLabel.textColor = UIColor.white
//            backgroundImage.alpha = 0
//            storyLabelContainer.backgroundColor = UIColor.black
//            storyAdvanceRecommendation.textColor = UIColor.white
//        } else if userDefault.bool(forKey: "darkMode") == false {
//            storyLabel.backgroundColor = UIColor.clear
//            storyLabel.textColor = UIColor.black
//            backgroundImage.alpha = 1
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        currentNarrativeIteration = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // darkMode()
        storyHeaderLabel.text = "Chapter \(chapterSelected): Part \(stageSelected)"
        resetNarrativeForCurrentStage()
        startPhotoRequest.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.storyHeaderImage.transform = CGAffineTransform(rotationAngle:720)
        })
        UIView.animate(withDuration: 0.5, animations: {
            self.storyLabel.alpha = 1
        })
        // Do any additional setup after loading the view.
        stopSound()
        
        print("Chapter selected was: \(chapterSelected)")
        print("Stage selected was: \(stageSelected)")
        
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
