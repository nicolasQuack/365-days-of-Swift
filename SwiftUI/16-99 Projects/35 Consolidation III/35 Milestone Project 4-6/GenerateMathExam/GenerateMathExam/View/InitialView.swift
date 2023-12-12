//
//  InitialView.swift
//  GenerateMathExam
//
//  Created by Nicolas Florencio Felipe on 11/12/23.
//

import SwiftUI

struct InitialView: View {
    @StateObject private var inicialModel = InitialView()
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.orange, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                .overlay {
                    Rectangle()
                        .fill(.black)
                        .opacity(0.3)
                }
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    Text("Craft your Exam")
                        .titleStyle()
                        .font(.largeTitle)
                    
                    Text("Let's pratice your math principles")
                        .titleStyle()
                        .font(.title2)
                }
                
                // Drag View
                ZStack {
                    RoundedRectangle(cornerRadius: 15.0)
                        .fill(.thinMaterial)
                        .opacity(0.2)
                        .shadow(radius: 10, x: 0, y: 0)
                        
                    HStack (spacing: 20) {
                        ForEach(0..<3) { num in
                            Button {
                                withAnimation {
                                    inicialModel.updateCurrentDifficulty(inicialModel.difficultyArr[num])
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 15.0)
                                    .fill(num == 0 ? .green : num == 1 ? .yellow : .red)
                                    .frame(width: 100, height: 100)
                                    .opacity(inicialModel.difficultyArr[num] != inicialModel.currentDifficulty ? 0.2 : 1.0)
                                    .animation(.easeInOut(duration: 0.4), value: inicialModel.currentDifficulty)
                                    
                            }
                        }
                    }
                    .padding()
                }
                .frame(height: UIScreen.main.bounds.height/6)
                .shadow(radius: 10.0)
                
                // Range View
                ZStack {
                    RoundedRectangle(cornerRadius: 15.0)
                        .fill(.thinMaterial)
                        .opacity(0.2)
                        .shadow(radius: 10, x: 0, y: 0)
                    
                    VStack {
                        Picker("", selection: $inicialModel.currentRangeOfQuestions) {
                            ForEach(inicialModel.rangeArr, id: \.self) {
                                    Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 10)
                    }
                    
                }
                .frame(height: UIScreen.main.bounds.height/15)
                .shadow(radius: 10.0)
                
                // Generate View
                VStack {

                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .fill(LinearGradient(colors: [.white, .white], startPoint: .bottomTrailing, endPoint: .topLeading))
                                .frame(width: 200, height: 50)
                                .shadow(radius: 5)
                                
                            Text("Generate")
                                .foregroundStyle(.black)
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .frame(height: UIScreen.main.bounds.height/2)
                .shadow(radius: 10.0)
                
            }
            .padding()
        }
    }
}

#Preview {
    InitialView()
}
