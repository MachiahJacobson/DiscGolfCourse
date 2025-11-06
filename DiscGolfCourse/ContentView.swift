//
//  ContentView.swift
//  DiscGolfCourse
//
//  Created by Jacobson, Machiah - Student on 10/23/25.
//

import SwiftUI
import MapKit

let location1a = CLLocationCoordinate2D(latitude: 40.5564509, longitude: -105.1390831)
let location1b = CLLocationCoordinate2D(latitude: 40.5565559, longitude: -105.1379600)
let location2a = CLLocationCoordinate2D(latitude: 40.5566772, longitude: -105.1375496)
let location2b = CLLocationCoordinate2D(latitude: 40.5569357, longitude: -105.1367495)
let location3a = CLLocationCoordinate2D(latitude: 40.5571974, longitude: -105.1357486)
let location3b = CLLocationCoordinate2D(latitude: 40.5570549, longitude: -105.1347512)
let location4a = CLLocationCoordinate2D(latitude: 40.55755, longitude: -105.13544)
let location4b = CLLocationCoordinate2D(latitude: 40.55746, longitude: -105.13697)
let location5a = CLLocationCoordinate2D(latitude: 40.55776, longitude: -105.13708)
let location5b = CLLocationCoordinate2D(latitude: 40.55788, longitude: -105.13545)
let location6a = CLLocationCoordinate2D(latitude: 40.55770, longitude: -105.13526)
let location6b = CLLocationCoordinate2D(latitude: 40.55753, longitude: -105.13420)
let location7a = CLLocationCoordinate2D(latitude: 40.55781, longitude: -105.13455)
let location7b = CLLocationCoordinate2D(latitude: 40.55838, longitude: -105.13588)
let location8a = CLLocationCoordinate2D(latitude: 40.55834, longitude: -105.13627)
let location8b = CLLocationCoordinate2D(latitude: 40.55845, longitude: -105.13754)
let location9a = CLLocationCoordinate2D(latitude: 40.55882, longitude: -105.13707)
let location9b = CLLocationCoordinate2D(latitude: 40.55858, longitude: -105.13565)
let location10a = CLLocationCoordinate2D(latitude: 40.558376, longitude: -105.135466)
let location10b = CLLocationCoordinate2D(latitude: 40.558763, longitude: -105.134242)
let location11a = CLLocationCoordinate2D(latitude: 40.558885, longitude: -105.134107)
let location11b = CLLocationCoordinate2D(latitude: 40.559135, longitude: -105.134385)
let location12a = CLLocationCoordinate2D(latitude: 40.559379, longitude: -105.134151)
let location12b = CLLocationCoordinate2D(latitude: 40.559030, longitude: -105.135471)
let location13a = CLLocationCoordinate2D(latitude: 40.558914, longitude: -105.135949)
let location13b = CLLocationCoordinate2D(latitude: 40.559783, longitude: -105.135804)
let location14a = CLLocationCoordinate2D(latitude: 40.559697, longitude: -105.135522)
let location14b = CLLocationCoordinate2D(latitude: 40.560467, longitude: -105.134485)
let location15a = CLLocationCoordinate2D(latitude: 40.560616, longitude: -105.134974)
let location15b = CLLocationCoordinate2D(latitude: 40.560337, longitude: -105.136424)
let location16a = CLLocationCoordinate2D(latitude: 40.560543, longitude: -105.136820)
let location16b = CLLocationCoordinate2D(latitude: 40.559436, longitude: -105.137056)
let location17a = CLLocationCoordinate2D(latitude: 40.558889, longitude: -105.137061)
let location17b = CLLocationCoordinate2D(latitude: 40.558592, longitude: -105.139183)
let location18a = CLLocationCoordinate2D(latitude: 40.558345, longitude: -105.139454)
let location18b = CLLocationCoordinate2D(latitude: 40.557291, longitude: -105.139472)


struct Place: Identifiable {
    var id = UUID()
    var name: String
    var tee: CLLocationCoordinate2D
    var basket: CLLocationCoordinate2D
    var score: Int? = nil
}


