//
//  StageData.swift
//  ALensStory
//
//  Created by Joe's Computer on 9/17/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import Foundation

var chapters = ["1", "🔒", "🔒", "🔒", "🔒", "🔒", "🔒", "🔒", "🔒", "🔒"]
var stages = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]

var currentChapter = 1
var currentStage = 1
var currentNarrativeIteration = 1

var stageForCamera: Int? = nil

var currentStory = ["\(currentChapter)", "\(currentStage)"]

func importStage(currentStage: Int) -> Array<Any> {
    switch currentStage {
    case 1: return chapterOneOne.script
    case 2: return chapterOneTwo.script
    case 3: return chapterOneThree.script
    case 4: return chapterOneFour.script
    case 5: return chapterOneFive.script
    case 6: return chapterOneSix.script
    case 7: return chapterOneSeven.script
    case 8: return chapterOneEight.script
    case 9: return chapterOneNine.script
    case 10: return chapterOneTen.script
    case 11: return chapterOneEleven.script
    case 12: return chapterOneTwelve.script
    case 13: return chapterOneThirteen.script
    case 14: return chapterOneFourteen.script
    case 15: return chapterOneFifteen.script
    default:
        fatalError("stage cannot be imported")
        // return ["importStage Array error","please try again later"]
    }
}

func importRequest(currentStage: Int) -> String {
    switch currentStage {
    case 1: return chapterOneOne.photoRequest
    case 2: return chapterOneTwo.photoRequest
    case 3: return chapterOneThree.photoRequest
    case 4: return chapterOneFour.photoRequest
    case 5: return chapterOneFive.photoRequest
    case 6: return chapterOneSix.photoRequest
    case 7: return chapterOneSeven.photoRequest
    case 8: return chapterOneEight.photoRequest
    case 9: return chapterOneNine.photoRequest
    case 10: return chapterOneTen.photoRequest
    case 11: return chapterOneEleven.photoRequest
    case 12: return chapterOneTwelve.photoRequest
    case 13: return chapterOneThirteen.photoRequest
    case 14: return chapterOneFourteen.photoRequest
    case 15: return chapterOneFifteen.photoRequest
    default:
        fatalError("import request cannot be imported")
        //return "importRequest String error"
    }
}
