//
//  ContentView.swift
//  rockpaperscissor
//
//  Created by Nicolas Florencio Felipe on 16/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var arr = ["Rock", "Paper", "Scissor"]
    @State var randomHand = Hand(tapped: "", result: Bool.random())
    @State var myChoice = ""
    @State var rounds = 0
    @State var score = 0
    @State var highscore = 0
    var randHand: String {
        return arr[Int.random(in: 0..<arr.count)]
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("\(randomHand.tapped)")
                Text("\(String(randomHand.result))")
            }
            
            VStack {
                Text("Your score is: \(score)")
                Text("Highscore: \(highscore)")
            }
            
            HStack {
                ForEach (0..<3) { number in
                    Button(arr[number]) {
                        whenTarget(arr[number])
                    }

                }
                
            }
            
        }

    }
    
    func whenTarget (_ str: String) {
        scoring(str)
        shuffleHand()
        resetAll()
    }
    
    func scoring (_ str: String) {
        myChoice = str
        if myChoice == randomHand.tapped {
            score -= 1
        } else if randomHand.result == true {
            if randomHand.tapped == "Rock" && myChoice == "Paper" {
                score += 1
            } else if randomHand.tapped == "Scissor" && myChoice == "Rock" {
                score += 1
            } else if randomHand.tapped == "Paper" && myChoice == "Scissor" {
                score += 1
            } else {
                score -= 1
            }
        } else if randomHand.result == false {
            if randomHand.tapped == "Rock" && myChoice == "Scissor" {
                score += 1
            } else if randomHand.tapped == "Scissor" && myChoice == "Paper" {
                score += 1
            } else if randomHand.tapped == "Paper" && myChoice == "Rock" {
                score += 1
            } else {
                score -= 1
            }
        }
        
    }
    
    func shuffleHand () {
        randomHand = Hand(tapped: randHand, result: Bool.random())
    }
    
    func resetAll () {
        rounds += 1
        if highscore < score {
            highscore = score
        }
        if rounds == 10 {
            score = 0
            rounds = 0
        }
    }
    
    init() {
        _randomHand = State(initialValue: Hand(tapped: randHand, result: Bool.random()))
    }

}

#Preview {
    ContentView()
}
