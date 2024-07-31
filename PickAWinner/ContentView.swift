//
//  ContentView.swift
//  PickAWinner
//
//  Created by Emre Ilhan on 31.07.2024.
//

import SwiftUI
import ConfettiSwiftUI
import SPIndicator

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
    @State private var showSameInputAlertView = false
    @AppStorage("showWinChance") private var showWinChance = true
    @State private var showSettingView = false
     private var winnerChance: Double {
        let totalEntrants = Double(list.count)
         return 100 / totalEntrants
    }
    
    
    var body: some View {
        NavigationStack{
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
                    ScrollView{
                        LazyVStack{
                            ForEach(list, id: \.self) { item in
                                HStack{
                                    Text(item)
                                        .foregroundStyle(.primary)
                                        .padding(item == winner ? 8 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(item == winner ? .green : .clear)
                                        .clipShape(.rect(cornerRadius: 9))
                                    Button {
                                        withAnimation{
                                            list.removeAll(where: { $0 == item })
                                            winner = nil
                                        }
                                    } label: {
                                        Image(systemName: "trash.circle.fill")
                                            .foregroundColor(.red)
                                            .padding(4)
                                            .font(.title3)
                                    }
                                    
                                }
                            }
                            
                        }
                        .padding()
                    }
                }
                Spacer()
                VStack(alignment: .leading) {
                    if let winner = winner {
                        HStack{
                            Text("The winner is: ")
                            Text("\(winner)")
                                .foregroundStyle(.green)
                        }
                        .padding(.horizontal)
                        .bold()
                            
                        if showWinChance {
                            Text("Winner chance was \(winnerChance,specifier: "%.2f")% " )
                                .bold()
                                .padding(.horizontal)
                        }
                    }
                }
                
                
                HStack{
                    Button{
                        if list.contains(name) {
                            showSameInputAlertView.toggle()
                        }
                        else if !name.isEmpty, !list.contains(name) {
                            list.append(name)
                            name = ""
                        }
                    } label: {
                        Text("Add")
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(.rect(cornerRadius: 15))
                    }
                    //Button in order to delete all elements of list
                    Button {
                        if !list.isEmpty {
                            list.removeAll()
                            winner = nil
                            giveSuccessHapticFeedback()
                        }
                    } label: {
                        Text("Delete All")
                            .padding()
                            .foregroundStyle(.white)
                            .background(.red)
                            .clipShape(.rect(cornerRadius: 15))
                        
                    }
                    
                    //Button for pick a random entrant
                    Button{
                        withAnimation {
                            winner = list.randomElement()
                            if winner != nil {
                                giveSuccessHapticFeedback()
                                UIApplication.shared.endEditing()
                                counter += 1
                                
                            }
                        }
                    } label: {
                        Text("Pick a Winner")
                            .padding()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .background(.orange)
                            .clipShape(.rect(cornerRadius: 15))
                    }.confettiCannon(counter: $counter, num: 50)
                    
                }
                
            }
            
            
            .SPIndicator(
                isPresent: $showSameInputAlertView,
                title: "Same Input",
                message: "Please enter a unique name.",
                duration: 2.0,
                presentSide: .top,
                preset: .error
                
                
            )
            .padding()
            .sheet(isPresented: $showSettingView, content: {
                SettingsView()
                    .presentationDetents([.fraction(0.7)])
                    .presentationCornerRadius(30)
            })
            
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSettingView = true
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
               

            }
        }
        
        
    }
        
        //Function for hapticfeedback
    func giveSuccessHapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

#Preview {
    ContentView()
}
