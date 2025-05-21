//
//  ContentView.swift
//  MyCoreData
//
//  Created by Development on 2025/05/21.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(sortDescriptors: [])
    var humans: FetchedResults<Human>

    var body: some View {
        List {
            ForEach(humans) { human in
                if (human.name?.isEmpty) == false {
                    Text(human.name!)
                }
            }

            Button(action: addHuman) {
                Text("人間を増やす")
            }
        }
    }

    func addHuman() {
        let newHuman = Human(context: viewContext)
        newHuman.name = "test_human"

        do {
            try viewContext.save()
        } catch {
            fatalError("Failed save.")
        }
    }
}

#Preview {
    ContentView()
}
