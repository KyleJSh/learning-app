//
//  HomeViewRow.swift
//  Learning App
//
//  Created by Kyle Sherrington on 2021-05-21.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                // image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                // text
                VStack (alignment: .leading, spacing: 5) {
                    // headline
                    Text(title)
                        .bold()
                    
                    // description
                    Text(description)
                        .font(Font.system(size: 10))
                        .padding(.bottom, 20)
                    
                    // icons
                    HStack (spacing: 4) {
                        // number of lessons/questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text(count)
                            .font(Font.system(size: 8))
                        // time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                        Text(time)
                            .font(Font.system(size: 8))
                        
                    }
                    
                }
                .padding(.leading, 10)
                
            }
            .padding(.horizontal, 20)
            
        }
        .padding(10)
        
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "some description", count: "10 lessons", time: "2 hours")
    }
}
