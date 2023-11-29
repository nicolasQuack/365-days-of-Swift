//
//  ContentView.swift
//  WordScramble
//
//  Created by Nicolas Florencio Felipe on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    @State private var listOfLatestRootWords = [rootWordStruct]()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                
                Section ("Your entered words:") {
                    ForEach (usedWords, id: \.self) { word in
                        
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
                
                Section ("Latest root words and their score:") {
                    ForEach (listOfLatestRootWords, id: \.self) { rootWord in
                        HStack {
                            Image(systemName: "\(rootWord.self.score).circle")
                            Text(rootWord.self.word)
                        }
                    }
                }
                
            }
            .navigationTitle("\(rootWord): \(score)")
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) { } message: { Text(errorMessage) }
            .toolbar {
                Button ("restart", systemImage: "restart.circle") {
                    startGame()
                    
                }
            }
        }
    }
    
    func addNewWord() {
        
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard isDiferent(word: answer) else {
            wordError(title: "Word is the same", message: "You can be more original!")
            return
        }
        
        guard isLonger(word: answer) else {
            wordError(title: "Word is so shorter", message: "You can't spell words with below three letters!")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += answer.count
        
        newWord = ""
    }
    
    func startGame() {
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            
            if rootWord != "" {
                let rootWordObj = rootWordStruct(word: rootWord, score: score)
                listOfLatestRootWords.insert(rootWordObj, at: 0)
            }
            
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                
                rootWord = allWords.randomElement() ?? "silkworm"
                
                usedWords = []
                score = 0
                
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal (word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible (word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal (word: String) -> Bool {
        
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        
        return misspelledRange.location == NSNotFound
    }
    
    func isLonger (word: String) -> Bool {
        return word.count > 2
    }
    
    func isDiferent (word: String) -> Bool {
        return !(word == rootWord)
    }
    
    func wordError (title: String, message: String) {
        
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

#Preview {
    ContentView()
}
