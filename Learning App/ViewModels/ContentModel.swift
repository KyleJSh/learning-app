//
//  ViewModel.swift
//  Learning App
//
//  Created by Kyle Sherrington on 2021-05-20.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    init() {
        
        getLocalJson()
        
    }
    
    func getLocalJson() {
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        guard url != nil else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url!)
            
            let modules = try JSONDecoder().decode([Module].self, from: data)
            
            self.modules = modules
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
