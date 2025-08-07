//
//  AVP_PracticeApp.swift
//  AVP_Practice
//
//  Created by fbs on 22/07/25.
//

import SwiftUI

@main
struct AVP_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "Open window"){
            Open3dModelView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.5, in: .meters)
        
        ImmersiveSpace(id: "Immersive"){
            OpenImmersiveView()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}
