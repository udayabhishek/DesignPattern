//
//  ContentView.swift
//  MusicApp
//
//  Created by Uday Abhishek on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var stauts: Double = 0
    
    var body: some View {
        VStack {
            Image("music")
                .foregroundStyle(.tint)
                .cornerRadius(10)
                .padding()
           
            Text(isPlaying ? "Paused" : "Playing")
                .fontWeight(.medium)
            
            HStack {
                Button(action: {
                    
                },
                       label: {
                    Image(systemName: "backward.fill")
                    //                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                })
                //                Spacer()
                
                Button(action: {
                    isPlaying.toggle()
                },
                       label: {
                    Image(systemName: isPlaying ? "play.fill" : "pause")
                    //                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                })
                //                Spacer()
                
                Button(action: {
                    
                },
                       label: {
                    Image(systemName: "forward.fill")
                    //                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
