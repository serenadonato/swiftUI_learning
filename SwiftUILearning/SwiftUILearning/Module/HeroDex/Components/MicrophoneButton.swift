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
                    Circle()
                        .fill(.white)
                    Image(systemName: isRecording ? "mic.fill" : "mic.slash.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .padding()
                        .foregroundColor(isRecording ? .red : .gray)
                    
                    Circle()
                        .stroke(isRecording ? .red : .gray, lineWidth: 5)
                }
            }.frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .shadow(color: isRecording ? .white : .white, radius: 2, x: 0, y: 2)
        }
    }
}

struct MicrophoneButton_Previews: PreviewProvider {
    static var previews: some View {
        Color.red.ignoresSafeArea().overlay{
            MicrophoneButton()
        }
    }
}
