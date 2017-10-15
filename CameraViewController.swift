//
//  CameraViewController.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/30/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia
import Vision
import QuartzCore
import CoreML

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var model: Inceptionv3!
    var photoRequested = "\(importRequest(currentStage: stageForCamera!))"
    
    let imagePicker = UIImagePickerController()
    var imageInView = UIImage()
    
    @IBAction func cameraButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion:  nil)
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
    }
    
    @IBOutlet var successButton: CornerRadiusButton!
    
    @IBOutlet var imageResultView: UIImageView!
    @IBOutlet var objectiveLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        model = Inceptionv3()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        successButton.isEnabled = false
        successButton.alpha = 0
        objectiveLabel.text = "Objective: Take a picture of a \(photoRequested)"
        print("Photo Request loaded for Chapter: \(currentChapter) Part: \(stageForCamera!)")
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

extension CameraViewController {
    
    func imagePickerControllerDidCancel(_ _picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return
        }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 299, height: 299), true, 2.0)
        image.draw(in: CGRect(x: 0, y: 0, width: 299, height: 299))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let attr = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(newImage.size.width), Int(newImage.size.height), kCVPixelFormatType_32ARGB, attr, &pBuffer)
        guard (status == kCVReturnSuccess) else {
            return
        }
        
        CVPixelBufferLockBaseAddress(pBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pBuffer!)
        let rgbColoring = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(newImage.size.width), height: Int(newImage.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pBuffer!), space: rgbColoring, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: newImage.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        newImage.draw(in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        imageResultView.image = newImage
        
        guard let prediction = try? model.prediction(image: pBuffer!) else {
            return
        }
        
        func alertMessage() {
            if (stageForCamera! % 15) == 0 {
            let alertController = UIAlertController(title: "Congratulations!", message: "You have completed Chapter \(currentChapter)!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
           }
        }
        
        func completedStage() {
         //  successButton.backgroundColor = UIColor.
            successButton.setTitle("Complete!!", for: .normal)
            successButton.isEnabled = true
            successButton.alpha = 1
            if stageForCamera == currentStage {
                if currentStage < 15 {
                    currentStage += 1
                    print("Unlocked Chapter \(currentChapter): Part \(currentStage)")
                    userDefault.set(currentStage, forKey: "currentStage")
                } else {
                    print("Chapter \(currentChapter) complete!")
                }
                
            }
            alertMessage()
        }
        
//        func storyModeOnly() {
//            if userDefaultStoryMode == true {
//                completedStage()
//            }
//        }
        
        func stageIncomplete() {
            successButton.setTitle("Try Again", for: .normal)
        }
        
        resultLabel.text = "\(prediction.classLabel)"
        if prediction.classLabel.contains(photoRequested) {
            completedStage()
        } else {
            stageIncomplete()
        }
    }

}
