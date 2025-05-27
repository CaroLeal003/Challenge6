//
//  MusicNoteInfoBox.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 17/05/25.
//

import SwiftUI

struct MusicNoteInfoBox: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.system(.body, design: .monospaced))
                .bold()
        }
    }
}

#Preview {
    MusicNoteInfoBox(label: "La", value: "440 Hz")
}
