//
//  NarrativeViewController.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/20/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit

class NarrativeViewController: UIViewController {
    
    @IBOutlet var storyHeaderImage: UIImageView!
    @IBOutlet var storyHeaderLabel: UILabel!
    
    @IBOutlet var storyViewCard: UIView!
    @IBOutlet var storyLabel: UILabel!
    @IBOutlet var storyAdvanceRecommendation: UILabel!
    
    @IBAction func restartStoryButton(_ sender: Any) {
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
                resetStoryCard()
                return
            } else if card.center.x > (view.frame.width - 75) {
                // Move off to the right
                UIView.animate(withDuration: 0.3, animations: {
                    self.storyViewCard.center = CGPoint(x: self.storyViewCard.center.x + 200, y: self.storyViewCard.center.y + 75)
                    self.storyViewCard.alpha = 0
                })
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.storyHeaderImage.transform = CGAffineTransform(rotationAngle:720)
        })
        UIView.animate(withDuration: 1.5, animations: {
            self.storyLabel.alpha = 1
        })
        // Do any additional setup after loading the view.
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
