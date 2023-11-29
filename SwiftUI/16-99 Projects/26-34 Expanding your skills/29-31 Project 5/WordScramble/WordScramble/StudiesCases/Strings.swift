//
//  Strings.swift
//  WordScramble
//
//  Created by Nicolas Florencio Felipe on 27/11/23.
//
//
//import SwiftUI
//
//struct Strings: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//    
//    func workWithStrings() {
//        
//        let input = """
//                  a
//                  b
//                  c
//                  """
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimming = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//        
//        let word = "Swift"
//        let checker = UITextChecker()
//        let range = NSRange(location: 0, length: word.utf16.count)
//        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//        let allGood = misspelledRange.location == NSNotFound
//    }
//    
//}
//
//#Preview {
//    Strings()
//}
