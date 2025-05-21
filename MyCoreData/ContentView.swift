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

    @State var name = ""

    var body: some View {
        List {
            ForEach(humans) { human in
                if (human.name?.isEmpty) == false {
                    HStack {
                        if human.checked {
                            Text("☑︎")
                        } else {
                            Text("◻︎")
                        }
                        Button(action: {
                            human.checked.toggle()
                        }) {
                            Text(human.name!)
                        }
                    }
                }
            }

            TextField("人間の名前", text: $name)
                .onSubmit {
                    addHuman()
                }
        }
    }

    func addHuman() {
        let newHuman = Human(context: viewContext)
        newHuman.name = name

        do {
            try viewContext.save()
        } catch {
            fatalError("Failed save.")
        }

        name = ""
    }
}

#Preview {
    ContentView()
}
