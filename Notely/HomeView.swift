//
//  HomeView.swift
//  Notely
//
//  Created by Marasy Phi on 12/1/21.
//

import SwiftUI

struct HomeView: View {
    
    private var _leadingTitle: some View {
        Text("My Notes")
            .font(.primary(.bold, size: 23))
            .foregroundColor(.darkerText)
    }
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color.primaryBackground)
        UINavigationBar.appearance().tintColor = UIColor(Color.primaryBackground)
        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search anything", text: .constant(""))
                        .font(.primary(.medium))
                }
                .foregroundColor(.lightText)
                .padding()
                .background(Color.secondaryColor)
                .cornerRadius(6)
                .padding()
                NoteTypeView()
                ZStack(alignment: .bottomTrailing) {
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                        ForEach(Note.dummies) { eachNote in
                            NoteViewItem(note: eachNote)
                        }
                    })
                    
                    NavigationLink(destination: NoteDetailView.init()) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Create")
                                .font(.primary(.semiBold, size: 16))
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 130, height: 52)
                        .background(Color.primaryColor)
                        .cornerRadius(30.5)
                        .padding(.trailing)
                    }
                }
            }
            .background(Color.primaryBackground)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: _leadingTitle, trailing: Image("profile"))
        }
    }
    
}

struct NoteTypeView: View {
    
    @State var selectedType: TypeView = .allNotes
    
    enum TypeView: String, CaseIterable, Identifiable {
        
        var id: String {
            if case .allNotes = self {
                return "All Notes"
            }
            return rawValue.capitalized
        }
        
        case allNotes
        case reminder
        case audio
        case images
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(TypeView.allCases) { eachType in
                    Button(action: {
                        selectedType = eachType
                    }, label: {
                        Text(eachType.id)
                            .font(.primary(.medium))
                            .foregroundColor(selectedType == eachType ? .white : .darkText)
                            .padding()
                    })
                    .frame(height: 34)
                    .background(selectedType == eachType ? Color.primaryColor : .secondaryColor)
                    .cornerRadius(4)
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
        })
    }
    
}

struct NoteViewItem : View {
    
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            HStack(spacing: 14) {
                Image(systemName: note.type.displayImage)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(note.type.displayColor)
                    .cornerRadius(20)
                VStack(alignment: .leading, spacing: 4) {
                    Text(note.title)
                        .foregroundColor(.darkerText)
                        .font(.primary(.semiBold, size: 16))
                    Text(note.date)
                        .foregroundColor(.darkText)
                        .font(.primary(.medium, size: 12))
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .background(Color.lightGrey)
                .padding(.trailing)
                .padding(.leading)
            
            note.image != nil ? Image(note.image!)
                .frame(maxWidth: .infinity)
                .padding(.top)
                .cornerRadius(8) : nil
            
            note.description != nil ? Text(note.description!)
                .fixedSize(horizontal: false, vertical: true)
                .font(.primary(.regular))
                .foregroundColor(.darkText)
                .lineSpacing(10.0)
                .padding() : nil
            
            note.type == .audio ?
                HStack(spacing: 4) {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.primaryColor)
                        .cornerRadius(15)
                    Image("audio.sample")
                        .frame(maxWidth: .infinity)
                    // replace with real audio
                }.padding() : nil
        })
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
        .padding()
    }
    
}

private extension Note.`Type` {
    
    var displayImage: String {
        switch self {
        case .audio:
            return "music.note"
        case .document:
            return "doc"
        case .reminder:
            return "bell"
        }
    }
    
    var displayColor: Color {
        switch self {
        case .audio:
            return .primaryRed
        case .document:
            return .primaryColor
        case .reminder:
            return .primaryGreen
        }
    }
    
}

struct HomeViewPreview: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}

