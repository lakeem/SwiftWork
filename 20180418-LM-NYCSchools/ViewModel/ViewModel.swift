//
//  ViewModel.swift
//  JPCApp
//
//  Created by lakeem muhammad on 4/18/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import Foundation

var dataPrepComplete = [SchoolModelInfo]()


public class SetUpFiles{
    var schoolMasterList = ""
    var schoolSATList = ""
    
    init() {
        schoolMasterList = "HighSchoolNames"
        schoolSATList = "SATScores"
    }
    
    init(schoolList: String, satList : String) {
        schoolMasterList = schoolList
        schoolSATList = satList
    }
}

public class ViewModel {
    


    func loadAndPrepData( getFileNamesFrom: SetUpFiles) -> [SchoolModelInfo]{
        
        let stringPrep = Utilities()
        
        //load school list xml
        let schoolNameXML = stringPrep.getSchoolListXml(fileName: getFileNamesFrom.schoolMasterList)
        
        //load SAT xml
        let schoolSATXmlData = stringPrep.getSchoolSATInfoXml(fileName: getFileNamesFrom.schoolSATList)
        
        //parse school list passing in dictonary and school xml
        let parseSchoolNameList = SchoolParser(withXML: schoolNameXML)
        
        var schoolInfoDictionary = parseSchoolNameList.parser()
        
        //Parse school list passing in dictionary and sat xml
        let parseSATInfo = SatParser(withXML: schoolSATXmlData, schoolList: schoolInfoDictionary)
        
        //update list with sat scores etc...
        schoolInfoDictionary = parseSATInfo.parser()

        for (_, SchoolModelInfo) in schoolInfoDictionary {
            dataPrepComplete.append(SchoolModelInfo)
        }
        return dataPrepComplete
    }
    
    
   
    
    

    
    
}
