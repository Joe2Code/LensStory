//
//  ViewController.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/12/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var currentChapterSelected: Int? = nil
    
    // MARK: -- Collection View
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4 - 14
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chapterCell", for: indexPath ) as! ChaptersCollectionViewCell
        
        // cell.chapterLabel.text = chapters[indexPath.item]
        cell.chapterButton.setTitle(chapters[indexPath.row], for: .normal)
        cell.chapterButton.isUserInteractionEnabled = false
        if chapters[indexPath.row] == "🔒" {
            cell.chapterButton.isEnabled = false
            cell.isUserInteractionEnabled = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentChapterSelected = Int(chapters[indexPath.row])
        // print(currentChapterSelected!)
        performSegue(withIdentifier: "chapterSelect", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let stageSelectViewController = segue.destination as? StageSelectViewController {
            stageSelectViewController.chapterSelected = currentChapterSelected!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

