//
//  StageSelectViewController.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/27/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit

class StageSelectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var chapterSelected = 0
    var currentStageSelected: Int? = nil
    
    // MARK: -- Collection View
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return stages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width / 4 - 18
    return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20.0
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stageCell", for: indexPath ) as! StageSelectCollectionViewCell
    
    cell.stageButton.setTitle(stages[indexPath.item], for: .normal)
    cell.stageButton.isUserInteractionEnabled = false
        if Int(stages[indexPath.row])! > currentStage {
            cell.stageButton.isEnabled = false
            cell.isUserInteractionEnabled = false
        }
        
    return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Chapter selected was: \(chapterSelected)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentStageSelected = Int(stages[indexPath.row])
        print(currentStageSelected!)
        performSegue(withIdentifier: "stageSelect", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let narrativeViewController = segue.destination as? NarrativeViewController {
            let chapterThatWasSelected = chapterSelected
            let stageThatWasSelected = currentStageSelected
            narrativeViewController.chapterSelected = chapterThatWasSelected
            narrativeViewController.stageSelected = stageThatWasSelected!
            stageForCamera = stageThatWasSelected
        }
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
