//
//  MicrophoneButton.swift
//  SwiftUILearning
//
//  Created by Facundo Barboza on 19/09/2023.
//

import SwiftUI

struct MicrophoneButton: View {
    
    @State private var isRecording = false
//        var audioRecorder: AudioRecorder?
        
        var body: some View {
                ZStack {
                    Button(action: {
                        self.isRecording.toggle()
                        if self.isRecording {
                            // audioRecorder?.startRecording()
                        } else {
                            // audioRecorder?.stopRecording()
                        }
                    }) {
                        ZStack {
                            Image(systemName: isRecording ? "mic.fill" : "mic.slash.fill")
                                .resizable()
                                .frame(width: isRecording ? 40 : 50, height: 50)
                                .padding()
                                .foregroundColor(isRecording ? .red : .blue)
                            Circle()
                                .stroke(isRecording ? .red : .blue, lineWidth: 5)
                        }
                    }.frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                }
        }
}

struct MicrophoneButton_Previews: PreviewProvider {
    static var previews: some View {
        MicrophoneButton()
    }
}
