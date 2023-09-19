//
//  MessageListView.swift
//  Enkanto
//
//  Created by Iuri Ferreira on 18/09/23.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm : MessageListVM = MessageListVM()
    
    @State private var searchText : String = ""
    @State private var isEditing : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search Matches", text:$searchText)
                        .padding(7)
                        .padding(.horizontal,25)
                        .background(Color.textfieldBG)
                        .cornerRadius(8)
                        .overlay(content: {
                            HStack() {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading,5)
                                Spacer()
                            }
                        })
                        .padding()
                        .onTapGesture {
                            isEditing = true
                        }
                        .animation(.easeIn(duration: 0.10))
                    
                    CancelButton(isEditing: $isEditing, searchText: $searchText)
                }
                
                
                ZStack {
                    VStack {
                        ScrollView {
                            ForEach(vm.messagePreview.filter({ preview in
                                displayPreview(preview)
                            }), id:\.self) { preview in
                                NavigationLink {
                                    ChatView(person: preview.person)
                                } label: {
                                    MessageRowView(preview: preview)
                                        
                                }
                                .buttonStyle(PlainButtonStyle())
                                .animation(.easeIn, value: 0.25)
                                .transition(.slide)
                            }
                        }
                    }
                    searchText.isEmpty ? Color.white.opacity(0.0) : Color.white.opacity(0.5)
                }
                
                Spacer()
            }
        }
    }
    
   
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
            MessageListView()
        
    }
}

struct CancelButton : View {
    
    @Binding var isEditing: Bool
    @Binding var searchText: String
    
    var body: some View {
        if isEditing {
            Button {
                isEditing = false
                searchText = ""
                self.endEditing(true)
            } label: {
                Text("Cancel")
                    .foregroundColor(.red)
                
            }
            .padding(.trailing,10)
            .transition(.move(edge: .trailing))
            .animation(.easeIn(duration: 0.10))
        }
    }
}

extension MessageListView {
    func displayPreview(_ preview: MessagePreview) -> Bool {
        
        if searchText.isEmpty { return true }
        
        if preview.person.name.contains(searchText) { return true }
        
        if preview.lastMessage.contains(searchText) { return true }
        
        return false
    }
}
