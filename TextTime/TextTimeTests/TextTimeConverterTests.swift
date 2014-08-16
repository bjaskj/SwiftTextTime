//
//  TextTimeConverter.swift
//  TextTime
//
//  Created by Bjarte Skjørestad on 15/08/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

import UIKit
import XCTest
import TextTime

class TextTimeConverterTests: XCTestCase {
    var textTimeConverter = TextTimeConverter()
    let numbersOneToNine = ["One": 1, "Two": 2, "Three": 3, "Four": 4, "Five": 5, "Six": 6, "Seven": 7, "Eight": 8, "Nine": 9]
    
    func testZeroReturnsOClock() {
        let result = textTimeConverter.convertNumber(0)
        
        XCTAssertEqual(result, "O'clock")
    }
    
    func testZeroAndHourReturnsMidnight() {
        let result = textTimeConverter.convertNumber(0, hour: true)
        
        XCTAssertEqual(result, "Midnight")
    }
    
    func testNumbersBelowTen() {
        for (expectedText, numberToConvert) in numbersOneToNine {
            let result = textTimeConverter.convertNumber(numberToConvert)
            XCTAssertEqual(result, expectedText as NSString)
        }
    }
    
    func testNumbersFromTenToNineteen() {
        let numbers = ["Ten": 10, "Eleven": 11, "Twelve": 12, "Thirteen": 13, "Fourteen": 14, "Fifteen": 15, "Sixteen": 16, "Seventeen": 17, "Eighteen": 18, "Nineteen": 19]
        
        for (expectedText, numberToConvert) in numbers {
            let result = textTimeConverter.convertNumber(numberToConvert)
            XCTAssertEqual(result, expectedText as NSString)
        }
    }
    
    func testNumbersFromTwentyUntilFifty() {
        let numbers = ["Twenty": 20, "Thirty": 30, "Forty": 40, "Fifty": 50]
        
        for (expectedText, numberToConvert) in numbers {
            let result = textTimeConverter.convertNumber(numberToConvert)
            XCTAssertEqual(result, expectedText as NSString)
        }
    }
    
    // numbers 21-29 starts with "Twenty-"
    func testNumbersTwentyRangeShouldReturnCorrectFirstPart() {
        for number in 21...29 {
            let result = textTimeConverter.convertNumber(number)
            let endsWithTwenty = result.hasPrefix("Twenty-")
            XCTAssertTrue(endsWithTwenty, "\(number) did not start with Twenty-")
        }
    }
    
    // numbers 21-29 ends with number
    func testNumbersTwentyRangeShouldReturnCorrectLastPart() {
        for (expectedTextVersion, number) in numbersOneToNine {
            let numberWanted = 20 + number
            let result = textTimeConverter.convertNumber(numberWanted)
            let endsWithNumber = result.hasSuffix("-\(expectedTextVersion)")
            XCTAssertTrue(endsWithNumber, "\(numberWanted) did not end with \(expectedTextVersion)")
        }
    }
    
    // numbers 31-39 starts with "Thirty-"
    func testNumbersThirtyRangeShouldReturnCorrectFirstPart() {
        for number in 31...39 {
            let result = textTimeConverter.convertNumber(number)
            let endsWithTwenty = result.hasPrefix("Thirty-")
            XCTAssertTrue(endsWithTwenty, "\(number) did not start with Thirty-")
        }
    }
    
    // numbers 31-39 ends with number
    func testNumbersThirtyRangeShouldReturnCorrectLastPart() {
        for (expectedTextVersion, number) in numbersOneToNine {
            let numberWanted = 30 + number
            let result = textTimeConverter.convertNumber(numberWanted)
            let endsWithNumber = result.hasSuffix("-\(expectedTextVersion)")
            XCTAssertTrue(endsWithNumber, "\(numberWanted) did not end with \(expectedTextVersion)")
        }
    }
    
    // numbers 41-49 starts with "Forty-"
    func testNumbersFortyRangeShouldReturnCorrectFirstPart() {
        for number in 41...49 {
            let result = textTimeConverter.convertNumber(number)
            let endsWithTwenty = result.hasPrefix("Forty-")
            XCTAssertTrue(endsWithTwenty, "\(number) did not start with Forty-")
        }
    }
    
    // numbers 41-49 ends with number
    func testNumbersFortyRangeShouldReturnCorrectLastPart() {
        for (expectedTextVersion, number) in numbersOneToNine {
            let numberWanted = 40 + number
            let result = textTimeConverter.convertNumber(numberWanted)
            let endsWithNumber = result.hasSuffix("-\(expectedTextVersion)")
            XCTAssertTrue(endsWithNumber, "\(numberWanted) did not end with \(expectedTextVersion)")
        }
    }
    
    // numbers 51-59 starts with "Fifty-"
    func testNumbersFiftyRangeShouldReturnCorrectFirstPart() {
        for number in 51...59 {
            let result = textTimeConverter.convertNumber(number)
            let endsWithTwenty = result.hasPrefix("Fifty-")
            XCTAssertTrue(endsWithTwenty, "\(number) did not start with Forty-")
        }
    }
    
    // numbers 51-59 ends with number
    func testNumbersFiftyRangeShouldReturnCorrectLastPart() {
        for (expectedTextVersion, number) in numbersOneToNine {
            let numberWanted = 50 + number
            let result = textTimeConverter.convertNumber(numberWanted)
            let endsWithNumber = result.hasSuffix("-\(expectedTextVersion)")
            XCTAssertTrue(endsWithNumber, "\(numberWanted) did not end with \(expectedTextVersion)")
        }
    }
}
