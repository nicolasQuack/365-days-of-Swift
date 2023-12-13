//
//  Struct.swift
//  MathExam
//
//  Created by Nicolas Florencio Felipe on 12/12/23.
//

import Foundation

struct Question: Identifiable, Decodable, Hashable {
    internal var id = UUID()
    private var x: Int
    private var y: Int
    private var answer: Int {
        x*y
    }
    
    init(id: UUID = UUID(), x: Int, y: Int) {
        self.id = id
        self.x = x
        self.y = y
    }
    
    func getId() -> UUID {
        self.id
    }
    
    func getX() -> Int {
        self.x
    }
    
    func getY() -> Int {
        self.y
    }
    
    func getResult() -> Int {
        self.answer
    }
    
}
