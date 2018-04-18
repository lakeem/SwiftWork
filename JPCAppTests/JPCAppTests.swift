//
//  JPCAppTests.swift
//  JPCAppTests
//
//  Created by lakeem muhammad on 4/18/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import XCTest
@testable import JPCApp

class JPCAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        //let fileName = "XMLSATListTest1"
        //let fileName2 = "theata4tqt"
        //let schoolList = dataSetup.getSchoolListXml(fileName: fileName)
        //let satList = dataSetup.getSchoolSATInfoXml(fileName: fileName2)
    }
    
    
//
//    override func tearDown() {
//        super.tearDown()
//    }

    var dataSetup : Utilities!
    var viewModelTest : ViewModel!
    
    //Test Case Happy Path
    func testHappyPathMasterSchoolFile(){
        dataSetup = Utilities()
        let fileName = "XMLSchoolListTest1"
        let result = dataSetup.getSchoolListXml(fileName: fileName)
        XCTAssertFalse( result.isEmpty )
    }
    
    
    
    //Test Case Happy Path SAT File
    func testHappyPathSATScoresFile(){
        dataSetup = Utilities()
        let fileName = "XMLSATListTest1"
        let result = dataSetup.getSchoolSATInfoXml(fileName: fileName)
        XCTAssertFalse( result.isEmpty )
    }
    
    
    
    
    //Test Case file loading xml error
    func testLoadDataAndPrepShouldPass(){
        
        dataSetup = Utilities()
        viewModelTest = ViewModel()
        viewModelTest.schoolMasterList = dataSetup.getSchoolListXml(fileName: "")
        viewModelTest.schoolSATList = dataSetup.getSchoolSATInfoXml(fileName: "")
        
        let result = viewModelTest.loadAndPrepData()
        
        XCTAssertFalse(result.isEmpty)

    }
    
    
    //Test Case School in SAT List but not in Master List
    
    //Test Case No Data Returned Happy Path
    
    

    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
