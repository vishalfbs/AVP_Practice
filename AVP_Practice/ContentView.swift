//
//  ContentView.swift
//  AVP_Practice
//
//  Created by fbs on 22/07/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var isVolumeSpace: Bool = false
    @State private var isImmersiveSpace: Bool = false
    @State private var showDetails: Bool = false
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            HStack{
                Toggle(isVolumeSpace ? "Close Volume Space" : "Open Volume Space", isOn: $isVolumeSpace)
                    .toggleStyle(.button)
                    .onChange(of: isVolumeSpace) { value in
                        if value {
                            openWindow(id: "Open my window")
                        }
                        else{
                            dismissWindow(id: "Open my window")
                        }
                    }
                    .glassBackgroundEffect()
                
                Toggle("Open Immversive Spave", isOn: $isImmersiveSpace)
                    .toggleStyle(.button)
                    .onChange(of: isImmersiveSpace){ value in
                        if value{
                            Task{
                                await openImmersiveSpace(id: "Immersive")
                            }
                            
                        }
                        else{
                            Task{
                                await dismissImmersiveSpace()
                            }
                          
                        }
                    }
                
                Button("show details"){
                   
                    showDetails.toggle()
                }
                if showDetails{
                    Text("Hello, World!")
                }
                
                 //   .glassBackgroundEffect()
            }
            .padding()
            
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}


struct Open3dModelView : View {
    var body: some View {
        Model3D(named: "Scene", bundle: realityKitContentBundle)
    }
}


struct OpenImmersiveView : View {
    var body: some View {
        Model3D(named: "Scene", bundle: realityKitContentBundle)
    }
}
