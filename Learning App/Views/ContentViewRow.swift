//
//  ContentViewRow.swift
//  Learning App
//
//  Created by Kyle Sherrington on 2021-05-22.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model:ContentModel
    
    var index:Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        // display lesson card
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack (spacing: 30) {
                
                Text(String(index + 1))
                    .bold()
                
                VStack (alignment: .leading) {
                    
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                    
                }
                
            }
            .padding()
            
        }
        .padding(.bottom, 5)
    }
}
