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
    
    // Current lesson
    @Published var currentLesson:Lesson?
    var currentLessonIndex = 0
    
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
    
    func beginLesson(_ lessonIndex: Int) {
        
        // Check it's within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        
        // Set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func nextLesson() {
        
        // Advance the lesson index
        currentLessonIndex += 1
        
        // Check that it's within range
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            // Set current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else {
            // reset the lesson state
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    func hasNextLesson() -> Bool {
    
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
}
