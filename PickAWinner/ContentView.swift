//
//  ContentView.swift
//  PickAWinner
//
//  Created by Emre Ilhan on 31.07.2024.
//

import SwiftUI
import ConfettiSwiftUI

//Keyboard closing
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    //MARK: Variables
    @State private var list: [String] = []
    @State private var name: String = ""
    @State private var winner: String?
    @FocusState private var isFocused: Bool
    @State private var counter = 0
    var body: some View {
        VStack(alignment: .leading) {
            Text("Entrants")
                .bold()
            TextField("Enter your name", text: $name)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 15))
                .focused($isFocused)
                .onSubmit {
                    if !name.isEmpty {
                        list.append(name)
                        name = ""
                        isFocused = true
                    }
                }
            if !list.isEmpty {
                List(list, id: \.self) { item in
                    Text(item)
                        .foregroundStyle(.primary)
                        .padding(item == winner ? 10 : 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(item == winner ? .green : .clear)
                        .clipShape(.rect(cornerRadius: 13))
                        
                }
                .listStyle(.plain)
            }
            if let winner = winner {
                Text("The winner is: \(winner)")
                    .bold()
                    .padding()
            }
            HStack{
                Button{
                    if !name.isEmpty {
                        list.append(name)
                        name = ""
                        
                    }
                } label: {
                    Text("Add")
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 15))
                }
                //Button for pick a random entrant
                Button{
                    withAnimation {
                        winner = list.randomElement()
                         if winner != nil {
                             UIApplication.shared.endEditing()
                             counter += 1
                             
                         }
                    }
                } label: {
                    Text("Pick a Winner")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.orange)
                        .clipShape(.rect(cornerRadius: 15))
                }.confettiCannon(counter: $counter, num: 50)
                
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
