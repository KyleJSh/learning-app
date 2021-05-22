//
//  ViewModel.swift
//  Learning App
//
//  Created by Kyle Sherrington on 2021-05-20.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    //  Current module
    @Published var currentModule:Module?
    var currentModuleIndex = 0
    
    init() {
        
        getLocalJson()
        
    }
    
    // MARK: - Data Methods
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
    
    // MARK: - Module Navigation Methods
    func beginModule (_ moduleId:Int) {
        
        // Find the index for module id
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
        
        
    }
    
}
