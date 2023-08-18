//
//  AccountHelpFaqView.swift
//  BookViewer
//
//  Created by Роман on 10.08.2023.
//

import SwiftUI

struct AccountHelpFaqView: View {
    
    @State var cards: [HelpFaqModel] = [
        HelpFaqModel(question: "What is Book viewer?", answer: "Book viewer is a book shop with unsual style of reading", isOpen: false),
        HelpFaqModel(question: "How to read books?", answer: "1. Open a book 2. read the sentence and look at the image 3. Use arrrows to move from the sentence to sentece", isOpen: false),
        HelpFaqModel(question: "How it makes images?", answer: "Book viewer uses unsplash official images library. It takes first word of the sentence and searches there.", isOpen: false),
        HelpFaqModel(question: "How many times during a year book view has updates", answer: "Book Viewer receives updates every 1-3 month", isOpen: false)
    ]
    
    var body: some View {
        
        VStack {
            ForEach($cards) { $card in
                VStack {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            if card.isOpen {
                                card.isOpen = false
                            } else {
                                card.isOpen = true
                            }
                        }
                    }, label: {
                        HStack {
                            
                            Text(card.question)
                                .bold()
                                .font(.title3)
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if card.isOpen {
                                Image(systemName: "arrowtriangle.down.fill")
                                    .foregroundColor(.orange)
                            } else {
                                Image(systemName: "arrowtriangle.backward.fill")
                                    .foregroundColor(.orange)
                            }
                      
                        }
                    })
       
                    if card.isOpen {
                        Divider()
                        Text(card.answer)
                            .foregroundColor(.secondary.opacity(0.5))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.1), lineWidth: 3)
                )
                .padding()
            }
        }
        
    }
}

struct AccountHelpFaqView_Previews: PreviewProvider {
    static var previews: some View {
        AccountHelpFaqView()
    }
}
