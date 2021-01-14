//
//  Note.swift
//  Notely
//
//  Created by Marasy Phi on 12/1/21.
//

import Foundation

struct Note: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    let title: String
    let date: String
    let description: String?
    let image: String?
    let type: Type
    
    enum `Type` {
        case audio
        case document
        case reminder
    }
    
    static let dummies = [
        Note(title: "365 Days Coding Challenge", date: "1 Jan 2021, 02:38 PM", description: "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob……", image: "note.image", type: .reminder),
        Note(title: "Swift UI Speed Code", date: "24 Nov 2020, 02:38 PM", description: "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob……", image: "note.image", type: .document),
        Note(title: "My Violin Class", date: "11 Jan 2021, 02:38 PM", description: nil, image: nil, type: .audio),
        Note(title: "My Coding class", date: "9 Jan 2021, 02:38 PM", description: "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob……", image: nil, type: .document),
        Note(title: "My Guitar Class", date: "24 Nov 2020, 02:38 PM", description: nil, image: nil, type: .audio),
        Note(title: "SwiftUI Tutorial", date: "24 Nov 2020, 02:38 PM", description: "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob……", image: "note.image", type: .document),
    ]
    
}
