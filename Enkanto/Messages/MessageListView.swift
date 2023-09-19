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
                
                
                VStack {
                    ScrollView {
                        ForEach(vm.messagePreview, id:\.self) { preview in
                            NavigationLink {
                                ChatView(person: preview.person)
                            } label: {
                                MessageRowView(preview: preview)
                            }
                            .foregroundColor(Color.textTitle)
                        }
                    }
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
