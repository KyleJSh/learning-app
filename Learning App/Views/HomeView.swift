//
//  HomeView.swift
//  Learning App
//
//  Created by Kyle Sherrington on 2021-05-19.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach (model.modules) { module in
                    
                    // learning card
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                        
                        HStack {
                            // image
                            Image(module.content.image)
                                .resizable()
                                .frame(width: 116, height: 116)
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            // text
                            VStack (alignment: .leading, spacing: 10) {
                                // headline
                                Text("Learn \(module.category)")
                                    .bold()
                                
                                // description
                                Text(module.content.description)
                                    .font(Font.system(size: 12))
                                    .padding(.bottom, 20)
                                
                                // icons
                                HStack {
                                    // number of lessons/questions
                                    Image(systemName: "text.book.closed")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("\(module.content.lessons.count) Lessons")
                                        .font(.caption)
                                    // time
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    
                                    Text(module.content.time)
                                        .font(.caption)
                                    
                                }
                                
                            }
                            .padding(.leading, 20)
                            
                        }
                        .padding(.horizontal, 20)
                        
                    }
                    .padding(.horizontal)
                    
                    // test card
                    
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
