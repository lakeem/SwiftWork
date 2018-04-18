//
//  SchoolInfo.swift
//  JPCApp
//
//  Created by lakeem muhammad on 4/18/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import Foundation


class SchoolModelInfo: CustomStringConvertible{
    
    var schoolName = ""
    var schoolUniqueId = ""
    
    //TODO: Add school location to display to user
    
    
    //stat default info
    var mathScore = "No Data Returned"
    var readingScore = "No Data Returned"
    var writingScore = "No Data Returned"
    
    var htmlDataToDisplay = NSAttributedString()
    
    var description: String {
        return """
        High School: \(schoolName)
        Uniqiue School Id:          \(schoolUniqueId)
        Average Math SAT Score:         \(mathScore)
        Average Reading SAT Score:  \(readingScore)
        Average Writing SAT Score:  \(writingScore)
        """
    }
    
}
