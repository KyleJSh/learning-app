//
//  ContentDetailView.swift
//  Learning App
//
//  Created by Kyle Sherrington on 2021-05-22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            // only show video if we get a valid url
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // TODO: description
            
            // Show xext lesson button only if there IS a next lesson
            
            if model.hasNextLesson() {
                
                Button(action: {
                    
                    // Advance to next lesson
                    model.nextLesson()
                    
                }, label: {
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .bold()
                            .foregroundColor(.white)
                        
                    }
                })
            }
        }
        .padding()
    }
}
