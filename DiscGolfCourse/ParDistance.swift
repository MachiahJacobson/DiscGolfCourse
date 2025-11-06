//
//  ParDistance.swift
//  DiscGolfCourse
//
//  Created by Jacobson, Machiah - Student on 11/6/25.
//

import SwiftUI

struct ParDistance: View {
    var body: some View {
        Text("Par/Distance")
            .font(.system(size: 70))
            .bold(true)
            .padding(.bottom, 80)
        VStack {
            Text("Hole 1: Par 3, Distance 318 ft")
            Text("Hole 2: Par 3, Distance 480 ft")
            Text("Hole 3: Par 3, Distance 308 ft")
            Text("Hole 4: Par 3, Distance 415 ft")
            Text("Hole 5: Par 3, Distance 449 ft")
            Text("Hole 6: Par 3, Distance 294 ft")
            Text("Hole 7: Par 3, Distance 426 ft")
            Text("Hole 8: Par 3, Distance 358 ft")
            Text("Hole 9: Par 3, Distance 404 ft")
            Text("Hole 10: Par 3, Distance 339 ft")
            Text("Hole 11: Par 3, Distance 276 ft")
            Text("Hole 12: Par 3, Distance 387 ft")
            Text("Hole 13: Par 3, Distance 322 ft")
            Text("Hole 14: Par 3, Distance 403 ft")
            Text("Hole 15: Par 3, Distance 415 ft")
            Text("Hole 16: Par 3, Distance 408 ft")
            Text("Hole 17: Par 3, Distance 614 ft")
            Text("Hole 18: Par 3, Distance 386 ft")
        }
        .font(.system(size: 40))
    }
}

#Preview {
    ParDistance()
}
