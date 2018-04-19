//
//  Utilites.swift
//  20180418-LM-NYCSchools
//
//  Created by lakeem muhammad on 4/18/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import Foundation


public class Utilities {
    
    /* Theses utilities could be updated for more general usage for file type
        and testing purposes.
     */
    
    func getSchoolListXml(fileName: String)-> String{
     
        if let path = Bundle.main.path(forResource: fileName, ofType: "xml"){
            let fm = FileManager()
            let exist = fm.fileExists(atPath: path)
            if exist{
                let content = fm.contents(atPath: path)
                return String(data: content!, encoding: String.Encoding.utf8)!
            }
        }
        return ""
    }
    
    func getSchoolSATInfoXml(fileName: String)-> String{
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "xml"){
            let fm = FileManager()
            let exist = fm.fileExists(atPath: path)
            if exist{
                let content = fm.contents(atPath: path)
                return String(data: content!, encoding: String.Encoding.utf8)!
            }
        }
        return ""
    }
    
   
    
    
    //POC idea to convert a string to html for display
    //TODO: this is very slow and not working correctly!
    func generateHTMLString(schoolInfo: SchoolModelInfo)-> NSAttributedString{
       
        let htmlString = "<html><body><h1> \(schoolInfo.schoolName) </h1><p>\(schoolInfo.mathScore)</p> <p>\(schoolInfo.writingScore)</p>  <p>\(schoolInfo.readingScore) </p></body></html>"
        return htmlString.htmlToAttributedString!
    }
}


    extension String {
        var htmlToAttributedString: NSAttributedString? {
            
            guard let data = data(using: .utf8) else { return NSAttributedString() }
            
            do {
                return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
                
            } catch {
                print("error in generating HTML string")
                return NSAttributedString()
            }
        }
}

