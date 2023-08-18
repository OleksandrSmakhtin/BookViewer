//
//  AccountHelpScreen.swift
//  BookViewer
//
//  Created by Роман on 10.08.2023.
//

import SwiftUI

struct AccountHelpScreen: View {

    @State var colors: [Color] = [Color.orange, Color.gray.opacity(0.4)]
    
    func makeColors() {
        for (index, color) in colors.enumerated() {
            if color == .orange {
                colors[index] = .gray.opacity(0.4)
            } else {
                colors[index] = .orange
            }
        }
    }
    
    func getIndex() -> Int {
        for (index, color) in colors.enumerated() {
            if color == .orange {
                return index
            }
        }
        
        return 0
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        makeColors()
                    }
                }, label: {
                    Text("FAQ")
                        .padding()
                        .foregroundColor(.white)
                        .background(colors[0])
                        .font(.system(size: 20))
                        .cornerRadius(10)
                        .padding()
                })
                
                Button(action: {
                    withAnimation {
                        makeColors()
                    }
                }, label: {
                    Text("Contact Us")
                        .padding()
                        .foregroundColor(.white)
                        .background(colors[1])
                        .font(.system(size: 20))
                        .cornerRadius(10)
                        .padding()
                })

            }
            
            Spacer()
            
            ScrollView {
                VStack {
                    switch getIndex() {
                    case 0:
                        AccountHelpFaqView()
                    case 1:
                        AccountHelpContactView()
                    default:
                        Text("Error!")
                    }
                }
            }
            
            Spacer()
        }
        
    }
}

struct AccountHelpScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountHelpScreen()
    }
}
