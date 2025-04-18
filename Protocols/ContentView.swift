//
//  ContentView.swift
//  Protocols
//
//  Created by Saurabh Dutta on 18/04/25.
//

import SwiftUI

struct ContentView: View {
    var vehicles: [Drivable] = [
        Car(name: "Scorpio N", year: "2025", emoji: "🚙"),
        Bike(name: "Pulse", year: "2009", emoji: "🏍️"),
        Car(name: "Creta", year: "2022", emoji: "🚙"),
        Car(name: "Baleno", year: "2016", emoji: "🚙")]
    
    var body: some View {
        NavigationStack {
            List(vehicles, id: \.id) { vehicle in
                HStack {
                    Text(vehicle.emoji)
                    Text(vehicle.name)
                    Spacer()
                    Text(vehicle.year)
                    Button("Start") {
                        vehicle.start()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

// Protocols are the standard set of instructions (can be either properties or functions) that other type in your code can adopt.


protocol Drivable {
    var id: UUID { get } // for unique id (making it identifiable)
    var name: String { get set } // Read and write
    var year: String { get set }
    var emoji: String { get set }
    var colour: String? { get } // Read only
    
    func start()
}

struct Car: Drivable {
    var id = UUID()
    var name: String
    var year: String
    var emoji: String
    var colour: String?
    
    func start() {
        print("Car Started!")
    }
}

struct Bike: Drivable {
    var id = UUID()
    var name: String
    var year: String
    var emoji: String
    var colour: String?
    
    func start() {
        print("Bike started!")
    }
}
