//  String+Extensions
//  Created by Holger Hinzberg on 14.06.14.
//  Copyright (c) 2014 Holger Hinzberg. All rights reserved.

import Foundation

public extension String
{
    public func left(characterCount : Int) -> String
    {
        if characterCount > 0 && characterCount < self.count
        {
            let sub = String(self[..<self.index(self.startIndex, offsetBy: characterCount)])
            return sub
        }
        return self
    }
    
    public func right(characterCount : Int) -> String
    {
        if characterCount > 0 && characterCount < self.count
        {
            let sub = String(self[self.index(self.endIndex, offsetBy: (characterCount * -1))...])
            return sub
        }
        return self
    }
    
    
    public func caseInsensitiveContains(substring:String) -> Bool
    {
        if (self.lowercased().contains(substring.lowercased()))
        {
            return true
        }
        return false
    }
    
    public func getIndexOf(substring:String)->Int
    {
        let theRange:Range = self.lowercased().range(of:substring.lowercased())!
        let index: Int = self.distance(from: self.startIndex, to: theRange.lowerBound)
        return index
    }

    public func substringBefore(searchString:String, options: NSString.CompareOptions? = nil) ->String
    {
        var theRange : Range<String.Index>?
        if let options = options
        {
            theRange = self.range(of: searchString, options: options)
        }
        else
        {
            theRange = self.range(of: searchString)
        }

        if let theRange = theRange
        {
            let endIndex = theRange.lowerBound
            let str = String(self[self.startIndex..<endIndex])
            return str
        }
        return self
    }
    

    
    public func substringAfter(searchString:String, options: NSString.CompareOptions? = nil) ->String
    {
        var theRange : Range<String.Index>?
        if let options = options
        {
            theRange = self.range(of: searchString, options: options)
        }
        else
        {
            theRange = self.range(of: searchString)
        }
        
        if let theRange = theRange
        {
            let str = String(self[theRange.upperBound..<self.endIndex])
            return str
        }
        return self
    }
    
    

    
    public func substringRightFrom(characterCount:Int) -> String
    {
        if characterCount > 0 && characterCount < self.count
        {
            let sub = String(self[self.index(self.startIndex, offsetBy: characterCount)...])
            return sub
        }
        return self
    }
    

    
    public func substringLeftFrom(characterCount:Int) -> String
    {
        if characterCount > 0 && characterCount < self.count
        {
            let sub = String(self[..<self.index(self.startIndex, offsetBy: self.count - characterCount)])
            return sub
        }
        return self
    }
    
    public func caseInsensitiveEndsWith(anotherString:String)->Bool
    {
        // Position wo die Zeichenkette ist.
        let indexOfAnotherString = getIndexOf(substring: anotherString)
        // Position wo die Zeichenkette sein sollten wenn sie am Ende wäre
        let endIndex:Int = self.count - anotherString.count
        
        if indexOfAnotherString == endIndex
        {
            return true
        }
        return false
    }
    
    public func caseInsensitiveBeginsWith(anotherString:String)->Bool
    {
        let indexOfAnotherString = getIndexOf(substring: anotherString)
        if indexOfAnotherString == 0
        {
            return true
        }
        return false
    }
    
    public func appendingPathComponent(_ string: String) -> String
    {
        return URL(fileURLWithPath: self).appendingPathComponent(string).path
    }
    
    //MARK: Deprecated functions
    
    @available(*, deprecated, message: "Use substringAfter instead")
    public func substringRightOf(searchString:String) ->String
    {
        let theRange = self.range(of: searchString)
        if let theRange = theRange
        {
            let str = String(self[theRange.upperBound..<self.endIndex])
            return str
        }
        return self
    }
    
    @available(*, deprecated, message: "Use substringBefore instead")
    public func substringLeftOf(searchString:String) ->String
    {
        let theRange = self.range(of: searchString)
        if let theRange = theRange
        {
            let endIndex = theRange.lowerBound
            let str = String(self[self.startIndex..<endIndex])
            return str
        }
        return self
    }
    
}