struct ContentView: View {
    @State private var places = [
        Place(name:"Hole 1", tee: location1a, basket: location1b),
        Place(name:"Hole 2", tee: location2a, basket: location2b),
        Place(name:"Hole 3", tee: location3a, basket: location3b),
        Place(name:"Hole 4", tee: location4a, basket: location4b),
        Place(name:"Hole 5", tee: location5a, basket: location5b),
        Place(name:"Hole 6", tee: location6a, basket: location6b),
        Place(name:"Hole 7", tee: location7a, basket: location7b),
        Place(name:"Hole 8", tee: location8a, basket: location8b),
        Place(name:"Hole 9", tee: location9a, basket: location9b),
        Place(name:"Hole 10", tee: location10a, basket: location10b),
        Place(name:"Hole 11", tee: location11a, basket: location11b),
        Place(name:"Hole 12", tee: location12a, basket: location12b),
        Place(name:"Hole 13", tee: location13a, basket: location13b),
        Place(name:"Hole 14", tee: location14a, basket: location14b),
        Place(name:"Hole 15", tee: location15a, basket: location15b),
        Place(name:"Hole 16", tee: location16a, basket: location16b),
        Place(name:"Hole 17", tee: location17a, basket: location17b),
        Place(name:"Hole 18", tee: location18a, basket: location18b)
    ]
    
    @State private var selectedPlaceIndex: Int? = nil
    @State private var camera: MapCameraPosition = .automatic
    @State private var showScores = false
    
    var body: some View {
        NavigationStack {
        ZStack(alignment: .bottom) {
            Map(position: $camera, selection: $selectedPlaceIndex) {
                ForEach(places.indices, id: \.self) { index in
                    let place = places[index]
                    let color = colorForScore(place.score)
                    
                    Marker(place.name, systemImage: "flag.fill", coordinate: place.tee)
                        .tint(color)
                        .tag(index)
                    
                    Marker("", systemImage: "circle.fill", coordinate: place.basket)
                        .tint(.green)
                }
            }
            .mapStyle(.hybrid)
            .ignoresSafeArea()
            .onChange(of: selectedPlaceIndex) { _, newValue in
                updateCamera(for: newValue)
            }
            VStack(spacing: 0) {
                HStack() {
                    Button(action: {
                        let centerLocation = CLLocationCoordinate2D(latitude: 40.5585, longitude: -105.1369)
                        camera = .region(MKCoordinateRegion(center: centerLocation, latitudinalMeters: 500, longitudinalMeters: 500))
                    }) {
                        Image(systemName: "map")
                            .font(.title2)
                            .padding()
                            .background(Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    .padding()
                    Spacer()
                        NavigationLink{
                             ParDistance()
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .padding()
                                .background(Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }

                    }
                Spacer()
                }
            }

            VStack(spacing: 0) {
                Button {
                    withAnimation(.spring()) {
                        showScores.toggle()
                    }
                } label: {
                    Label(showScores ? "Hide Scores" : "Show Scores",
                          systemImage: showScores ? "chevron.down" : "chevron.up")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                }
                
                if showScores {
                    VStack(spacing: 0) {
                        List {
                            ForEach(places.indices, id: \.self) { index in
                                HStack {
                                    Text(places[index].name)
                                    Spacer()
                                    TextField("Score", value: $places[index].score, format: .number)
                                        .keyboardType(.numberPad)
                                        .frame(width: 60)
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .frame(height: UIScreen.main.bounds.height * 0.35)
                        
                        Button {
                            if let index = selectedPlaceIndex {
                                selectedPlaceIndex = (index + 1) % places.count
                            } else {
                                selectedPlaceIndex = 0
                            }
                        } label: {
                            Text("Next Hole")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                        }
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .padding(.bottom, 8)
            .background(.clear)
        }
    }
    
    func colorForScore(_ score: Int?) -> Color {
        guard let score = score else { return .gray }
        if score < 3 { return .blue }
        else if score == 3 { return .orange }
        else { return .red }
    }
    
    func updateCamera(for index: Int?) {
        guard let index = index else { return }
        let place = places[index]
        let midx = (place.tee.longitude + place.basket.longitude) / 2
        let midy = (place.tee.latitude + place.basket.latitude) / 2
        let midpt = CLLocationCoordinate2D(latitude: midy, longitude: midx)
        camera = .region(MKCoordinateRegion(center: midpt, latitudinalMeters: 150, longitudinalMeters: 150))
    }
}

#Preview {
    ContentView()
}
