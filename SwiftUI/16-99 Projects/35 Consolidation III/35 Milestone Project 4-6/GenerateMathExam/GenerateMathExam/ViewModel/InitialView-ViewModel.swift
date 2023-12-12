//
//  InitialView-ViewModel.swift
//  GenerateMathExam
//
//  Created by Nicolas Florencio Felipe on 11/12/23.
//

import Foundation
import SwiftUI

extension InitialView {
    @MainActor class InitialView: ObservableObject {
        @Published private(set) var rangeArr = [5, 10, 15]
        @Published var currentRangeOfQuestions = 10
        @Published var dragAmount = CGSize.zero
        
        @Published var difficultyArr: [Difficulty] = [.easy, .moderate, .hard]
        @Published private(set) var currentDifficulty: Difficulty = .moderate
        
        func updateCurrentDifficulty (_ difficulty: Difficulty) {
            self.currentDifficulty = difficulty
        }
    }
}
