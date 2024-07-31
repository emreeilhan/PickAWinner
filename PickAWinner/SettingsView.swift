//
//  SettingsView.swift
//  PickAWinner
//
//  Created by Emre Ilhan on 7/31/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("showWinChance") private var showWinChance = true
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Toggle(isOn: $showWinChance) {
                        HStack{
                            Image(systemName: "percent")
                            Text("Show Win Chance")
                        }.bold()
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }

                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView()
}
