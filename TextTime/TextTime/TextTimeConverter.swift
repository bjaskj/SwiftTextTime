//
//  TextTimeConverter.swift
//  TextTime
//
//  Created by Bjarte Skjørestad on 15/08/14.
//  Copyright (c) 2014 Bjarte Skjørestad. All rights reserved.
//

public class TextTimeConverter: NSObject {
    
    let numbersOneToNine = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
    let numbersFromTenToNineteen = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let numbersByTen = [2: "Twenty", 3: "Thirty", 4: "Forty", 5: "Fifty"]
    
    public func convertNumber(number:NSInteger, hour:Bool=false) -> NSString {
        switch number {
        case 0:
            return hour ? "Midnight" : "O'clock"
        case 1...9:
            return numbersOneToNine[number-1]
        case 10...19:
            return numbersFromTenToNineteen[number-10]
        case 20...59:
            let firstNumber = NSInteger(number / 10)
            let lastNumber = number - (firstNumber * 10)
            
            // check if last number is zero, this means we only have to do numbers by ten
            if lastNumber == 0 {
                return numbersByTen[firstNumber]!
            }
            
            let firstTextPart = numbersByTen[firstNumber]!
            let lastTextPart = numbersOneToNine[lastNumber-1]
            
            return "\(firstTextPart)-\(lastTextPart)"
        default:
            return ""
        }
    }
}
