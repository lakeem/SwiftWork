//
//  SchoolParser.swift
//  20180418-LM-NYCSchools
//
//  Created by lakeem muhammad on 4/18/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import Foundation


/* The SchoolParser and SATParser both require well formed xml files. XML validation is beyond the
 scope of this project
 */

 public class SchoolParser: NSObject {
    
    var schoolList = [String: SchoolModelInfo]()

    var xmlParser: XMLParser?
    //temp var for current text being parsed
    var xmlText = ""
    var currentSchool: SchoolModelInfo?
    
    
     init(withXML xml: String) {
        if let data = xml.data(using: String.Encoding.utf8)
        {
            xmlParser = XMLParser(data: data) }
        }
    
     func parser() -> [String: SchoolModelInfo] {
    
        xmlParser?.delegate = self
        xmlParser?.parse()
        
        return schoolList
        }
}

extension SchoolParser: XMLParserDelegate{
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        //reset the text
        xmlText=""
        //match on xml top level node
        if elementName == "row"{
            currentSchool = SchoolModelInfo()
        }
    }
    
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "school_name"{
            //could be an issues....
            currentSchool?.schoolName = xmlText.uppercased()
        }
        
        if elementName == "dbn"{
            //could be an issues....
            currentSchool?.schoolUniqueId = xmlText.lowercased()
        }
        if elementName == "row"{
            if let school = currentSchool{                
                schoolList[school.schoolUniqueId] = school
            }
        }
    }

    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        xmlText += string
    }
    
}




/* Part of the requirement specifies two different xml files. A complete list of schools and
 an list of schools that have taken the SAT.  It its possbile to have schools that have not yet had their test
 results included. However three should not be any school listed with an SAT score that is not on the School list
 */

public class SatParser: NSObject{
    
    var xmlParser: XMLParser?
    //temp var for current text being parsed
    var xmlText = ""
    var currentSchoolSatInfo: SchoolModelInfo?
    var retrievedSchoolInfo: SchoolModelInfo?
    var converter = Utilities()
    
    var updatedList: [String: SchoolModelInfo]
    
    init(withXML xml: String, schoolList: [String : SchoolModelInfo] ) {
        if let data = xml.data(using: String.Encoding.utf8)
        {
            xmlParser = XMLParser(data: data)
            
        }
         updatedList = schoolList
    }
    func parser() -> [String: SchoolModelInfo] {
        
        xmlParser?.delegate = self
        xmlParser?.parse()
        
        return updatedList
    }
}

extension SatParser: XMLParserDelegate{
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        //reset the temp var for new node
        xmlText=""
        //match on xml top level node
        if elementName == "row"{
            currentSchoolSatInfo = SchoolModelInfo()
        }
    }
    

    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "dbn"{
            currentSchoolSatInfo?.schoolUniqueId = xmlText.lowercased()
        }
        
        if elementName == "sat_math_avg_score"{
            currentSchoolSatInfo?.mathScore = xmlText
        }
        
        if elementName == "sat_critical_reading_avg_score"{
            currentSchoolSatInfo?.readingScore = xmlText
        }
        if elementName == "sat_writing_avg_score"{
            currentSchoolSatInfo?.writingScore = xmlText
        }

        
        if elementName == "row"{
            if let school = currentSchoolSatInfo{
                
                guard let retreivedRecord = updatedList[school.schoolUniqueId] else {return}
                //udpate the dictionary
                updatedList[retreivedRecord.schoolUniqueId]?.mathScore = school.mathScore
                updatedList[retreivedRecord.schoolUniqueId]?.writingScore = school.writingScore
                updatedList[retreivedRecord.schoolUniqueId]?.readingScore = school.readingScore
            }
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        xmlText += string
        }

}








