//
//  ReadView.swift
//  BookViewer
//
//  Created by Роман on 12.08.2023.
//


// https://api.unsplash.com/search/photos?query=food&client_id=pEH6YAF3jfRTYjBngFtywMvlQZiBltiF-o_6TNOSWCE


import SwiftUI

struct Sentence: Identifiable {
    let id = UUID()
    let text: String
}

struct ReadView: View {
    
    @StateObject private var imagesViewModel = ImagesViewModel()
    
    var text: String
    
    var textWithDots: String {
        var modifiedText = text
        if !modifiedText.isEmpty {
            let lastCharacter = modifiedText.last!
            if lastCharacter != "." && lastCharacter != "!" && lastCharacter != "?" {
                modifiedText.append(".")
            }
        }
        return modifiedText
    }
    
    var sentences: [Sentence] {
        let pattern = "([^.!?]*[.!?])"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: textWithDots, range: NSRange(textWithDots.startIndex..., in: textWithDots))
        
        return matches.map { match in
            let range = Range(match.range, in: textWithDots)!
            return Sentence(text: String(textWithDots[range]))
        }
    }
    
    
    @State private var currentIndex = 0
    @State private var imageUrl: String?
    
    var body: some View {
        
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(sentences.indices) { index in
                    VStack {
                        
                        Spacer()
                        
                        if let imageUrl = imageUrl {
                            AsyncImage(url: URL(string: imageUrl)) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .frame(width: 300, height: 300) // Adjust the width and height as needed
                                            .padding()
                                    case .empty, .failure:
                                        ProgressView()
                                    @unknown default:
                                        ProgressView()
                                    }
                                }
                        }
                        
                        ScrollView {
                            Text(sentences[index].text)
                                .foregroundColor(.primary)
                                .tag(index)
                                .padding()
                        }
                        
                        
                    }
                    .onAppear {
                        print(sentences)
                        Task {
                            if let fetchedImageUrl = await imagesViewModel.fetchImage(query: sentences[index].text) {
                                imageUrl = fetchedImageUrl
                            }
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            HStack {
                Button(action: {
                    withAnimation {
                        currentIndex = max(currentIndex - 1, 0)
                    }
                }) {
                    Image(systemName: "arrow.left.circle")
                        .font(.title)
                        .foregroundColor(.accentColor)
                }
                .disabled(currentIndex == 0)
                
                Spacer()
                
                Text("\(currentIndex + 1)/\(sentences.count)")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        currentIndex = min(currentIndex + 1, sentences.count - 1)
                    }
                }) {
                    Image(systemName: "arrow.right.circle")
                        .font(.title)
                        .foregroundColor(.accentColor)
                }
                .disabled(currentIndex == sentences.count - 1)
            }
            .padding()
        }
        
        
    }
}

class ImagesViewModel: ObservableObject {
    private let imagesService = ImagesService()
    
    func fetchImage(query: String) async -> String? {
        do {
            if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let imageUrl = try await imagesService.getImageUrl(query: encodedQuery) {
                return imageUrl
            } else {
                print("Error")
                return nil
            }
        } catch {
            print("Error fetching image URL: \(error)")
            return nil
        }
    }
    
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadView(text: "I walk in the park. Hi")
    }
}




