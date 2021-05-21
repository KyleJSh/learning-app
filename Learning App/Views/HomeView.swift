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
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("What do you want do to today?")
                    .padding(.leading, 20)
                ScrollView {
                    LazyVStack {
                        ForEach (model.modules) { module in
                            VStack (spacing: 20) {
                                // learning card
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                
                                
                                // test card
                                HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Get Started")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
